<%
   //************************************************************************
   //                                                      //
   //      본 샘플소스는 개발 및 테스트를 위한 목적으로 만들어졌으며,      //
   //                                                      //
   //      실제 서비스에 그대로 사용하는 것을 금합니다.               //
   //                                                      //
   //************************************************************************
%>
<%
   response.setHeader("Pragma","no-cache");         // HTTP1.0 캐쉬 방지
   response.setDateHeader("Expires",0);            // proxy 서버의 캐쉬 방지
   response.setHeader("Pragma", "no-store");         // HTTP1.1 캐쉬 방지
   if(request.getProtocol().equals("HTTP/1.1"))
         response.setHeader("Cache-Control", "no-cache"); // HTTP1.1 캐쉬 방지
%>
<%@ page contentType = "text/html;charset=utf-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.regex.*" %>
<%@ page import = "java.text.*" %>
<%

	String rec_cert      = "";  // 결과값(암호화)
	String certNum       = "";  // certNum

	rec_cert = request.getParameter("rec_cert").trim();
	certNum  = request.getParameter("certNum").trim(); 
	// 파라미터 유효성 검증
   	if( rec_cert.length() == 0 || certNum.length() == 0 ){
      out.println("<script> alert('결과값 비정상');");
      return;
   	}
%>
<%
    // 변수선언 --------------------------------------------------------------------------------------------------------
	String k_certNum = certNum;             // 파라미터로 수신한 요청번호
	String date         = "";         // 요청일시
	String CI          = "";         // 연계정보(CI)
	String DI          = "";         // 중복가입확인정보(DI)
	String phoneNo      = "";         // 휴대폰번호
	String phoneCorp   = "";         // 이동통신사
	String birthDay      = "";         // 생년월일
	String gender      = "";         // 성별
	String nation      = "";         // 내국인
	String name         = "";         // 성명
	String M_name      = "";         // 미성년자 성명
	String M_birthDay   = "";         // 미성년자 생년월일
	String M_Gender      = "";         // 미성년자 성별
	String M_nation      = "";         // 미성년자 내외국인
	String result      = "";         // 결과값
	String certMet      = "";         // 인증방법
	String ip         = "";         // ip주소
	String plusInfo      = "";
	String encPara      = "";
	String encMsg1      = ""; 
	String encMsg2      = "";
	String msgChk       = "";

	//01. 암호화 모듈 (jar) Loading
	com.icert.comm.secu.IcertSecuManager seed = new com.icert.comm.secu.IcertSecuManager();

	//02. 1차 복호화
	//수신된 certNum를 이용하여 복호화
	rec_cert  = seed.getDec(rec_cert, k_certNum);

	//03. 1차 파싱
	int inf1 = rec_cert.indexOf("/",0);
	int inf2 = rec_cert.indexOf("/",inf1+1);

	encPara  = rec_cert.substring(0,inf1);         //암호화된 통합 파라미터
	encMsg1  = rec_cert.substring(inf1+1,inf2);    //암호화된 통합 파라미터의 Hash값

	//04. 위변조 검증
	encMsg2  = seed.getMsg(encPara);

	if(encMsg2.equals(encMsg1)){
		msgChk="Y";
	}
			
	//05. 2차 복호화
	rec_cert  = seed.getDec(encPara, k_certNum);

	//06. 2차 파싱
	int info1  = rec_cert.indexOf("/",0);
	int info2  = rec_cert.indexOf("/",info1+1);
	int info3  = rec_cert.indexOf("/",info2+1);
	int info4  = rec_cert.indexOf("/",info3+1);
	int info5  = rec_cert.indexOf("/",info4+1);
	int info6  = rec_cert.indexOf("/",info5+1);
	int info7  = rec_cert.indexOf("/",info6+1);
	int info8  = rec_cert.indexOf("/",info7+1);
	int info9  = rec_cert.indexOf("/",info8+1);
	int info10 = rec_cert.indexOf("/",info9+1);
	int info11 = rec_cert.indexOf("/",info10+1);
	int info12 = rec_cert.indexOf("/",info11+1);
	int info13 = rec_cert.indexOf("/",info12+1);
	int info14 = rec_cert.indexOf("/",info13+1);
	int info15 = rec_cert.indexOf("/",info14+1);
	int info16 = rec_cert.indexOf("/",info15+1);
	int info17 = rec_cert.indexOf("/",info16+1);
	int info18 = rec_cert.indexOf("/",info17+1);
	
	
	certNum      = rec_cert.substring(0,info1);

	date      = rec_cert.substring(info1+1,info2);
	CI         = rec_cert.substring(info2+1,info3);
	phoneNo      = rec_cert.substring(info3+1,info4);
	phoneCorp   = rec_cert.substring(info4+1,info5);
	birthDay   = rec_cert.substring(info5+1,info6);
	gender      = rec_cert.substring(info6+1,info7);
	nation      = rec_cert.substring(info7+1,info8);
	name      = rec_cert.substring(info8+1,info9);
	result      = rec_cert.substring(info9+1,info10);
	certMet      = rec_cert.substring(info10+1,info11);
	ip         = rec_cert.substring(info11+1,info12);
	M_name      = rec_cert.substring(info12+1,info13);
	M_birthDay   = rec_cert.substring(info13+1,info14);
	M_Gender   = rec_cert.substring(info14+1,info15);
	M_nation   = rec_cert.substring(info15+1,info16);
	plusInfo   = rec_cert.substring(info16+1,info17);
	DI         = rec_cert.substring(info17+1,info18);

	//07. CI, DI 복호화
	CI  = seed.getDec(CI, k_certNum);
	DI  = seed.getDec(DI, k_certNum); 

%>   

<html>
<head>
<meta name="robots" content="noindex">
<script type="text/javascript">
   var move_page_url = "//mobile.worldplaytime.com:8784/member_human_additional.html";
   

   function end() {
         var UserAgent = navigator.userAgent;
         
         // 결과 페이지 경로 셋팅
       document.kmcis_form.action = move_page_url;
   
       /* 모바일 접근 체크*/
       // 모바일일 경우 (변동사항 있을경우 추가 필요)
       if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
          document.kmcis_form.submit();
        } 
     
        // 모바일이 아닐 경우
        else {
         document.kmcis_form.target = opener.window.name;
           document.kmcis_form.submit();
              self.close();
        }
   } 
</script>
</head>
<body onload="javascript:end()">
<form id="kmcis_form" name="kmcis_form" method="get">
</form>
</body>
</html> 