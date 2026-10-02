package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.FilesDTO;

@Repository
public class FilesDAO {
	
	@Autowired
	JdbcTemplate jdbc;
	
	public int insertFile(FilesDTO dto) {
		String sql = "insert into files values(files_seq.nextval,?,?,sysdate,?)";
		return jdbc.update(sql, dto.getOriName(), dto.getSysName(), dto.getParent_seq());
	}
	
	public List<FilesDTO> getFiles(int parent_seq) {
		String sql = "select * from files where parent_seq = ?";
		List<FilesDTO> list = jdbc.query(sql, new BeanPropertyRowMapper<>(FilesDTO.class),parent_seq);
		System.out.println(list);
		return list;
	}
}
