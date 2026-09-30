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

import com.kedu.dao.TeamRankDAO;
import com.kedu.dto.TeamRankDTO;

public class TeamRankCrawler {

    public static void main(String[] args) {

        ApplicationContext context =
                new FileSystemXmlApplicationContext(
                        "src/main/webapp/WEB-INF/spring/root-context.xml"
                );

        TeamRankDAO dao =
                context.getBean(TeamRankDAO.class);

        try {

            String urlString =
                    "https://api-gw.sports.naver.com/statistics/categories/kbo/seasons/2026/teams?gameType=REGULAR_SEASON";

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

                TeamRankDTO dto =
                        new TeamRankDTO();

                String teamName =
                        (String) team.get("teamName");

                dto.setTeam_name(teamName);

                dto.setTeam_id(
                        dao.findTeamId(teamName)
                );

                dto.setWin_rate(
                        Double.parseDouble(
                                String.valueOf(
                                        team.get("wra")
                                )
                        )
                );

                dto.setGames_behind(
                        Double.parseDouble(
                                String.valueOf(
                                        team.get("gameBehind")
                                )
                        )
                );

                dto.setGames(
                        Integer.parseInt(
                                String.valueOf(
                                        team.get("gameCount")
                                )
                        )
                );

                dto.setWins(
                        Integer.parseInt(
                                String.valueOf(
                                        team.get("winGameCount")
                                )
                        )
                );

                dto.setLosses(
                        Integer.parseInt(
                                String.valueOf(
                                        team.get("loseGameCount")
                                )
                        )
                );

                dto.setDraws(
                        Integer.parseInt(
                                String.valueOf(
                                        team.get("drawnGameCount")
                                )
                        )
                );

                dto.setWinning_streak(
                        String.valueOf(
                                team.get("continuousGameResult")
                        )
                );

                dto.setBatting_avg(
                        Double.parseDouble(
                                String.valueOf(
                                        team.get("offenseHra")
                                )
                        )
                );

                dto.setEra(
                        Double.parseDouble(
                                String.valueOf(
                                        team.get("defenseEra")
                                )
                        )
                );

                System.out.println(
                        dto.getTeam_name()
                        + " / 승률 : " + dto.getWin_rate()
                        + " / 게임차 : " + dto.getGames_behind()
                        + " / 경기 : " + dto.getGames()
                        + " / 승 : " + dto.getWins()
                        + " / 패 : " + dto.getLosses()
                        + " / 무 : " + dto.getDraws()
                        + " / 연속게임 : " + dto.getWinning_streak()
                        + " / 타율 : " + dto.getBatting_avg()
                        + " / ERA : " + dto.getEra()
                );

                dao.insertTeamRank(dto);
            }

            System.out.println("팀 순위 크롤링 완료");

            conn.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}