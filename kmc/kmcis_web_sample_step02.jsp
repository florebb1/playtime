<%
//************************************************************************
// //
// 본 샘플소스는 개발 및 테스트를 위한 목적으로 만들어졌으며, //
// //
// 실제 서비스에 그대로 사용하는 것을 금합니다. //
// //
//************************************************************************
%>
<%
response.setHeader("Pragma", "no-cache" );
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-store");
response.setHeader("Cache-Control", "no-cache" );
%>
<%@ page contentType = "text/html;charset=utf-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.regex.*" %>
<%@ page import = "java.text.*" %>
<%@page import = "org.json.simple.JSONObject" %>
<%@page import = "org.json.simple.JSONArray" %>
<%
//날짜 생성
Calendar today = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
String day = sdf.format(today.getTime());

java.util.Random ran = new Random();
//랜덤 문자 길이
int numLength = 6;
String randomStr = "";

for (int i = 0; i < numLength; i++) {
//0 ~ 9 랜덤 숫자 생성
randomStr += ran.nextInt(10);
}

//reqNum은 최대 40byte 까지 사용 가능
String reqNum = day + randomStr;

//tr_cert 데이터 변수 선언 ---------------------------------------------------------------
String tr_cert = "";
String cpId = "PTGM1001"; // 회원사ID
String urlCode = request.getParameter("urlCode"); // URL코드
String certNum = reqNum; // 요청번호
String date = day; // 요청일시
String certMet = "M"; // 본인인증방법

String name = ""; // 성명
String phoneNo = ""; // 휴대폰번호
String phoneCorp = ""; // 이동통신사
if(phoneCorp == null) phoneCorp = "";
String birthDay = ""; // 생년월일
String gender = ""; // 성별
if(gender == null) gender = "";
String nation = ""; // 내외국인 구분
String plusInfo = ""; // 추가DATA정보
String extendVar = "0000000000000000"; // 확장변수
//End-tr_cert 데이터 변수 선언 ---------------------------------------------------------------

String tr_url = request.getParameter("urlRequest"); // 본인인증서비스 결과수신 POPUP URL
String tr_add = "N"; // IFrame사용여부

/** certNum 주의사항 **************************************************************************************
* 1. 본인인증 결과값 복호화를 위한 키로 활용되므로 중요함.
* 2. 본인인증 요청시 중복되지 않게 생성해야함. (예-시퀀스번호)
* 3. certNum값은 본인인증 결과값 수신 후 복호화키로 사용함.
tr_url값에 certNum값을 포함해서 전송하고, (tr_url = tr_url + "?certNum=" + certNum;)
tr_url에서 쿼리스트링 형태로 certNum값을 받으면 됨. (certNum = request.getParameter("certNum"); )
*
***********************************************************************************************************/
%>
<%!
// 파라미터 유효성 검증 --------------------------------------------
boolean b = true;
String regex = "";
String regex1 = "";

public Boolean paramChk(String patn, String param){
Pattern pattern = Pattern.compile(patn);
Matcher matcher = pattern.matcher(param);
b = matcher.matches();
return b;
}
%>
<%
/*
regex = "[A-Z]*";
regex1 = "[0-9]*";
if( cpId.length() == 8 ){
String engcpId = cpId.substring(0,4);
String numcpId = cpId.substring(4,8);
if( !paramChk(regex, engcpId) || !paramChk(regex1, numcpId) ){
out.println("<script> alert('회원사ID 비정상');");
out.println("history.back(); </script>");
}
} else {
out.println("<script> alert('회원사ID 비정상');");
out.println("history.back(); </script>");
}
*/
/*
regex = "[0-9]*";
if( urlCode.length() != 6 || !paramChk(regex, urlCode) ){
out.println("<script> alert('URL코드 비정상');");
out.println("history.back(); </script>");
}
*/

/*
if( certNum.length() == 0 || certNum.length() > 40){
out.println("<script> alert('요청번호를 입력하세요.');");
out.println("history.back(); </script>");
}
*/

