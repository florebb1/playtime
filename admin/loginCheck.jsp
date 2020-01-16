<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
 
//	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@211.233.6.241:1521:PTIMECRM";

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@121.166.131.122:1521:PTMTEST";
 
	Boolean connect = false;
	Statement stmt = null;
	ResultSet rs = null;

	String admuId = request.getParameter("admuId");
    String admuPw = request.getParameter("admuPw");

	try{
		Class.forName(driver);
//		conn = DriverManager.getConnection(url, "ptime_mbl", "ptime_mbl2019");
		conn=DriverManager.getConnection(url,"ptime_mbl","ptime_mbl1234");
		stmt = conn.createStatement();
		connect = true;

	}catch(Exception e){
 		connect = false;
  		e.printStackTrace();
	}

	if(connect == true){
		String query = ""; 
		query += "SELECT";
		query += " ID, PW, COMP_CD";
		query += "  FROM PT_ADMUSER";
		query += " WHERE ID = '" + admuId + "'";

		String id;
        String password;
		rs = stmt.executeQuery(query);
        rs.next();

		id = rs.getString("ID");
		password = rs.getString("PW");

        if(password.equals(admuPw)) {
			session.setAttribute("id",id);
			response.sendRedirect("./pages/notice/noti_list.jsp");
        } else {
            out.println("<script>");
            out.println("   alert('Login Fail!');");
            out.println("   location.href = 'login.jsp'");
            out.println("</script>");
        }
  		stmt.close();

  	} else {
  		// connection 오류
        out.println("<script>");
        out.println("   alert('Login Error!');");
        out.println("   location.href = 'login.jsp'");
        out.println("</script>");
	}
	//out.clear();
	out.flush();
%>