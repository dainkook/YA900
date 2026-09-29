package com.kedu.controllers.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.admin.AdminDAO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminDAO adminDAO;

	// 관리자 페이지 진입
	@RequestMapping("")
	public String admin() {
		return "admin/login";
	}

	// 로그인 처리
	@RequestMapping("/login")
	public String login(String admin_id, String admin_pw, HttpSession session) {
		boolean result = adminDAO.login(admin_id, admin_pw);

		if (result) {
			session.setAttribute(admin_id, admin_id);
			return "redirect:/admin/main";
		}
		return "redirect:/admin";
	}

	// 관리자 메인 페이지 접속
	@RequestMapping("/main")
	public String main(HttpSession session) {
		if (session.getAttribute("admin_id") == null) {
			return "redirect:/admin";
		}
		return "admin/main";
	}
}
