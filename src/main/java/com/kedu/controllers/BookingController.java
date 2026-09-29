package com.kedu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@RequestMapping("/1")
	public String booking1() {
	    System.out.println("===== BOOKING 1 진입 =====");
	    return "/main-book/booking1";
	}
	
	@RequestMapping("/2")
    public String booking2() {
        return "/main-book/booking2";
    }
	
	@RequestMapping("/3")
    public String booking3() {
        return "/main-book/booking3";
    }
	
	@RequestMapping("/4")
    public String booking4() {
        return "/main-book/booking4";
    }
	
	@RequestMapping("/5")
    public String booking5() {
        return "/main-book/booking5";
    }
	
}
