package com.kedu.controllers;

import java.io.File;
import java.sql.Timestamp;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kedu.dao.MembersDAO;
import com.kedu.dto.UsersDTO;

@Controller
public class MembersController {

	@Autowired
	private MembersDAO dao;

	@RequestMapping("/signup")
	public String login() {
		return "member/signup";
	}

	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(
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

		System.out.println("insert 컨트롤러 제대로 작동함");

		dao.insert(dto);

		return "redirect:/";
	}

	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public int idcheck(String id) {

		System.out.println("아이디 검사 컨트롤러");

		return dao.idCheck(id);
	}

	@RequestMapping(value="/emailcheck", method=RequestMethod.POST)
	@ResponseBody
	public int emailCheck(String email) {

		System.out.println("이메일 검사 컨트롤러");

		return dao.emailCheck(email);
	}
}