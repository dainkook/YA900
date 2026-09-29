package com.kedu.crawler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kedu.dao.ScheduleDAO;
import com.kedu.dto.ScheduleDTO;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class ScheduleCrawler {

    public static void main(String[] args) throws Exception {

        ApplicationContext context =
                new FileSystemXmlApplicationContext(
                        "src/main/webapp/WEB-INF/spring/root-context.xml"
                );

        ScheduleDAO dao =
                context.getBean(ScheduleDAO.class);

        ObjectMapper mapper =
                new ObjectMapper();

        int totalGameCount = 0;
        int saveGameCount = 0;
        int skipGameCount = 0;

        int noTeamCount = 0;
        int noTeamIdCount = 0;

        for (int month = 1; month <= 12; month++) {

            LocalDate firstDay =
                    LocalDate.of(2026, month, 1);

            LocalDate lastDay =
                    firstDay.withDayOfMonth(
                            firstDay.lengthOfMonth()
                    );

            for (LocalDate date = firstDay;
                 !date.isAfter(lastDay);
                 date = date.plusDays(1)) {

                String targetDate =
                        date.toString();

                System.out.println(
                        "========================================"
                );

                System.out.println(
                        "크롤링 날짜 : " + targetDate
                );

                String url =
                        "https://api-gw.sports.naver.com/schedule/games"
                        + "?upperCategoryId=kbaseball"
                        + "&fromDate=" + targetDate
                        + "&toDate=" + targetDate;

                URL requestUrl =
                        new URL(url);

                HttpURLConnection con =
                        (HttpURLConnection)
                        requestUrl.openConnection();

                con.setRequestMethod("GET");

                con.setRequestProperty(
                        "User-Agent",
                        "Mozilla/5.0"
                );

                int responseCode =
                        con.getResponseCode();

                if (responseCode != 200) {

                    System.out.println(
                            "API 오류 : "
                            + responseCode
                            + " / "
                            + targetDate
                    );

                    con.disconnect();

                    continue;
                }

                BufferedReader br =
                        new BufferedReader(
                                new InputStreamReader(
                                        con.getInputStream(),
                                        "UTF-8"
                                )
                        );

                String line;

                StringBuilder result =
                        new StringBuilder();

                while ((line = br.readLine()) != null) {
                    result.append(line);
                }

                br.close();

                con.disconnect();

                JsonNode root =
                        mapper.readTree(
                                result.toString()
                        );

                JsonNode games =
                        root.path("result")
                            .path("games");

                if (!games.isArray()) {

                    System.out.println(
                            "경기 데이터 없음 : "
                            + targetDate
                    );

                    continue;
                }

                System.out.println(
                        "API 경기 개수 : "
                        + games.size()
                );

                for (JsonNode game : games) {

                    totalGameCount++;

                    String gameId =
                            game.path("gameId")
                                .asText();

                    String regdate =
                            game.path("gameDate")
                                .asText();

                    String gameDateTime =
                            game.path("gameDateTime")
                                .asText();

                    String home =
                            game.path("homeTeamName")
                                .asText();

                    String away =
                            game.path("awayTeamName")
                                .asText();

                    String homeCode =
                            game.path("homeTeamCode")
                                .asText();

                    String awayCode =
                            game.path("awayTeamCode")
                                .asText();

                    System.out.println();

                    System.out.println(
                            "경기 ID : " + gameId
                    );

                    System.out.println(
                            "경기 날짜 : " + regdate
                    );

                    System.out.println(
                            "홈팀 : "
                            + home
                            + " / 코드 : "
                            + homeCode
                    );

                    System.out.println(
                            "원정팀 : "
                            + away
                            + " / 코드 : "
                            + awayCode
                    );

                    System.out.println(
                            "경기 시간 : "
                            + gameDateTime
                    );

                    if (home.isEmpty()
                            || away.isEmpty()) {

                        System.out.println(
                                "→ 팀 정보 없음. 저장하지 않음"
                        );

                        noTeamCount++;
                        skipGameCount++;

                        continue;
                    }

                    String homeTeamName =
                            normalizeTeamName(home);

                    String awayTeamName =
                            normalizeTeamName(away);

                    System.out.println(
                            "DB 홈팀 이름 : "
                            + homeTeamName
                    );

                    System.out.println(
                            "DB 원정팀 이름 : "
                            + awayTeamName
                    );

                    int homeId =
                            dao.findTeamId(homeTeamName);

                    int awayId =
                            dao.findTeamId(awayTeamName);

                    System.out.println(
                            "홈팀 ID : "
                            + homeId
                    );

                    System.out.println(
                            "원정팀 ID : "
                            + awayId
                    );

                    if (homeId == 0
                            || awayId == 0) {

                        System.out.println(
                                "→ 팀 ID를 찾지 못해서 저장하지 않음"
                        );

                        noTeamIdCount++;
                        skipGameCount++;

                        continue;
                    }

                    String title =
                            awayTeamName
                            + " vs "
                            + homeTeamName;

                    String location =
                            dao.findStadium(homeId);

                    System.out.println(
                            "경기장 : "
                            + location
                    );

                    Timestamp startDate =
                            null;

                    if (!gameDateTime.isEmpty()) {

                        startDate =
                                Timestamp.valueOf(
                                        LocalDateTime.parse(
                                                gameDateTime
                                        )
                                );
                    }

                    Timestamp endDate =
                            null;

                    int winnerId =
                            0;

                    int homeScore =
                            getScore(
                                    game,
                                    "homeScore",
                                    "homeTeamScore",
                                    "home_score"
                            );

                    int awayScore =
                            getScore(
                                    game,
                                    "awayScore",
                                    "awayTeamScore",
                                    "away_score"
                            );

                    String gameStatus =
                            getGameStatus(game);

                    if (gameStatus == null
                            || gameStatus.isEmpty()) {

                        if (isGameFinished(game)) {
                            gameStatus = "경기종료";
                        } else {
                            gameStatus = "경기예정";
                        }
                    }

                    System.out.println(
                            "홈팀 점수 : "
                            + homeScore
                    );

                    System.out.println(
                            "원정팀 점수 : "
                            + awayScore
                    );

                    System.out.println(
                            "경기 상태 : "
                            + gameStatus
                    );

                    if ("경기종료".equals(gameStatus)) {

                        if (homeScore > awayScore) {
                            winnerId = homeId;
                        } else if (awayScore > homeScore) {
                            winnerId = awayId;
                        }
                    }

                    ScheduleDTO dto =
                            new ScheduleDTO();

                    dto.setTitle(title);
                    dto.setLocation(location);
                    dto.setStart_date(startDate);
                    dto.setEnd_date(endDate);
                    dto.setWinner_id(winnerId);
                    dto.setHome_id(homeId);
                    dto.setAway_id(awayId);

                    dto.setHome_score(homeScore);
                    dto.setAway_score(awayScore);
                    dto.setGame_status(gameStatus);

                    System.out.println(
                            "DB 저장 시작"
                    );

                    int resultCount =
                            dao.insertSchedule(dto);

                    if (resultCount > 0) {

                        saveGameCount++;

                        System.out.println(
                                "저장 성공"
                        );

                        System.out.println(
                                "경기 : "
                                + title
                        );

                        System.out.println(
                                "경기장 : "
                                + location
                        );

                        System.out.println(
                                "경기 상태 : "
                                + gameStatus
                        );

                        System.out.println(
                                "스코어 : "
                                + awayScore
                                + " : "
                                + homeScore
                        );

                    } else {

                        System.out.println(
                                "저장 실패"
                        );
                    }

                    System.out.println(
                            "----------------------------------------"
                    );
                }
            }
        }

        System.out.println();

        System.out.println(
                "========================================"
        );

        System.out.println(
                "2026년 1월 ~ 12월 경기 일정 크롤링 완료"
        );

        System.out.println(
                "전체 경기 수 : "
                + totalGameCount
        );

        System.out.println(
                "저장된 경기 수 : "
                + saveGameCount
        );

        System.out.println(
                "제외된 경기 수 : "
                + skipGameCount
        );

        System.out.println(
                "팀 정보 없음 : "
                + noTeamCount
        );

        System.out.println(
                "팀 ID 조회 실패 : "
                + noTeamIdCount
        );

        System.out.println(
                "========================================"
        );
    }

    private static int getScore(
            JsonNode game,
            String... fieldNames) {

        for (String fieldName : fieldNames) {

            JsonNode node =
                    game.get(fieldName);

            if (node != null
                    && !node.isNull()
                    && node.isNumber()) {

                return node.asInt();
            }

            if (node != null
                    && !node.isNull()
                    && node.isTextual()
                    && !node.asText().isEmpty()) {

                try {
                    return Integer.parseInt(
                            node.asText()
                    );
                } catch (Exception e) {
                }
            }
        }

        return 0;
    }

    private static String getGameStatus(
            JsonNode game) {

        String[] fieldNames = {
                "gameStatus",
                "status",
                "game_status"
        };

        for (String fieldName : fieldNames) {

            JsonNode node =
                    game.get(fieldName);

            if (node != null
                    && !node.isNull()
                    && !node.asText().isEmpty()) {

                String status =
                        node.asText();

                if (status.equals("END")
                        || status.equals("FINISHED")
                        || status.equals("FINAL")
                        || status.equals("종료")
                        || status.equals("경기종료")) {

                    return "경기종료";
                }

                if (status.equals("BEFORE")
                        || status.equals("SCHEDULED")
                        || status.equals("예정")
                        || status.equals("경기예정")) {

                    return "경기예정";
                }
            }
        }

        return "";
    }

    private static boolean isGameFinished(
            JsonNode game) {

        String[] fieldNames = {
                "gameStatus",
                "status",
                "game_status"
        };

        for (String fieldName : fieldNames) {

            JsonNode node =
                    game.get(fieldName);

            if (node != null
                    && !node.isNull()) {

                String status =
                        node.asText();

                if (status.equals("END")
                        || status.equals("FINISHED")
                        || status.equals("FINAL")
                        || status.equals("종료")
                        || status.equals("경기종료")) {

                    return true;
                }
            }
        }

        return false;
    }

    private static String normalizeTeamName(
            String teamName) {

        if (teamName.equals("LG 트윈스")) {
            return "LG";
        }

        if (teamName.equals("KT 위즈")) {
            return "KT";
        }

        if (teamName.equals("삼성 라이온즈")) {
            return "삼성";
        }

        if (teamName.equals("한화 이글스")) {
            return "한화";
        }

        if (teamName.equals("NC 다이노스")) {
            return "NC";
        }

        if (teamName.equals("두산 베어스")) {
            return "두산";
        }

        if (teamName.equals("SSG 랜더스")) {
            return "SSG";
        }

        if (teamName.equals("키움 히어로즈")) {
            return "키움";
        }

        if (teamName.equals("롯데 자이언츠")) {
            return "롯데";
        }

        if (teamName.equals("KIA 타이거즈")) {
            return "KIA";
        }

        return teamName;
    }
}