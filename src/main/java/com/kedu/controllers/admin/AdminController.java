package com.kedu.controllers.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.admin.AdminDAO;
import com.kedu.dto.AdminDTO;

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
	public String login(String admin_id, String admin_pw, HttpSession session, Model model) {
		AdminDTO dto = adminDAO.selectById(admin_id);

		// 아이디가 존재하지 않는 경우
		if (dto == null) {
			model.addAttribute("loginError", "존재하지 않는 ID입니다.");
			return "admin/login";
		}
		// 비밀번호가 틀린 경우
		if (!dto.getAdmin_pw().equals(admin_pw)) {
			model.addAttribute("loginError", "비밀번호가 틀렸습니다.");
			return "admin/login";
		}
		// 로그인 성공
		session.setAttribute("admin_id", dto.getAdmin_id());
		session.setAttribute("admin_name", dto.getAdmin_name());
		return "redirect:/admin/main";
	}

	// 관리자 메인 페이지 접속
	@RequestMapping("/main")
	public String main(HttpSession session, Model model) {
		if (session.getAttribute("admin_id") == null) {
			return "redirect:/admin";
		}
		int memberCount = adminDAO.getMemberCount();
		int reservationCount = adminDAO.getReservationCount();
		int todayReservationCount = adminDAO.getTodayReservationCount();

		List<Map<String, Object>> monthlyReservation = adminDAO.getMonthlyReservation();
		List<Map<String, Object>> genderStats = adminDAO.getGenderStats();
		List<Map<String, Object>> ageStats = adminDAO.getAgeStats();

		model.addAttribute("memberCount", memberCount);
		model.addAttribute("reservationCount", reservationCount);
		model.addAttribute("todayReservationCount", todayReservationCount);

		model.addAttribute("monthlyReservation", monthlyReservation);
		model.addAttribute("genderStats", genderStats);
		model.addAttribute("ageStats", ageStats);

		return "admin/main";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃됨");
		session.invalidate();
		return "redirect:/admin";
	}

	@RequestMapping("/notice")
	public String notice() {
		return "admin/notice";
	}

	@RequestMapping("/member")
	public String member() {
		return "admin/member";
	}

	@RequestMapping("/reservation")
	public String reservation() {
		return "admin/reservation";
	}

	@RequestMapping("/schedule")
	public String schedule() {
		return "admin/schedule";
	}

	@RequestMapping("/report")
	public String report() {
		return "admin/report";
	}
}
