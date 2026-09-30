package com.kedu.crawler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.kedu.dao.PlayerPitcherDAO;
import com.kedu.dto.PlayerPitcherDTO;

public class PlayerPitcherCrawler {

    public static void main(String[] args) {

        ApplicationContext context =
                new FileSystemXmlApplicationContext(
                        "src/main/webapp/WEB-INF/spring/root-context.xml"
                );

        PlayerPitcherDAO dao =
                context.getBean(PlayerPitcherDAO.class);

        try {

            Map<String, JSONObject> playerMap =
                    new HashMap<>();

            String[] sortFields = {
                    "pitcherEra",
                    "pitcherHold",
                    "pitcherSave"
            };

            for (String sortField : sortFields) {

                String urlString =
                        "https://api-gw.sports.naver.com/statistics/categories/kbo/seasons/2026/players"
                        + "?sortField=" + sortField
                        + "&sortDirection=desc"
                        + "&playerType=PITCHER"
                        + "&gameType=REGULAR_SEASON";

                URL url = new URL(urlString);

                HttpURLConnection conn =
                        (HttpURLConnection) url.openConnection();

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
                        sortField
                        + " 응답 코드 : "
                        + responseCode
                );

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

                JSONParser parser =
                        new JSONParser();

                JSONObject root =
                        (JSONObject) parser.parse(
                                responseBody.toString()
                        );

                JSONObject result =
                        (JSONObject) root.get("result");

                JSONArray players =
                        (JSONArray) result.get(
                                "seasonPlayerStats"
                        );

                System.out.println(
                        sortField
                        + " 선수 수 : "
                        + players.size()
                );

                for (Object obj : players) {

                    JSONObject player =
                            (JSONObject) obj;

                    String playerId =
                            String.valueOf(
                                    player.get("playerId")
                            );

                    playerMap.put(
                            playerId,
                            player
                    );
                }
            }

            System.out.println(
                    "중복 제거 후 선수 수 : "
                    + playerMap.size()
            );

            for (JSONObject player : playerMap.values()) {

                PlayerPitcherDTO dto =
                        new PlayerPitcherDTO();

                // 선수 ID
                if (player.get("playerId") != null) {
                    dto.setPlayer_id(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("playerId")
                                    )
                            )
                    );
                }

                // 팀
                if (player.get("teamName") != null) {
                    dto.setPlayer_team(
                            String.valueOf(
                                    player.get("teamName")
                            )
                    );
                }

                // 선수 이름
                if (player.get("playerName") != null) {
                    dto.setPlayer_name(
                            String.valueOf(
                                    player.get("playerName")
                            )
                    );
                }

                // ERA
                if (player.get("pitcherEra") != null) {
                    dto.setEra(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("pitcherEra")
                                    )
                            )
                    );
                }

                // 경기
                if (player.get("pitcherGameCount") != null) {
                    dto.setGames(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherGameCount")
                                    )
                            )
                    );
                }

                // 승
                if (player.get("pitcherWin") != null) {
                    dto.setWins(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherWin")
                                    )
                            )
                    );
                }

                // 패
                if (player.get("pitcherLose") != null) {
                    dto.setLosses(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherLose")
                                    )
                            )
                    );
                }

                // 홀드
                if (player.get("pitcherHold") != null) {
                    dto.setHolds(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherHold")
                                    )
                            )
                    );
                }

                // 세이브
                if (player.get("pitcherSave") != null) {
                    dto.setSaves(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherSave")
                                    )
                            )
                    );
                }

                // 이닝
                if (player.get("pitcherInning") != null) {
                    dto.setInnings(
                            String.valueOf(
                                    player.get("pitcherInning")
                            )
                    );
                }

                // 탈삼진
                if (player.get("pitcherKk") != null) {
                    dto.setStrikeouts(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherKk")
                                    )
                            )
                    );
                }

                // 피안타
                if (player.get("pitcherHit") != null) {
                    dto.setHits_allowed(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherHit")
                                    )
                            )
                    );
                }

                // 피홈런
                if (player.get("pitcherHr") != null) {
                    dto.setHome_runs_allowed(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherHr")
                                    )
                            )
                    );
                }

                // 실점
                if (player.get("pitcherR") != null) {
                    dto.setRuns_allowed(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherR")
                                    )
                            )
                    );
                }

                // 자책점
                if (player.get("pitcherEr") != null) {
                    dto.setEarned_runs(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherEr")
                                    )
                            )
                    );
                }

                // 볼넷
                if (player.get("pitcherBb") != null) {
                    dto.setBase_on_balls(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherBb")
                                    )
                            )
                    );
                }

                // 사구
                if (player.get("pitcherHp") != null) {
                    dto.setHit_by_pitch(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("pitcherHp")
                                    )
                            )
                    );
                }

                // 승률
                if (player.get("pitcherWra") != null) {
                    dto.setWin_rate(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("pitcherWra")
                                    )
                            )
                    );
                }

                // WPA
                if (player.get("pitcherWpa") != null) {
                    dto.setWpa(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("pitcherWpa")
                                    )
                            )
                    );
                }

                // WAR
                if (player.get("pitcherWar") != null) {
                    dto.setWar(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("pitcherWar")
                                    )
                            )
                    );
                }

                System.out.println(
                        dto.getPlayer_name()
                        + " / "
                        + dto.getPlayer_team()
                        + " / ERA : "
                        + dto.getEra()
                        + " / 경기 : "
                        + dto.getGames()
                        + " / 승 : "
                        + dto.getWins()
                        + " / 패 : "
                        + dto.getLosses()
                        + " / 홀드 : "
                        + dto.getHolds()
                        + " / 세이브 : "
                        + dto.getSaves()
                        + " / 이닝 : "
                        + dto.getInnings()
                        + " / 탈삼진 : "
                        + dto.getStrikeouts()
                        + " / WAR : "
                        + dto.getWar()
                );

                dao.insertPlayer(dto);
            }

            System.out.println("크롤링 완료");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}