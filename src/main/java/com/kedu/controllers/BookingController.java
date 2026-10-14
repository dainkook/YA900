package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.ScheduleDAO;
import com.kedu.dao.TicketDAO;
import com.kedu.dao.UsersDAO;
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
    
    @Autowired
    private UsersDAO usersDAO;
    


	@RequestMapping("/{game_id}")
	public String booking(
	        @PathVariable int game_id,
	        Model model,
	        HttpSession session) {
	
	    ScheduleDTO game = scheduleDAO.selectByGameId(game_id);
	
	    String id = (String) session.getAttribute("id");
	
	    List<TicketDTO> ticketList =
	            ticketDAO.selectByGameId(game_id);
	
	    List<Integer> reservedSeatIds =
	            reservationDAO.selectReservedSeatIds(game_id);
	
	    model.addAttribute("id", id);
	    model.addAttribute("game", game);
	    model.addAttribute("ticketList", ticketList);
	    model.addAttribute("reservedSeatIds", reservedSeatIds);
	
	    // 로그인한 회원의 보유 포인트 조회
	    int memberPoint = 0;
	
	    if (id != null) {
	        memberPoint = usersDAO.selectPoint(id);
	    }
	
	    model.addAttribute("memberPoint", memberPoint);
	
	    return "/main-book/booking";
	}

	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public String reserve(
	        @RequestParam("game_id") int game_id,
	        @RequestParam("seat_ids") List<Integer> seat_ids,
	        @RequestParam("paymentId") String paymentId,
	        @RequestParam(value = "usedPoint", defaultValue = "0") int usedPoint,
	        HttpSession session) {
	
	    String member_id = (String) session.getAttribute("id");
	
	    if (member_id == null) {
	        return "LOGIN_REQUIRED";
	    }
	
	    if (seat_ids == null || seat_ids.isEmpty() || usedPoint < 0) {
	        return "INVALID_REQUEST";
	    }
	
	    // 현재 보유 포인트 확인
	    int currentPoint = usersDAO.selectPoint(member_id);
	
	    if (usedPoint > currentPoint) {
	        return "POINT_INSUFFICIENT";
	    }
	
	    // 예매 정보 저장: 첫 번째 좌석에만 사용 포인트 기록
	    for (int i = 0; i < seat_ids.size(); i++) {
	
	        Integer seat_id = seat_ids.get(i);
	
	        int pointToSave = (i == 0) ? usedPoint : 0;
	
	        int result = reservationDAO.insertReservationBySeatId(
	                member_id,
	                game_id,
	                seat_id,
	                paymentId,
	                pointToSave
	        );
	
	        // 저장 실패 시 트랜잭션 롤백
	        if (result <= 0) {
	            throw new IllegalStateException("예매 저장 실패");
	        }
	    }
	
	    // 포인트 차감
	    if (usedPoint > 0) {
	
	        int result = usersDAO.usePoint(member_id, usedPoint);
	
	        if (result != 1) {
	            throw new IllegalStateException("포인트 차감 실패");
	        }
	    }
	
	    return "SUCCESS";
	}
   
    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    @ResponseBody
    public String cancel(
            @RequestParam("reservation_id") int reservation_id) {
    	    try {
    	        // 1. 예약 번호로 결제 ID 조회
    	        String paymentId = reservationDAO.selectPaymentId(reservation_id);

    	        if (paymentId == null || paymentId.trim().isEmpty()) {
    	            return "PAYMENT_ID_NOT_FOUND";
    	        }

    	        // 2. 이미 취소된 결제인지 확인
    	        int activeCount =
    	                reservationDAO.selectActiveReservationCountByPaymentId(paymentId);

    	        if (activeCount <= 0) {
    	            return "ALREADY_CANCELLED";
    	        }

    	        // 3. 복구할 포인트와 회원 ID 조회
    	        int usedPoint =
    	                reservationDAO.selectUsedPointByPaymentId(paymentId);

    	        String memberId =
    	                reservationDAO.selectMemberIdByPaymentId(paymentId);

    	        if (memberId == null || memberId.trim().isEmpty()) {
    	            return "MEMBER_NOT_FOUND";
    	        }

    	        // 4. 환경변수에서 PortOne API Secret 가져오기
    	        String apiSecret = System.getenv("PORTONE_API_SECRET");

    	        if (apiSecret == null || apiSecret.trim().isEmpty()) {
    	            return "API_SECRET_NOT_CONFIGURED";
    	        }
    	        
    	        String apiSecret1 = System.getenv("PORTONE_API_SECRET");
    	     

    	        // 5. PortOne 결제 취소 요청
    	        java.net.URL url = new java.net.URL(
    	                "https://api.portone.io/payments/"
    	                + java.net.URLEncoder.encode(paymentId, "UTF-8")
    	                + "/cancel"
    	        );

    	        java.net.HttpURLConnection conn =
    	                (java.net.HttpURLConnection) url.openConnection();

    	        conn.setRequestMethod("POST");
    	        conn.setRequestProperty(
    	                "Authorization", "PortOne " + apiSecret1);
    	        conn.setRequestProperty(
    	                "Content-Type", "application/json");
    	        conn.setDoOutput(true);

    	        String body = "{\"reason\":\"고객 요청\"}";

    	        try (java.io.OutputStream os = conn.getOutputStream()) {
    	            os.write(body.getBytes("UTF-8"));
    	        }

    	        int responseCode = conn.getResponseCode();

    	        if (responseCode < 200 || responseCode >= 300) {
    	            java.io.InputStream errorStream = conn.getErrorStream();

    	            if (errorStream != null) {
    	                try (java.io.BufferedReader br =
    	                        new java.io.BufferedReader(
    	                            new java.io.InputStreamReader(
    	                                errorStream, "UTF-8"))) {

    	                    StringBuilder errorBody = new StringBuilder();
    	                    String line;

    	                    while ((line = br.readLine()) != null) {
    	                        errorBody.append(line);
    	                    }

    	                    System.out.println("PortOne 오류 내용: " + errorBody);
    	                }
    	            }

    	            conn.disconnect();
    	            return "CANCEL_FAILED";
    	        }

    	        conn.disconnect();

    	        // 6. 예약 상태를 취소로 변경
    	        int cancelledCount =
    	                reservationDAO.cancelReservationsByPaymentId(paymentId);

    	        if (cancelledCount <= 0) {
    	            throw new IllegalStateException("예약 취소 상태 변경 실패");
    	        }

    	        // 7. 사용 포인트 복구
    	        if (usedPoint > 0) {
    	            int pointResult = usersDAO.addPoint(memberId, usedPoint);

    	            if (pointResult != 1) {
    	                throw new IllegalStateException("포인트 복구 실패");
    	            }
    	        }

    	        return "SUCCESS";

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        return "CANCEL_ERROR";
    	    }
    	}
}
