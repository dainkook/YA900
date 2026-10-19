package com.kedu.crawler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kedu.dao.ScheduleDAO;
import com.kedu.dto.ScheduleDTO;

@Component
public class UpdateScheduler {

    @Autowired
    private ScheduleDAO scheduleDAO;

    private final ObjectMapper mapper = new ObjectMapper();

    /*
     * 3시간마다 실행
     */
    @Scheduled(fixedRate = 10800000)
    public void updateSchedule() {
        System.out.println();
        System.out.println("========================================");
        System.out.println("경기 정보 자동 업데이트 시작");
        System.out.println("업데이트 시간 : " + new Timestamp(System.currentTimeMillis()));
        System.out.println("========================================");

        try {
            LocalDate today = LocalDate.now();
            updateGames(today);
        } catch (Exception e) {
            System.out.println("경기 정보 업데이트 중 오류 발생");
            e.printStackTrace();
        }

        System.out.println("========================================");
        System.out.println("경기 정보 자동 업데이트 종료");
        System.out.println("========================================");
    }

    /*
     * 특정 날짜의 경기 정보를 Naver에서 가져옴
     */
    private void updateGames(LocalDate date) throws Exception {
        String targetDate = date.toString();

        String url = "https://api-gw.sports.naver.com/schedule/games"
                + "?upperCategoryId=kbaseball"
                + "&fromDate=" + targetDate
                + "&toDate=" + targetDate;

        URL requestUrl = new URL(url);
        HttpURLConnection con = (HttpURLConnection) requestUrl.openConnection();

        con.setRequestMethod("GET");
        con.setRequestProperty("User-Agent", "Mozilla/5.0");

        int responseCode = con.getResponseCode();

        if (responseCode != 200) {
            System.out.println("Naver API 오류 : " + responseCode);
            con.disconnect();
            return;
        }

        BufferedReader br = new BufferedReader(
                new InputStreamReader(con.getInputStream(), "UTF-8"));

        String line;
        StringBuilder result = new StringBuilder();

        while ((line = br.readLine()) != null) {
            result.append(line);
        }

        br.close();
        con.disconnect();

        JsonNode root = mapper.readTree(result.toString());
        JsonNode games = root.path("result").path("games");

        if (!games.isArray()) {
            System.out.println("경기 데이터 없음 : " + targetDate);
            return;
        }

        System.out.println("오늘 경기 개수 : " + games.size());

        for (JsonNode game : games) {
            updateGame(game);
        }
    }

    /*
     * 경기 하나를 DB에 저장하거나 업데이트
     */
    private void updateGame(JsonNode game) {
        try {
            String gameId = game.path("gameId").asText();
            String gameDateTime = game.path("gameDateTime").asText();
            String home = game.path("homeTeamName").asText();
            String away = game.path("awayTeamName").asText();

            /*
             * 팀 정보가 없는 데이터는 제외
             */
            if (home.isEmpty() || away.isEmpty()) {
                System.out.println("팀 정보 없음 → 업데이트 제외");
                return;
            }

            String homeTeamName = normalizeTeamName(home);
            String awayTeamName = normalizeTeamName(away);

            int homeId = scheduleDAO.findTeamId(homeTeamName);
            int awayId = scheduleDAO.findTeamId(awayTeamName);

            if (homeId == 0 || awayId == 0) {
                System.out.println("팀 ID 조회 실패 : " + awayTeamName + " vs " + homeTeamName);
                return;
            }

            /*
             * 경기 시작 시간
             */
            Timestamp startDate = null;

            if (!gameDateTime.isEmpty()) {
                startDate = Timestamp.valueOf(LocalDateTime.parse(gameDateTime));
            }

            /*
             * 현재 점수
             */
            int homeScore = getScore(game, "homeScore", "homeTeamScore", "home_score");
            int awayScore = getScore(game, "awayScore", "awayTeamScore", "away_score");

            /*
             * 현재 경기 상태
             */
            String gameStatus = getGameStatus(game);

            /*
             * Naver에서 상태값을 못 가져왔을 경우
             */
            if (gameStatus == null || gameStatus.isEmpty()) {
                if (isGameFinished(game)) {
                    gameStatus = "경기종료";
                } else if (startDate != null
                        && startDate.before(new Timestamp(System.currentTimeMillis()))) {
                    gameStatus = "진행중";
                } else {
                    gameStatus = "경기예정";
                }
            }

            /*
             * 종료 경기의 승자 계산
             */
            int winnerId = 0;

            if ("경기종료".equals(gameStatus)) {
                if (homeScore > awayScore) {
                    winnerId = homeId;
                } else if (awayScore > homeScore) {
                    winnerId = awayId;
                }
            }

            ScheduleDTO dto = new ScheduleDTO();
            dto.setNaver_game_id(gameId);
            dto.setTitle(awayTeamName + " vs " + homeTeamName);
            dto.setLocation(scheduleDAO.findStadium(homeId));
            dto.setStart_date(startDate);
            dto.setHome_id(homeId);
            dto.setAway_id(awayId);
            dto.setHome_score(homeScore);
            dto.setAway_score(awayScore);
            dto.setWinner_id(winnerId);
            dto.setGame_status(gameStatus);

            /*
             * DB에 이미 있는 경기인지 확인
             */
            ScheduleDTO existingGame = scheduleDAO.selectByNaverGameId(gameId);

            if (existingGame == null) {
                /*
                 * 새로운 경기
                 */
                int result = scheduleDAO.insertSchedule(dto);

                if (result > 0) {
                    System.out.println("새 경기 저장 : " + dto.getTitle());
                }
            } else {
                /*
                 * 기존 경기
                 */
                int result = scheduleDAO.updateScheduleResult(dto);

                if (result > 0) {
                    System.out.println(
                            "경기 업데이트 : " + dto.getTitle()
                            + " / " + awayScore + " : " + homeScore
                            + " / " + gameStatus
                    );
                }
            }

        } catch (Exception e) {
            System.out.println("경기 업데이트 실패");
            e.printStackTrace();
        }
    }