/*
regex = "[0-9]*";
if( date.length() != 14 || !paramChk(regex, date) ){
out.println("<script> alert('요청일시 비정상');");
out.println("history.back(); </script>");
}
*/

/*
regex = "[A-Z]*";
if( certMet.length() != 1 || !paramChk(regex, certMet) ){
out.println("<script> alert('본인인증방법 비정상');");
out.println("history.back(); </script>");
}
*/
/*
regex = "[0-9]*";
if( phoneNo.length() != 0 ){
if( (phoneNo.length() != 10 && phoneNo.length() != 11) || !paramChk(regex, phoneNo) ){
out.println("<script> alert('휴대폰번호 비정상');");
out.println("history.back(); </script>");
}
}
*/

/*
regex = "[A-Z]*";
if( phoneCorp.length() != 0 ){
if( phoneCorp.length() != 3 || !paramChk(regex, phoneCorp) ){
out.println("<script> alert('이동통신사 비정상');");
out.println("history.back(); </script>");
}
}
*/

/*
regex = "[0-9]*";
if( birthDay.length() != 0 ){
if( birthDay.length() != 8 || !paramChk(regex, birthDay) ){
out.println("<script> alert('생년월일 비정상');");
out.println("history.back(); </script>");
}
}
*/
/*
regex = "[0-9]*";
if( gender.length() != 0 ){
if( gender.length() != 1 || !paramChk(regex, gender) ){
out.println("<script> alert('성별 비정상');");
out.println("history.back(); </script>");
}
}
*/
/*
regex = "[0-9]*";
if( nation.length() != 0 ){
if( nation.length() != 1 || !paramChk(regex, nation) ){
out.println("<script> alert('내/외국인 비정상');");
out.println("history.back(); </script>");
}
}
*/
/*
regex = "[\\sA-Za-z가-힣.,-]*";
if( name.length() != 0 ){
if( name.length() > 60 || !paramChk(regex, name) ){
out.println("<script> alert('성명 비정상');");
out.println("history.back(); </script>");
}
}
*/
/*
if( tr_url.length() == 0 ){
out.println("<script> alert('결과수신 URL 비정상');");
out.println("history.back(); </script>");
}
*/
/*
regex = "[A-Z]*";
if( tr_add.length() != 0 ){
if( tr_add.length() != 1 || !paramChk(regex, tr_add) ){
out.println("<script> alert('IFrame사용여부 비정상');");
out.println("history.back(); </script>");
}
}
*/

// END 파라미터 유효성 검증 --------------------------------------------

//01. 한국모바일인증(주) 암호화 모듈 선언
com.icert.comm.secu.IcertSecuManager seed = new com.icert.comm.secu.IcertSecuManager();

//02. 1차 암호화 (tr_cert 데이터변수 조합 후 암호화)
String enc_tr_cert = "";
tr_cert = cpId +"/"+ urlCode +"/"+ certNum +"/"+ date +"/"+ certMet +"/"+ birthDay +"/"+ gender +"/"+ name +"/"+ phoneNo +"/"+ phoneCorp +"/"+ nation +"/"+ plusInfo +"/"+ extendVar;
enc_tr_cert = seed.getEnc(tr_cert, "");

//03. 1차 암호화 데이터에 대한 위변조 검증값 생성 (HMAC)
String hmacMsg = "";
hmacMsg = seed.getMsg(enc_tr_cert);

//04. 2차 암호화 (1차 암호화 데이터, HMAC 데이터, extendVar 조합 후 암호화)
tr_cert = seed.getEnc(enc_tr_cert + "/" + hmacMsg + "/" + extendVar, "");


JSONObject object1 = new JSONObject();
object1.put("tr_cert",tr_cert);
object1.put("tr_url",tr_url);
object1.put("tr_add",tr_add);
out.clear();
out.println(object1);
out.flush();
%>