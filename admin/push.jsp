<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.JSONArray" %>
<%@ page import="com.google.android.gcm.server.*"%>
<%
	Connection conn=null;
 
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@211.233.6.241:1521:PTIMECRM";
 
	Boolean connect=false;
	PreparedStatement pstmt=null;
	ResultSet rs;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,"ptime_mbl","ptime_mbl2019");
  
		connect=true;

	}catch(Exception e){
 		connect=false;
  		e.printStackTrace();
	}
	JSONObject object1 = new JSONObject();
	if(connect==true){
		    
    	boolean SHOW_ON_IDLE = true;    //옙 활성화 상태일때 보여줄것인지
		int LIVE_TIME = 1;    //옙 비활성화 상태일때 FCM가 메시지를 유효화하는 시간입니다.
		int RETRY = 2;    //메시지 전송에 실패할 시 재시도 횟수입니다.
		String simpleApiKey = "AAAAXHjLOL8:APA91bEF_Ob_nQpqGf67ox88oeOT5XG0Of9yT2p9bcBIsfhswlSn3x3op641iMZwka0ArcXVBuEOgRmWKCmyhNpZ23RsZlXBhc7t7JmEPwHqClhAnkptHxNt45i9eLDEWWNmI_gkggXn";
		String gcmURL = "https://android.googleapis.com/fcm/send";

		String sql = "select * from push_msg where TO_CHAR(REQ_SEND_DT, 'yyyy-mm-dd hh24:mi') <= TO_CHAR(SYSDATE, 'yyyy-mm-dd hh24:mi') AND send_yn = 'N' ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		request.setCharacterEncoding("utf-8");
		while(rs.next()){
			ArrayList<String> token = new ArrayList<String>();
			String MESSAGE_ID = String.valueOf(Math.random() % 100 + 1);
			token.add(rs.getString("AUTH_TOKEN"));
			String title = new String("PlayTime".getBytes("UTF-8"),"UTF-8");    
        	String msg = new String(rs.getString("CONTENT").getBytes("UTF-8"), "UTF-8");   //메시지 한글깨짐 처리  // msg.jsp 에서 전달받은 메시지
        	Sender sender = new Sender(simpleApiKey);
	        Message message = new Message.Builder()
	        .collapseKey(MESSAGE_ID)
	        .delayWhileIdle(SHOW_ON_IDLE)
	        .timeToLive(LIVE_TIME)
	        .addData("message",msg)
	        .addData("title",title)
	        .build();
	        MulticastResult result1 = sender.send(message,token,RETRY);

	        String sql2 = "update push_msg set send_yn = 'Y' where trans_no = '"+rs.getString("trans_no")+"' ";
	        pstmt = conn.prepareStatement(sql2);
	        pstmt.executeQuery();

	        out.print(result1);
		}
		//token.add("eHZfl4vg7hE:APA91bEhPEvhMTDZcCuTI2hxELU4HurDXb7QG6D_I3YoX2OApZCFJssp1FY-Ks0OZYtQ8M40Olpe-KMszexqbPt8ySNkGQ6d7MmzZENcqhKpbu1UXWIoGtCZp6G840Ah7k2hFTDkn7jB");
  		//pstmt.close();
  		
        /*out.print(result1);
        if (result1 != null) {
            List<Result> resultList = result1.getResults();
            for (Result result : resultList) {
                System.out.println(result.getErrorCodeName()); 
            }
        }*/
  	}
	// out.clear();
	// out.println(object1);
	//out.flush();
%>