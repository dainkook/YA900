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

import com.kedu.dao.TeamOffenDAO;
import com.kedu.dto.TeamOffenDTO;

public class TeamOffenCrawler {

    public static void main(String[] args) {

        ApplicationContext context =
                new FileSystemXmlApplicationContext(
                        "src/main/webapp/WEB-INF/spring/root-context.xml"
                );

        TeamOffenDAO dao =
                context.getBean(TeamOffenDAO.class);

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

                TeamOffenDTO dto =
                        new TeamOffenDTO();

                // 팀명
                String teamName =
                        String.valueOf(
                                team.get("teamName")
                        );

                dto.setTeam_name(teamName);

                // 팀 ID
                dto.setTeam_id(
                        dao.findTeamId(teamName)
                );

                // 타율
                if (team.get("offenseHra") != null) {
                    dto.setBatting_average(
                            Double.parseDouble(
                                    String.valueOf(
                                            team.get("offenseHra")
                                    )
                            )
                    );
                }

                // 득점
                if (team.get("offenseRun") != null) {
                    dto.setRuns(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseRun")
                                    )
                            )
                    );
                }

                // 타점
                if (team.get("offenseRbi") != null) {
                    dto.setRbi(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseRbi")
                                    )
                            )
                    );
                }

                // 타수
                if (team.get("offenseAb") != null) {
                    dto.setAt_bats(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseAb")
                                    )
                            )
                    );
                }

                // 홈런
                if (team.get("offenseHr") != null) {
                    dto.setHome_runs(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseHr")
                                    )
                            )
                    );
                }

                // 안타
                if (team.get("offenseHit") != null) {
                    dto.setHits(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseHit")
                                    )
                            )
                    );
                }

                // 2루타
                if (team.get("offenseH2") != null) {
                    dto.setDoubles(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseH2")
                                    )
                            )
                    );
                }

                // 3루타
                if (team.get("offenseH3") != null) {
                    dto.setTriples(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseH3")
                                    )
                            )
                    );
                }

                // 도루
                if (team.get("offenseSb") != null) {
                    dto.setStolen_bases(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseSb")
                                    )
                            )
                    );
                }

                // 볼넷 + 사구
                if (team.get("offenseBbhp") != null) {
                    dto.setWalks_hbp(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseBbhp")
                                    )
                            )
                    );
                }

                // 삼진
                if (team.get("offenseKk") != null) {
                    dto.setStrikeouts(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseKk")
                                    )
                            )
                    );
                }

                // 병살
                if (team.get("offenseGd") != null) {
                    dto.setDouble_plays(
                            Integer.parseInt(
                                    String.valueOf(
                                            team.get("offenseGd")
                                    )
                            )
                    );
                }

                // 출루율
                if (team.get("offenseObp") != null) {
                    dto.setOn_base_percentage(
                            Double.parseDouble(
                                    String.valueOf(
                                            team.get("offenseObp")
                                    )
                            )
                    );
                }

                // 장타율
                if (team.get("offenseSlg") != null) {
                    dto.setSlugging_percentage(
                            Double.parseDouble(
                                    String.valueOf(
                                            team.get("offenseSlg")
                                    )
                            )
                    );
                }

                // OPS
                if (team.get("offenseOps") != null) {
                    dto.setOps(
                            Double.parseDouble(
                                    String.valueOf(
                                            team.get("offenseOps")
                                    )
                            )
                    );
                }

                System.out.println(
                        dto.getTeam_name()
                        + " / 타율 : "
                        + dto.getBatting_average()
                        + " / 득점 : "
                        + dto.getRuns()
                        + " / 타점 : "
                        + dto.getRbi()
                        + " / 홈런 : "
                        + dto.getHome_runs()
                        + " / 안타 : "
                        + dto.getHits()
                        + " / 출루율 : "
                        + dto.getOn_base_percentage()
                        + " / 장타율 : "
                        + dto.getSlugging_percentage()
                        + " / OPS : "
                        + dto.getOps()
                );

                dao.insertTeamOffen(dto);
            }

            System.out.println("팀 공격기록 크롤링 완료");

            conn.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}