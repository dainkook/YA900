package com.kedu.crawler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.kedu.dao.GameLineUpDAO;
import com.kedu.dao.PlayerDAO;
import com.kedu.dao.ScheduleDAO;
import com.kedu.dto.GameLineUpDTO;
import com.kedu.dto.PlayerDTO;

public class GameLineUpCrawler {

    public static void main(String[] args) {

        ApplicationContext context =
                new FileSystemXmlApplicationContext(
                        "src/main/webapp/WEB-INF/spring/root-context.xml"
                );

        GameLineUpDAO gameLineUpDAO =
                context.getBean(GameLineUpDAO.class);

        PlayerDAO playerDAO =
                context.getBean(PlayerDAO.class);

        ScheduleDAO scheduleDAO =
                context.getBean(ScheduleDAO.class);

        try {

            /*
             * schedule 테이블에 저장된
             * 네이버 실제 경기 ID 가져오기
             */
            List<String> gameIdList =
                    scheduleDAO.selectNaverGameIds();

            System.out.println(
                    "전체 경기 수 : "
                    + gameIdList.size()
            );

            /*
             * 모든 경기 반복
             */
            for (String gameId : gameIdList) {

                System.out.println();
                System.out.println(
                        "================================="
                );

                System.out.println(
                        "경기 크롤링 시작 : "
                        + gameId
                );

                System.out.println(
                        "================================="
                );

                /*
                 * Naver 경기 프리뷰 API
                 */
                String urlString =
                        "https://api-gw.sports.naver.com/schedule/games/"
                        + gameId
                        + "/preview";

                URL url =
                        new URL(urlString);

                HttpURLConnection conn =
                        (HttpURLConnection)
                        url.openConnection();

                conn.setRequestMethod("GET");

                conn.setRequestProperty(
                        "User-Agent",
                        "Mozilla/5.0"
                );

                conn.setRequestProperty(
                        "Accept",
                        "application/json"
                );

                int responseCode =
                        conn.getResponseCode();

                System.out.println(
                        "응답 코드 : "
                        + responseCode
                );

                if (responseCode != 200) {

                    System.out.println(
                            "경기 조회 실패 : "
                            + gameId
                    );

                    conn.disconnect();

                    continue;
                }

                /*
                 * 응답 읽기
                 */
                BufferedReader br =
                        new BufferedReader(
                                new InputStreamReader(
                                        conn.getInputStream(),
                                        "UTF-8"
                                )
                        );

                StringBuilder responseBody =
                        new StringBuilder();

                String line;

                while ((line = br.readLine()) != null) {
                    responseBody.append(line);
                }

                br.close();

                conn.disconnect();

                /*
                 * JSON 파싱
                 */
                JSONParser parser =
                        new JSONParser();

                JSONObject root =
                        (JSONObject)
                        parser.parse(
                                responseBody.toString()
                        );

                JSONObject result =
                        (JSONObject)
                        root.get("result");

                if (result == null) {

                    System.out.println(
                            "result 없음 : "
                            + gameId
                    );

                    continue;
                }

                JSONObject previewData =
                        (JSONObject)
                        result.get("previewData");

                if (previewData == null) {

                    System.out.println(
                            "previewData 없음 : "
                            + gameId
                    );

                    continue;
                }

                /*
                 * 경기 정보
                 */
                JSONObject gameInfo =
                        (JSONObject)
                        previewData.get("gameInfo");

                if (gameInfo == null) {

                    System.out.println(
                            "gameInfo 없음 : "
                            + gameId
                    );

                    continue;
                }

                String awayTeamName =
                        String.valueOf(
                                gameInfo.get("aName")
                        );

                String homeTeamName =
                        String.valueOf(
                                gameInfo.get("hName")
                        );

                System.out.println(
                        "원정 : "
                        + awayTeamName
                );

                System.out.println(
                        "홈 : "
                        + homeTeamName
                );

                /*
                 * 원정팀 라인업
                 */
                JSONObject awayTeamLineUp =
                        (JSONObject)
                        previewData.get(
                                "awayTeamLineUp"
                        );

                /*
                 * 홈팀 라인업
                 */
                JSONObject homeTeamLineUp =
                        (JSONObject)
                        previewData.get(
                                "homeTeamLineUp"
                        );

                if (awayTeamLineUp == null
                        || homeTeamLineUp == null) {

                    System.out.println(
                            "아직 라인업이 없습니다."
                    );

                    continue;
                }

                JSONArray awayFullLineUp =
                        (JSONArray)
                        awayTeamLineUp.get(
                                "fullLineUp"
                        );

                JSONArray homeFullLineUp =
                        (JSONArray)
                        homeTeamLineUp.get(
                                "fullLineUp"
                        );

                if (awayFullLineUp == null
                        || homeFullLineUp == null
                        || awayFullLineUp.isEmpty()
                        || homeFullLineUp.isEmpty()) {

                    System.out.println(
                            "아직 선발 라인업이 없습니다."
                    );

                    continue;
                }

                /*
                 * 기존 라인업 삭제
                 */
                gameLineUpDAO.deleteByGameId(
                        gameId
                );

                /*
                 * 원정팀
                 */
                System.out.println(
                        "원정팀 선수 수 : "
                        + awayFullLineUp.size()
                );

                for (Object obj : awayFullLineUp) {

                    JSONObject player =
                            (JSONObject) obj;

                    int playerId =
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get(
                                                    "playerCode"
                                            )
                                    )
                            );

                    String playerName =
                            String.valueOf(
                                    player.get(
                                            "playerName"
                                    )
                            );

                    String position =
                            String.valueOf(
                                    player.get(
                                            "positionName"
                                    )
                            );

                    String playerImage =
                            "https://sports-phinf.pstatic.net/player/kbo/default/"
                            + playerId
                            + ".png";

                    /*
                     * PLAYER 저장
                     */
                    PlayerDTO playerDTO =
                            new PlayerDTO();

                    playerDTO.setPlayer_id(
                            playerId
                    );

                    playerDTO.setPlayer_name(
                            playerName
                    );

                    playerDTO.setPlayer_team(
                            awayTeamName
                    );

                    playerDTO.setPlayer_position(
                            position
                    );

                    playerDTO.setPlayer_image(
                            playerImage
                    );

                    playerDAO.saveOrUpdate(
                            playerDTO
                    );

                    /*
                     * GAME_LINEUP 저장
                     */
                    GameLineUpDTO lineupDTO =
                            new GameLineUpDTO();

                    lineupDTO.setGame_id(
                            gameId
                    );

                    lineupDTO.setPlayer_id(
                            playerId
                    );

                    lineupDTO.setTeam(
                            "away"
                    );

                    Object batorder =
                            player.get("batorder");

                    if (batorder != null) {

                        lineupDTO.setBatting_order(
                                Integer.parseInt(
                                        String.valueOf(
                                                batorder
                                        )
                                )
                        );

                    } else {

                        lineupDTO.setBatting_order(
                                0
                        );
                    }

                    lineupDTO.setPosition(
                            position
                    );

                    lineupDTO.setStarter(
                            1
                    );

                    gameLineUpDAO.insert(
                            lineupDTO
                    );

                    System.out.println(
                            "원정 : "
                            + playerName
                            + " / "
                            + position
                    );
                }

                /*
                 * 홈팀
                 */
                System.out.println(
                        "홈팀 선수 수 : "
                        + homeFullLineUp.size()
                );

                for (Object obj : homeFullLineUp) {

                    JSONObject player =
                            (JSONObject) obj;

                    int playerId =
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get(
                                                    "playerCode"
                                            )
                                    )
                            );

