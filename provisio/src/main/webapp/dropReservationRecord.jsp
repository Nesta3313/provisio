
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="provisio.acctBean"%>
<%@page import="provisio.ReservationBean"%>
<%@page import="provisio.ReservationBeanPeer"%>
<%@page import="provisio.HotelBean"%>
 <jsp:include page="makereservation.jsp" flush="true"/>
    
<!DOCTYPE html>
<html lang="en">

    
<%
HttpSession sess = request.getSession(); 
//sess.getAttribute("reservation_id");

// out.print(sess.getAttribute("reservation_id"));
ReservationBeanPeer reservationBeanPeer = new ReservationBeanPeer();
reservationBeanPeer.deleteReservationRecord(sess.getAttribute("reservation_id"));
%>

</html>
