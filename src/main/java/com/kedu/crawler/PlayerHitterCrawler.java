package com.kedu.crawler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.kedu.dao.PlayerHitterDAO;
import com.kedu.dto.PlayerHitterDTO;

public class PlayerHitterCrawler {

    public static void main(String[] args) {

    	ApplicationContext context =
                new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/spring/root-context.xml");

        PlayerHitterDAO dao = context.getBean(PlayerHitterDAO.class);

        try {

            String urlString =
                    "https://api-gw.sports.naver.com/statistics/categories/kbo/seasons/2026/players"
                    + "?sortField=hitterHra"
                    + "&sortDirection=desc"
                    + "&playerType=HITTER"
                    + "&gameType=REGULAR_SEASON";

            URL url = new URL(urlString);

            HttpURLConnection conn =
                    (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("GET");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("Accept", "application/json");

            int responseCode = conn.getResponseCode();

            System.out.println("응답 코드 : " + responseCode);

            BufferedReader br =
                    new BufferedReader(
                            new InputStreamReader(
                                    conn.getInputStream(),
                                    "UTF-8"
                            )
                    );

            StringBuilder responseBody = new StringBuilder();

            String line;

            while ((line = br.readLine()) != null) {
                responseBody.append(line);
            }

            br.close();

            JSONParser parser = new JSONParser();

            JSONObject root =
                    (JSONObject) parser.parse(responseBody.toString());

            JSONObject result =
                    (JSONObject) root.get("result");

            JSONArray players =
                    (JSONArray) result.get("seasonPlayerStats");

            System.out.println("선수 수 : " + players.size());

            for (Object obj : players) {

                JSONObject player =
                        (JSONObject) obj;

                PlayerHitterDTO dto =
                        new PlayerHitterDTO();

                // 선수 기본 정보
                dto.setPlayer_id(
                        Integer.parseInt(
                                String.valueOf(
                                        player.get("playerId")
                                )
                        )
                );

                dto.setPlayer_name(
                        String.valueOf(
                                player.get("playerName")
                        )
                );

                dto.setPlayer_team(
                        String.valueOf(
                                player.get("teamName")
                        )
                );

                // 타율
                if (player.get("hitterHra") != null) {
                    dto.setBatting_avg(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("hitterHra")
                                    )
                            )
                    );
                }

                // 경기 수
                if (player.get("hitterGameCount") != null) {
                    dto.setGames(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterGameCount")
                                    )
                            )
                    );
                }

                // 타수
                if (player.get("hitterAb") != null) {
                    dto.setAt_bats(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterAb")
                                    )
                            )
                    );
                }

                // 안타
                if (player.get("hitterHit") != null) {
                    dto.setHits(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterHit")
                                    )
                            )
                    );
                }

                // 홈런
                if (player.get("hitterHr") != null) {
                    dto.setHome_runs(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterHr")
                                    )
                            )
                    );
                }

                // 2루타
                if (player.get("hitterH2") != null) {
                    dto.setDoubles(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterH2")
                                    )
                            )
                    );
                }

                // 3루타
                if (player.get("hitterH3") != null) {
                    dto.setTriples(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterH3")
                                    )
                            )
                    );
                }

                // 타점
                if (player.get("hitterRbi") != null) {
                    dto.setRuns_batted_in(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterRbi")
                                    )
                            )
                    );
                }

                // 득점
                if (player.get("hitterRun") != null) {
                    dto.setRuns(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterRun")
                                    )
                            )
                    );
                }

                // 도루
                if (player.get("hitterSb") != null) {
                    dto.setStolen_bases(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterSb")
                                    )
                            )
                    );
                }

                // 볼넷
                if (player.get("hitterBb") != null) {
                    dto.setBase_on_balls(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterBb")
                                    )
                            )
                    );
                }

                // 사구
                if (player.get("hitterHp") != null) {
                    dto.setHit_by_pitch(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterHp")
                                    )
                            )
                    );
                }

                // 삼진
                if (player.get("hitterKk") != null) {
                    dto.setStrikeouts(
                            Integer.parseInt(
                                    String.valueOf(
                                            player.get("hitterKk")
                                    )
                            )
                    );
                }

                // 출루율
                if (player.get("hitterObp") != null) {
                    dto.setOn_base_percentage(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("hitterObp")
                                    )
                            )
                    );
                }

                // 장타율
                if (player.get("hitterSlg") != null) {
                    dto.setSlugging_percentage(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("hitterSlg")
                                    )
                            )
                    );
                }

                // OPS
                if (player.get("hitterOps") != null) {
                    dto.setOps(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("hitterOps")
                                    )
                            )
                    );
                }

                // WRC+
                if (player.get("hitterWrcPlus") != null) {
                    dto.setWrc(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("hitterWrcPlus")
                                    )
                            )
                    );
                }

                // WAR
                if (player.get("hitterWar") != null) {
                    dto.setWar(
                            Double.parseDouble(
                                    String.valueOf(
                                            player.get("hitterWar")
                                    )
                            )
                    );
                }

                System.out.println(
                        dto.getPlayer_name()
                        + " / "
                        + dto.getPlayer_team()
                        + " / 타율 : "
                        + dto.getBatting_avg()
                        + " / 경기 : "
                        + dto.getGames()
                        + " / 안타 : "
                        + dto.getHits()
                        + " / 홈런 : "
                        + dto.getHome_runs()
                );

                dao.insertPlayer(dto);
            }

            System.out.println("크롤링 완료");

            conn.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}