<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="provisio.beans.acctBean"%>
<%@page import="provisio.beans.ReservationBean"%>
<%@page import="provisio.model.ReservationBeanPeer"%>
<%@page import="provisio.beans.HotelBean"%>
<jsp:useBean id="dataManager" scope="application"
  class="provisio.model.DataManager"/>
 <jsp:include page="reservation2.jsp" flush="true"/>
    
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
