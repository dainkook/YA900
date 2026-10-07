package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.ScheduleDAO;
import com.kedu.dao.TicketDAO;
import com.kedu.dao.admin.ReservationDAO;
import com.kedu.dto.ScheduleDTO;
import com.kedu.dto.TicketDTO;

@Controller
@RequestMapping("/booking")
public class BookingController {
    
    @Autowired
    private ScheduleDAO scheduleDAO;
    
    @Autowired
    private ReservationDAO reservationDAO; 
    
    @Autowired
    private TicketDAO ticketDAO;
    

    @RequestMapping("/{game_id}")
    public String booking(
            @PathVariable int game_id,
            Model model,
            HttpSession session) {

        ScheduleDTO game = scheduleDAO.selectByGameId(game_id);
        String id = (String)session.getAttribute("id");
        List<TicketDTO> ticketList = ticketDAO.selectByGameId(game_id);
        model.addAttribute("id", id);
        List<Integer> reservedSeatIds =
                reservationDAO.selectReservedSeatIds(game_id);

        model.addAttribute("game", game);
        model.addAttribute("ticketList", ticketList);
        model.addAttribute("reservedSeatIds", reservedSeatIds);

        return "/main-book/booking";
    }
    
    @RequestMapping(value = "/reserve", method = RequestMethod.POST)
    @ResponseBody
    public String reserve(
            @RequestParam("game_id") int game_id,
            @RequestParam("seat_ids") List<Integer> seat_ids,
            @RequestParam("paymentId") String paymentId,
            HttpSession session) {

        String member_id = (String) session.getAttribute("id");

        if (member_id == null) {
            return "LOGIN_REQUIRED";
        }

        for (Integer seat_id : seat_ids) {

        	int result = reservationDAO.insertReservationBySeatId(
        	        member_id,
        	        game_id,
        	        seat_id,
        	        paymentId
        	);

        }

        return "SUCCESS";
    }
    
    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    @ResponseBody
    public String cancel(
            @RequestParam("reservation_id") int reservation_id) {

        try {

            String paymentId =
                    reservationDAO.selectPaymentId(reservation_id);

            if (paymentId == null || paymentId.trim().isEmpty()) {
                return "PAYMENT_ID_NOT_FOUND";
            }

            String apiSecret = "wuPgUUj5c2hmcEKsc8D5VzPLy5DidIJN3bQ51vbQKLpIW8NDn6xMhoHioohmH2LCPhXz9S8k2KotOL0Q";

            java.net.URL url = new java.net.URL(
                    "https://api.portone.io/payments/"
                    + java.net.URLEncoder.encode(paymentId, "UTF-8")
                    + "/cancel"
            );

            java.net.HttpURLConnection conn =
                    (java.net.HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setRequestProperty(
                    "Authorization",
                    "PortOne " + apiSecret
            );
            conn.setRequestProperty(
                    "Content-Type",
                    "application/json"
            );
            conn.setDoOutput(true);

            String body = "{\"reason\":\"고객 요청\"}";

            java.io.OutputStream os =
                    conn.getOutputStream();

            os.write(body.getBytes("UTF-8"));
            os.flush();
            os.close();

            int responseCode =
                    conn.getResponseCode();

            if (responseCode >= 200 && responseCode < 300) {

            	 reservationDAO.cancelReservationsByPaymentId(paymentId);

                return "SUCCESS";
            }

            return "CANCEL_FAILED";

        } catch (Exception e) {

            e.printStackTrace();

            return "CANCEL_ERROR";
        }
    }
}
