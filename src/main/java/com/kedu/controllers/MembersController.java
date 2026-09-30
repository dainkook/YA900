package com.kedu.controllers;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.dao.MembersDAO;
import com.kedu.dto.UsersDTO;

@Controller
public class MembersController {

	@Autowired
	private	MembersDAO dao;

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert (UsersDTO dto, String phone1, String phone2, String phone3, String birth_year, String birth_month, String birth_day) {
		String phone= phone1+ "-" + phone2 + "-" + phone3;
		String birthString= birth_year+ "-" +birth_month + "-" + birth_day;
		Timestamp birth = Timestamp.valueOf(birthString + " 00:00:00");
		dto.setPhone(phone);
		dto.setBirth(birth);

		dao.insert(dto);
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
	        UsersDTO dto,
	        HttpSession session) {

	    UsersDTO result = dao.login(dto.getId(), dto.getPw());

	    // 로그인 실패
	    if (result == null) {
	        return "redirect:/login";
	    }

	    // 로그인 성공
	    session.setAttribute("id", result.getId());

	    return "redirect:/";
	}
}
