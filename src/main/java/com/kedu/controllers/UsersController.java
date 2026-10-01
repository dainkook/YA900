package com.kedu.controllers;

import java.io.File;
import java.sql.Timestamp;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kedu.dao.UsersDAO;
import com.kedu.dto.UsersDTO;

@Controller
public class UsersController {


	@Autowired
	private UsersDAO dao;



	@RequestMapping("/signup")
	public String signup() {
		return "member/signup";
	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping("finduserid")
	public String finduserid() {
		return "member/finduserid";
	}

	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String singup(
			UsersDTO dto,
			String phone1,
			String phone2,
			String phone3,
			String birth_year,
			String birth_month,
			String birth_day,
			@RequestParam("uploadFile") MultipartFile file) throws Exception {

		String phone = phone1  + phone2 + phone3;
		String birthString = birth_year + "-" + birth_month + "-" + birth_day;
		Timestamp birth = Timestamp.valueOf(birthString + " 00:00:00");
		dto.setPhone(phone);
		dto.setBirth(birth);

		if(!file.isEmpty()) {

			String uploadPath = "C:/upload/";
			String originalName = file.getOriginalFilename();
			String extension = originalName.substring(originalName.lastIndexOf("."));
			String fileName = UUID.randomUUID().toString() + "_" + extension;
			File savefile = new File(uploadPath + fileName);
			file.transferTo(savefile);
			dto.setProfile_img(fileName);
		}

		dao.signup(dto);

		return "redirect:/";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginCheck(
			UsersDTO dto,
			HttpSession session) {

		UsersDTO result = dao.login(dto.getId(), dto.getPw());
		if (result == null) {
			return "redirect:/login";
		}
		session.setAttribute("id", result.getId());

		return "redirect:/";
	}
	
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public int idcheck(String id) {

		return dao.idCheck(id);
	}

	@RequestMapping(value="/emailcheck", method=RequestMethod.POST)
	@ResponseBody
	public int emailCheck(String email) {

		return dao.emailCheck(email);
	}

<<<<<<< HEAD
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();
		return"redirect:/";
	}

	@RequestMapping(value="/finduserid", method=RequestMethod.POST)
	public String findUserId(String name, String email, Model model) {
		String id= dao.findUserId(name, email);
		model.addAttribute("id",id);
		return "member/finduserid";
	}
=======
>>>>>>> master
}
