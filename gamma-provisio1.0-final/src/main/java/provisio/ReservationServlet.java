package provisio;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import provisio.createAcctBean;
import provisio.acctBean;
import provisio.ReservationBeanPeer;
import provisio.ReservationBean;
import provisio.HotelBean;

@WebServlet("/insert")
public class ReservationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ReservationBeanPeer reservation;

	
	
    public void init() {
        reservation = new ReservationBeanPeer();
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    	HotelBean hotel = new HotelBean();
    	ReservationBean reservationBean = new ReservationBean();
    	 
    	int reservation_id = (int)(Math.random()*9999);
    	 
    	acctBean acct = new acctBean();
    	int customer_id = acct.getCustomerID();  // get the customer id from the acctBean class
    
        String  check_in = request.getParameter("check_in");
        String check_out = request.getParameter("check_out");
        
        String number_of_guest = request.getParameter("number_of_guest");
        
        String location = request.getParameter("location");
        int hotel_id = hotel.findHotelId(location);  // get the hotel id
        
        String room_size = request.getParameter("room_size");
        
        String[] amenities = request.getParameterValues("amenities");

        int loyalty_points = reservationBean.calculatePoints(check_in, check_out);
        
        HttpSession sess = request.getSession(); 
        sess.setAttribute("customer_ID", customer_id);
        sess.setAttribute("hotel_ID", hotel_id);
        sess.setAttribute("check_in", check_in);
        sess.setAttribute("check_out", check_out);
        sess.setAttribute("number_of_guest", number_of_guest);
        sess.setAttribute("location", location);
        sess.setAttribute("room_size", room_size);
        sess.setAttribute("amenities", amenities);
        sess.setAttribute("loyalty_points", loyalty_points);

        reservationBean.setReservation_ID(reservation_id);
        reservationBean.setHotel_ID(hotel_id);
        reservationBean.setCheck_in(check_in);
        reservationBean.setCheck_out(check_out);
        reservationBean.setNumber_of_guest(number_of_guest);
        reservationBean.setCustomer_ID(customer_id);
        reservationBean.setLocation(location);
        reservationBean.setRoom_size(room_size);
        reservationBean.setAmenities(amenities);
        reservationBean.setLoyalty_points(loyalty_points);

        try {
            reservation.insertReservation(reservationBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("loyaltypoints.jsp");
    }
}
