package com.kedu.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.admin.ReservationDAO;
import com.kedu.dto.PageDTO;
import com.kedu.dto.ReservationDTO;

@Controller
@RequestMapping("/admin/reservation")
public class ReservationController {

	@Autowired
	private ReservationDAO reservationDAO;
	
	@RequestMapping("")
	public String selectAll(
	        @RequestParam(value = "cpage", defaultValue = "1") int cpage,
	        Model model) {

	    int recordCount = reservationDAO.getCount();

	    PageDTO page = new PageDTO(cpage, recordCount, 10);

	    List<ReservationDTO> list =
	            reservationDAO.selectAll(page);

	    model.addAttribute("list", list);
	    model.addAttribute("page", page);
	    model.addAttribute("reservationCount", recordCount);

	    return "admin/reservation";
	}
	
	@RequestMapping("/search")
	public String search(@RequestParam("searchType")String searchType,
						 @RequestParam("keyword") String keyword,
						 @RequestParam(value = "cpage", defaultValue = "1")int cpage,
						 Model model) {
		int recordCount = reservationDAO.getSearchCount(searchType, keyword);
		PageDTO page = new PageDTO(cpage, recordCount, 10);
		List<ReservationDTO> list = reservationDAO.search(searchType, keyword, page);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("reservationCount", recordCount);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "admin/reservation";
	}
	
	@RequestMapping("/detail")
	public String detail(int reservation_id, Model model) {
		ReservationDTO reservation = reservationDAO.selectById(reservation_id);
		
		model.addAttribute("reservation", reservation);
		
		return "admin/reservationDetail";
	}
	
	@PostMapping("/cancel")
	public String cancel(int reservation_id) {

	    reservationDAO.cancel(reservation_id);

	    return "redirect:/admin/reservation/detail?reservation_id=" + reservation_id;
	}

}