                    String playerName =
                            String.valueOf(
                                    player.get(
                                            "playerName"
                                    )
                            );

                    String position =
                            String.valueOf(
                                    player.get(
                                            "positionName"
                                    )
                            );

                    String playerImage =
                            "https://sports-phinf.pstatic.net/player/kbo/default/"
                            + playerId
                            + ".png";

                    /*
                     * PLAYER 저장
                     */
                    PlayerDTO playerDTO =
                            new PlayerDTO();

                    playerDTO.setPlayer_id(
                            playerId
                    );

                    playerDTO.setPlayer_name(
                            playerName
                    );

                    playerDTO.setPlayer_team(
                            homeTeamName
                    );

                    playerDTO.setPlayer_position(
                            position
                    );

                    playerDTO.setPlayer_image(
                            playerImage
                    );

                    playerDAO.saveOrUpdate(
                            playerDTO
                    );

                    /*
                     * GAME_LINEUP 저장
                     */
                    GameLineUpDTO lineupDTO =
                            new GameLineUpDTO();

                    lineupDTO.setGame_id(
                            gameId
                    );

                    lineupDTO.setPlayer_id(
                            playerId
                    );

                    lineupDTO.setTeam(
                            "home"
                    );

                    Object batorder =
                            player.get("batorder");

                    if (batorder != null) {

                        lineupDTO.setBatting_order(
                                Integer.parseInt(
                                        String.valueOf(
                                                batorder
                                        )
                                )
                        );

                    } else {

                        lineupDTO.setBatting_order(
                                0
                        );
                    }

                    lineupDTO.setPosition(
                            position
                    );

                    lineupDTO.setStarter(
                            1
                    );

                    gameLineUpDAO.insert(
                            lineupDTO
                    );

                    System.out.println(
                            "홈 : "
                            + playerName
                            + " / "
                            + position
                    );
                }

                System.out.println(
                        "---------------------------------"
                );

                System.out.println(
                        "라인업 저장 완료 : "
                        + gameId
                );
            }

            System.out.println();
            System.out.println(
                    "================================="
            );

            System.out.println(
                    "전체 라인업 크롤링 완료"
            );

            System.out.println(
                    "================================="
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}