    /*
     * Naver 점수 가져오기
     */
    private int getScore(JsonNode game, String... fieldNames) {
        for (String fieldName : fieldNames) {
            JsonNode node = game.get(fieldName);

            if (node != null && !node.isNull() && node.isNumber()) {
                return node.asInt();
            }

            if (node != null && !node.isNull()
                    && node.isTextual() && !node.asText().isEmpty()) {
                try {
                    return Integer.parseInt(node.asText());
                } catch (Exception e) {
                }
            }
        }

        return 0;
    }

    /*
     * Naver 경기 상태값 변환
     */
    private String getGameStatus(JsonNode game) {
        String[] fieldNames = {
                "gameStatus",
                "status",
                "game_status"
        };

        for (String fieldName : fieldNames) {
            JsonNode node = game.get(fieldName);

            if (node != null && !node.isNull() && !node.asText().isEmpty()) {
                String status = node.asText();

                /*
                 * 경기 종료
                 */
                if (status.equals("END") || status.equals("FINISHED")
                        || status.equals("FINAL") || status.equals("종료")
                        || status.equals("경기종료")) {
                    return "경기종료";
                }

                /*
                 * 경기 예정
                 */
                if (status.equals("BEFORE") || status.equals("SCHEDULED")
                        || status.equals("예정") || status.equals("경기예정")) {
                    return "경기예정";
                }

                /*
                 * 진행중
                 */
                if (status.equals("LIVE") || status.equals("PLAYING")
                        || status.equals("IN_PROGRESS") || status.equals("진행중")) {
                    return "진행중";
                }
            }
        }

        return "";
    }

    /*
     * 경기 종료 여부
     */
    private boolean isGameFinished(JsonNode game) {
        String[] fieldNames = {
                "gameStatus",
                "status",
                "game_status"
        };

        for (String fieldName : fieldNames) {
            JsonNode node = game.get(fieldName);

            if (node != null && !node.isNull()) {
                String status = node.asText();

                if (status.equals("END") || status.equals("FINISHED")
                        || status.equals("FINAL") || status.equals("종료")
                        || status.equals("경기종료")) {
                    return true;
                }
            }
        }

        return false;
    }

    /*
     * Naver 팀 이름 → DB 팀 이름
     */
    private String normalizeTeamName(String teamName) {
        if (teamName.equals("LG 트윈스")) return "LG";
        if (teamName.equals("KT 위즈")) return "KT";
        if (teamName.equals("삼성 라이온즈")) return "삼성";
        if (teamName.equals("한화 이글스")) return "한화";
        if (teamName.equals("NC 다이노스")) return "NC";
        if (teamName.equals("두산 베어스")) return "두산";
        if (teamName.equals("SSG 랜더스")) return "SSG";
        if (teamName.equals("키움 히어로즈")) return "키움";
        if (teamName.equals("롯데 자이언츠")) return "롯데";
        if (teamName.equals("KIA 타이거즈")) return "KIA";

        return teamName;
    }
}