package provisio.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import provisio.beans.acctBean;
import provisio.beans.ReservationBean;
import provisio.beans.HotelBean;

public class ReservationBeanPeer {
	
	
	public static void insertReservation(Statement stmt, ReservationBean reservation) throws SQLException {
		
		    String sql = "insert into reservations (reservation_ID, hotel_ID,"
		        + " check_in, check_out, number_of_guest, customer_ID, location, room_size, amenities, loyalty_points) values ('"
		        + reservation.getReservation_ID() + "','" + reservation.getHotel_ID() + "','"
		        + reservation.getCheck_in() + "','"
		        + reservation.getCheck_out() + "','" + reservation.getNumber_of_guest()
		        + "','" + reservation.getCustomer_ID() + "', '" + reservation.getLocation()+ "', '" + reservation.getRoom_size() + "', '"+ reservation.getAmenities() + "', '" + reservation.getLoyalty_points()+ "')"
		        ;
		        
		    stmt.executeUpdate(sql);
	}
	
	public int insertReservation(ReservationBean reservationBean) throws ClassNotFoundException {
        String sql = "INSERT INTO provisio.reservations" +
            "(reservation_ID, hotel_ID, check_in, check_out, number_of_guest, customer_ID, location, room_size, amenities, loyalty_points)" +
            " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        int result = 0;   
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/provisio", "root", "MySQL8IsGreat!");

            PreparedStatement stmt = conn.prepareStatement(sql)) {
        	stmt.setInt(1, reservationBean.getReservation_ID());
        	stmt.setInt(2, reservationBean.getHotel_ID());
            stmt.setString(3, reservationBean.getCheck_in());
            stmt.setString(4, reservationBean.getCheck_out());
            stmt.setString(5, reservationBean.getNumber_of_guest());
            stmt.setInt(6, reservationBean.getCustomer_ID());
            stmt.setString(7, reservationBean.getLocation());
            stmt.setString(8, reservationBean.getRoom_size());
            stmt.setString(9, reservationBean.arrayToString(reservationBean.getAmenities()));  // pass an array??? or convert array to string????
            stmt.setInt(10, reservationBean.getLoyalty_points());
;
            System.out.println(stmt);
            result = stmt.executeUpdate();
            
        } catch (SQLException e) {
            // printSQLException(e);
        }
        return result;
    }
	
	
	public int deleteReservationRecord(Object resid) throws ClassNotFoundException {
        
		String sql = "DELETE FROM provisio.reservations WHERE reservation_id = " + resid;

        int result = 0;   
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/provisio", "root", "MySQL8IsGreat!");

            PreparedStatement stmt = conn.prepareStatement(sql)) {
        	
        	
            System.out.println(stmt);
            result = stmt.executeUpdate();
            
        } catch (SQLException e) {
            // printSQLException(e);
        }
        return result;
    }
	
	public int insertReservationRecord(Object resid, Object hotelid, Object checkin, Object checkout, 
			Object numguest, Object customerid, Object location, Object roomsize, Object amenities, 
			Object loyaltypoints) throws ClassNotFoundException {
       
		String sql = "insert into reservations (reservation_ID, hotel_ID,"
		        + " check_in, check_out, number_of_guest, customer_ID, location, room_size, amenities, loyalty_points) values ('"
		        + resid + "','" + hotelid + "','"
		        + checkin + "','"
		        + checkout + "','" + numguest
		        + "','" + customerid + "', '" + location+ "', '" + roomsize + "', '"+ amenities + "', '" + loyaltypoints+ "')"
		        ;

        int result = 0;   
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/provisio", "root", "MySQL8IsGreat!");

            PreparedStatement stmt = conn.prepareStatement(sql)) {
        	//stmt.setInt(1, reservationBean.getReservation_ID());*/
        	
            System.out.println(stmt);
            result = stmt.executeUpdate();
            
        } catch (SQLException e) {
            // printSQLException(e);
        }
        return result;
    }
	
	
}
