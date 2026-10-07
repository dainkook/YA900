package com.kedu.controllers;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
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

import com.kedu.commons.EmailService;
import com.kedu.commons.EncryptionUtils;
import com.kedu.dao.PlayerDAO;
import com.kedu.dao.UsersDAO;
import com.kedu.dao.admin.ReservationDAO;
import com.kedu.dto.MyTeamDTO;
import com.kedu.dto.PlayerDTO;
import com.kedu.dto.UsersDTO;

@Controller

public class UsersController {


	@Autowired
	private UsersDAO dao;

	@Autowired
	private PlayerDAO playerDAO;

	@Autowired
	private EmailService emailService;
	
	@Autowired
	private ReservationDAO reservationDAO;
	

	@RequestMapping("/signup")
	public String signup() {
		return "member/signup";
	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping("/finduserid")
	public String finduserid() {
		return "member/finduserid";
	}

	@RequestMapping("/finduserpw")
	public String finduserpw() {
		return "member/finduserpw";
	}
	
	@RequestMapping("/mypage")
	public String myPage(HttpSession session, Model model) {

	    String id = (String) session.getAttribute("id");

	    List<Map<String, Object>> reservationList =
	            reservationDAO.selectMyReservations(id);

	    model.addAttribute("reservationList", reservationList);
	    model.addAttribute("user", dao.selectUser((String)session.getAttribute("id")));

	    return "member/mypage";
	}


	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signup(
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
		String hashedPw= EncryptionUtils.encryptSHA512(dto.getPw());
		dto.setPw(hashedPw);

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
	public String loginCheck(UsersDTO dto, HttpSession session) {

		String hashedpw = EncryptionUtils.encryptSHA512(dto.getPw());

		UsersDTO result = dao.login(dto.getId(), hashedpw);
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

	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();
		return"redirect:/";
	}

	@RequestMapping(value="/finduserid", method=RequestMethod.POST)
	public String findUserId(String name,String email,Model model,HttpSession session) {

		Boolean verified =
				(Boolean) session.getAttribute("emailVerified");

		if (verified == null || !verified) {
			return "member/finduserid";
		}

		String id = dao.findUserId(name, email);

		System.out.println("李얠� �븘�씠�뵒 : " + id);

		model.addAttribute("id", id);



		session.removeAttribute("emailVerified");
		session.removeAttribute("emailcode");
		return "member/finduserid";
	}
	
	
	@RequestMapping(value="/sendemail")
	@ResponseBody
	public String sendEmail(String email , HttpSession session) {
		String code = String.valueOf((int)(Math.random() * 900000)+ 100000);
		session.setAttribute("emailcode", code);
		emailService.sendEmail(email,"�씠硫붿씪 �씤利앸쾲�샇", "�씤利앸쾲�샇�뒗 " + code + " �엯�땲�떎.");
		return "success";
	}
	@RequestMapping(value="/verifyemail")
	@ResponseBody
	public String verifyEmail(String code, HttpSession session) {
		String savedCode=(String) session.getAttribute("emailcode");
		if(savedCode != null && savedCode.equals(code)) {

			session.setAttribute("emailVerified", true);
			return "success";

		}
		return "fail";
	}

	@RequestMapping(value="/checkuser", method= RequestMethod.POST)
	@ResponseBody
	public String checkUser(String id, String name, String email, HttpSession session) {


		Boolean verified = (Boolean) session.getAttribute("emailVerified");
		if(verified== null || !verified) {
			return "fail";
		}
		UsersDTO result = dao.findUserPw(name, id, email);
		if(result != null) {
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("/updatepw")
	@ResponseBody
	public String updatePw(String id, String newPw) {

		String hashedPw= EncryptionUtils.encryptSHA512(newPw);

		int result = dao.updatePw(id, hashedPw);

		if(result == 1) {
			return "success";
		}else {
			return "fail";
		}
	}

	@RequestMapping(value="/mypage/update", method=RequestMethod.POST)
	@ResponseBody
	public String updateUser(
	        String phone,
	        String email,
	        String zipcode,
	        String address1,
	        String address2,
	        String team,
	        @RequestParam(value="profileFile", required=false) MultipartFile profileFile,
	        HttpSession session) throws Exception {


	    UsersDTO loginUser = dao.selectUser((String)session.getAttribute("id"));


	    if (loginUser == null) {

	        return "login";

	    }


	    String id =
	            loginUser.getId();

	    String profileImg =
	            loginUser.getProfile_img();


	    if (profileFile != null && !profileFile.isEmpty()) {

	        String uploadPath =
	                "D:/uploads/";

	        String originalName =
	                profileFile.getOriginalFilename();

	        String extension =
	                originalName.substring(
	                        originalName.lastIndexOf(".")
	                );

	        String fileName =
	                UUID.randomUUID().toString()
	                + extension;

	        File saveFile =
	                new File(uploadPath + fileName);

	        profileFile.transferTo(saveFile);


	        profileImg =
	                fileName;

	    }



	    int result =
	            dao.updateUser(
	                    id,
	                    phone,
	                    email,
	                    zipcode,
	                    address1,
	                    address2,
	                    team,
	                    profileImg
	            );



	    if (result > 0) {



	        loginUser.setPhone(phone);

	        loginUser.setEmail(email);

	        loginUser.setZipcode(zipcode);

	        loginUser.setAddress1(address1);

	        loginUser.setAddress2(address2);

	        loginUser.setTeam(team);

	        loginUser.setProfile_img(profileImg);


	        session.setAttribute(
	                "loginUser",
	                loginUser
	        );


	        return "success";

	    }
	    return "fail";

	}
}
