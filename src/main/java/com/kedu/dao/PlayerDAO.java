package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MyTeamDTO;
import com.kedu.dto.PlayerDTO;

@Repository
public class PlayerDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public void saveOrUpdate(PlayerDTO dto) {

		String sql =
				"MERGE INTO player p " +
						"USING (SELECT ? player_id, ? player_name, ? player_team, ? player_image, ? player_position FROM dual) temp " +
						"ON (p.player_id = temp.player_id) " +

            "WHEN MATCHED THEN " +
            "UPDATE SET " +
            "p.player_name = temp.player_name, " +
            "p.player_team = temp.player_team, " +
            "p.player_image = temp.player_image, " +
            "p.player_position = temp.player_position " +

            "WHEN NOT MATCHED THEN " +
            "INSERT (player_id, player_name, player_team, player_image, player_position) " +
            "VALUES (temp.player_id, temp.player_name, temp.player_team, temp.player_image, temp.player_position)";

		jdbc.update(
				sql,
				dto.getPlayer_id(),
				dto.getPlayer_name(),
				dto.getPlayer_team(),
				dto.getPlayer_image(),
				dto.getPlayer_position()
				);
	}
	public List<PlayerDTO> selectAll() {

		String sql = 
				"SELECT player_id, player_name, player_team, player_image, player_position " +
						"FROM player " +
						"ORDER BY player_name";

		return jdbc.query(sql, (rs, rowNum) -> {

			PlayerDTO dto = new PlayerDTO();

			dto.setPlayer_id(rs.getInt("player_id"));
			dto.setPlayer_name(rs.getString("player_name"));
			dto.setPlayer_team(rs.getString("player_team"));
			dto.setPlayer_image(rs.getString("player_image"));
			dto.setPlayer_position(rs.getString("player_position"));

			return dto;
		});
	}

	public int addMyTeam(MyTeamDTO dto, String id) {
		String sql = "insert into myteam values(?,?,?,?,?,?,?,?,?,?)";
		return jdbc.update(sql, id, dto.getPlayer_1B(), dto.getPlayer_2B(), dto.getPlayer_3B(), dto.getPlayer_SP() , dto.getPlayer_C(), dto.getPlayer_RF(), dto.getPlayer_LF(), dto.getPlayer_CF(), dto.getPlayer_SS());
	}
	
	public List<PlayerDTO> selectMyTeamPlayers(String id) {

	    String sql =
	        "SELECT p.player_id, p.player_name, p.player_team, p.player_image, p.player_position " +
	        "FROM player p " +
	        "JOIN myteam m ON p.player_name IN " +
	        "(m.player_1B, m.player_2B, m.player_3B, m.player_SP, " +
	        "m.player_C, m.player_RF, m.player_LF, m.player_CF, m.player_SS) " +
	        "WHERE m.id = ? " +
	        "ORDER BY CASE p.player_name " +
	        "WHEN m.player_1B THEN 1 " +
	        "WHEN m.player_2B THEN 2 " +
	        "WHEN m.player_3B THEN 3 " +
	        "WHEN m.player_SP THEN 4 " +
	        "WHEN m.player_C THEN 5 " +
	        "WHEN m.player_RF THEN 6 " +
	        "WHEN m.player_LF THEN 7 " +
	        "WHEN m.player_CF THEN 8 " +
	        "WHEN m.player_SS THEN 9 " +
	        "END";

	    return jdbc.query(sql, (rs, rowNum) -> {

	        PlayerDTO dto = new PlayerDTO();

	        dto.setPlayer_id(rs.getInt("player_id"));
	        dto.setPlayer_name(rs.getString("player_name"));
	        dto.setPlayer_team(rs.getString("player_team"));
	        dto.setPlayer_image(rs.getString("player_image"));
	        dto.setPlayer_position(rs.getString("player_position"));

	        return dto;

	    }, id);
	}
	
	public int countMyTeam(String id) {
	    String sql = "SELECT COUNT(*) FROM MYTEAM WHERE ID = ?";
	    return jdbc.queryForObject(sql, Integer.class, id);
	}
	
	public int updateMyTeam(MyTeamDTO dto, String id) {
		
		 String sql =
			        "UPDATE myteam SET " +
			        "player_1B = ?, " +
			        "player_2B = ?, " +
			        "player_3B = ?, " +
			        "player_SP = ?, " +
			        "player_C = ?, " +
			        "player_RF = ?, " +
			        "player_LF = ?, " +
			        "player_CF = ?, " +
			        "player_SS = ? " +
			        "WHERE id = ?";
		 
		 return jdbc.update(sql, dto.getPlayer_1B(),dto.getPlayer_2B(),dto.getPlayer_3B(),dto.getPlayer_SP(),dto.getPlayer_C(),dto.getPlayer_RF(),dto.getPlayer_LF(),dto.getPlayer_CF(),dto.getPlayer_SS(), id);
		
	}



}