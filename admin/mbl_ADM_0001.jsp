<%@page language = "java" contentType="text/html; charset=utf-8"%>
<%@page import = "java.util.*" %>
<%@page import = "java.sql.*" %>
<%@page import = "org.json.simple.JSONObject" %>
<%@page import = "org.json.simple.JSONArray" %>
<%
	Connection conn = null;
 
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@211.233.6.241:1521:PTIMECRM";
 
	Boolean connect = false;
	PrepareStatement pstmt = null;
	ResultSet rset;	
	ResultSet rs;

	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"ptime_mbl","ptime_mbl2019");
		connect = true;
	}catch(Exception e){
 		connect = false;
  		e.printStackTrace();
	}

	JSONObject object1 = new JSONObject();
	if(connect == true){
		String query; 
		query += "SELECT";
		query += "  NEWS_ID, TITLE, THUMB_ID, CONTS_ID, NEWS_TAG_01, NEWS_TAG_02, NEWS_TAG_03, USE_INFO, REG_DTM, UDT_DTM";
		query += "  from PT_NEWS";
		query += " WHERE USE_INFO = 'Y'";

		pstmt = conn.prepareStatement(query);
		rs.pstmt.executeQuery();

		JSONArray jsonArray = new JSONArray();
		while(rs.next()){
			JSONObject objectItem = new JSONObject();
			objectItem.put("NEWS_ID", rs.getString("NEWS_ID"));
			objectItem.put("TITLE", rs.getString("TITLE"));
			objectItem.put("THUMB_ID", rs.getString("THUMB_ID"));
			objectItem.put("CONTS_ID", rs.getString("CONTS_ID"));
			objectItem.put("NEWS_TAG_01", rs.getString("NEWS_TAG_01"));
			objectItem.put("NEWS_TAG_02", rs.getString("NEWS_TAG_02"));
			objectItem.put("NEWS_TAG_03", rs.getString("NEWS_TAG_03"));
			objectItem.put("USE_INFO", rs.getString("USE_INFO"));
			objectItem.put("REG_DTM", rs.getString("REG_DTM"));
			objectItem.put("UDT_DTM", rs.getString("UDT_DTM"));
			jsonArray.add(objectItem);
		}
		object1.put("RESULT",jsonArray);
  		cstmt.close();
		object1.put("RET_CD", "0001");
		object1.put("RET_MSG", "조회 성공!");

  	} else {
  		// connection 오류
  		object1.put("RET_CD","1000");
  		object1.put("RET_MSG","디비서버 커넥션 불가");
	}
	out.clear();
	out.println(object1);
	out.flush();
%>