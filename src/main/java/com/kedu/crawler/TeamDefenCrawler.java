package com.kedu.crawler;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.kedu.dao.TeamDefenDAO;
import com.kedu.dto.TeamDefenDTO;

public class TeamDefenCrawler {

    public static void main(String[] args) {

        ApplicationContext context =
                new FileSystemXmlApplicationContext(
                        "src/main/webapp/WEB-INF/spring/root-context.xml"
                );

        TeamDefenDAO dao =
                context.getBean(TeamDefenDAO.class);

        try {

            String urlString =
                    "https://api-gw.sports.naver.com/statistics/categories/kbo/seasons/2026/teams"
                    + "?gameType=REGULAR_SEASON";

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

            StringBuilder responseBody =
                    new StringBuilder();

            String line;

            while ((line = br.readLine()) != null) {
                responseBody.append(line);
            }

            br.close();

            JSONParser parser = new JSONParser();

            JSONObject root =
                    (JSONObject) parser.parse(
                            responseBody.toString()
                    );

            JSONObject result =
                    (JSONObject) root.get("result");

            JSONArray teams =
                    (JSONArray) result.get("seasonTeamStats");

            System.out.println("팀 수 : " + teams.size());

            for (Object obj : teams) {

                JSONObject team =
                        (JSONObject) obj;

                TeamDefenDTO dto =
                        new TeamDefenDTO();

                String teamName =
                        String.valueOf(
                                team.get("teamName")
                        );

                dto.setTeam_name(teamName);

                dto.setTeam_id(
                        dao.findTeamId(teamName)
                );

                if (team.get("defenseEra") != null) {
                    dto.setEra(
                            Double.parseDouble(
                                    String.valueOf(
                                            team.get("defenseEra")
                                    )
                            )
                    );
                }

                if (team.get("defenseR") != null) {
                    dto.setRuns_allowed(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseR")
                                    )
                            )
                    );
                }

                if (team.get("defenseEr") != null) {
                    dto.setEarned_runs(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseEr")
                                    )
                            )
                    );
                }

                if (team.get("defenseInning") != null) {
                    dto.setInnings_pitched(
                            (int) Double.parseDouble(
                                    String.valueOf(
                                            team.get("defenseInning")
                                    )
                            )
                    );
                }

                if (team.get("defenseHit") != null) {
                    dto.setHits_allowed(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseHit")
                                    )
                            )
                    );
                }

                if (team.get("defenseHr") != null) {
                    dto.setHome_runs_allowed(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseHr")
                                    )
                            )
                    );
                }

                if (team.get("defenseKk") != null) {
                    dto.setStrikeouts(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseKk")
                                    )
                            )
                    );
                }

                if (team.get("defenseBbhp") != null) {
                    dto.setWalks_hbp(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseBbhp")
                                    )
                            )
                    );
                }

                if (team.get("defenseWp") != null) {
                    dto.setWild_pitches(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseWp")
                                    )
                            )
                    );
                }

                if (team.get("defenseErr") != null) {
                    dto.setErrors(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseErr")
                                    )
                            )
                    );
                }

                if (team.get("defenseWhip") != null) {
                    dto.setWhip(
                            Double.parseDouble(
                                    String.valueOf(
                                            team.get("defenseWhip")
                                    )
                            )
                    );
                }

                if (team.get("defenseQs") != null) {
                    dto.setQuality_starts(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseQs")
                                    )
                            )
                    );
                }

                if (team.get("defenseHold") != null) {
                    dto.setHolds(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseHold")
                                    )
                            )
                    );
                }

                if (team.get("defenseSave") != null) {
                    dto.setSaves(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("defenseSave")
                                    )
                            )
                    );
                }

                System.out.println(
                        dto.getTeam_name()
                        + " / ERA : "
                        + dto.getEra()
                        + " / 실점 : "
                        + dto.getRuns_allowed()
                        + " / 자책점 : "
                        + dto.getEarned_runs()
                        + " / 이닝 : "
                        + dto.getInnings_pitched()
                        + " / 피안타 : "
                        + dto.getHits_allowed()
                        + " / 피홈런 : "
                        + dto.getHome_runs_allowed()
                        + " / 탈삼진 : "
                        + dto.getStrikeouts()
                        + " / 볼넷+사구 : "
                        + dto.getWalks_hbp()
                        + " / 폭투 : "
                        + dto.getWild_pitches()
                        + " / 실책 : "
                        + dto.getErrors()
                        + " / WHIP : "
                        + dto.getWhip()
                        + " / QS : "
                        + dto.getQuality_starts()
                        + " / 홀드 : "
                        + dto.getHolds()
                        + " / 세이브 : "
                        + dto.getSaves()
                );

                dao.insertTeamDefen(dto);
            }

            System.out.println("팀 수비기록 크롤링 완료");

            conn.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}