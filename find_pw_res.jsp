<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>PlayTime</title>
<meta charset="UTF-8">
<meta name="viewport" content="viewport-fit=cover, width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="/css/style.css?date=<?=time()?>">
<link rel="stylesheet" href="//use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="//cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link rel="stylesheet" href="//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css">
<!-- Bootstrap -->
<!-- <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"> -->
<style> 
  body {
    margin: 0px;
  }
  .find_a  { 
    width:calc(100% - 42px);
    height: 100%;
    font-size: 13px;
    border-radius: 10px;
    border:1px solid #ddd;
    padding: 12px 20px;
  }
  .find_b  { 
    width:calc(100% - 63px);
    height: 100%;
    font-size: 13px;
    border-radius: 10px;
    border:1px solid #ddd;
    padding: 12px 20px;
    background-color:rgba(0,0,0,0.1);
  }
  .button {
    background-color: #FFCA02;
    border-radius:10px;
    color: #fff;
  }
.footer {
    bottom: 0;
    height:90px;
    text-align: center;
    left: 0;
    right: 0;
    background-color: #FFCA02;
    border-color: #FFCA02;
    color: #fff;
    width:100%;
    margin:0;
}

  a:link { color: #808080; text-decoration: none;}

  .input-group-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -ms-flex-direction: row;
    flex-direction: row;
    margin-top:10px;
  }
  .input-group-wrap input {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex-grow: 1;
  }
  .input-group-wrap button {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    width:80px;
    text-align:center;
    padding:0;
    margin-left:3px;
  }
  .change-pw-info {
    line-height:140%;
    padding:20px 0;
  }
  .change-pw-info ul {
    list-style:none;
    margin:0 5% 0 0;
  }
  .change-pw-info ul li {
    padding-bottom:5px;
    list-style:disc;
    line-height:140%;
    text-align:left;
    font-size:12px;
    color:#d35252;
  }
  .dkjsfd {
	  min-height: 400px;
  }
</style>
</head>
<body>
	<div style="margin:0 8%; text-align:right; padding-top:40px; font-size:20px;"><i class="fas fa-times" id="back"></i></div>
	<div style="text-align:center; padding-top:25px;">
		<a href="/login.html"><img src="/images/logo.png" style="width:160px; text-align:center;"></a>
	</div>
	<div id="content" class="dkjsfd" style="text-align:center;">
		<div class="nsrB" style="font-size:22px; line-height:30px; padding:25px 0; color:#000;">나머지 정보를<br>입력해주세요!</div>

		<form id="seachPw-frm" method="POST" style="margin:0 8%">
		    <input type="hidden" name="USER_ID" value="MOBILE">
		    <input type="hidden" name="F_TYPE" value="PW">
		    <input type="hidden" id="MOBILE" name="MOBILE">
		    <input type="hidden" id="CUST_NM" name="CUST_NM">
	     
			<input class="find_a" type="text" name="CUST_WEB_ID" id="CUST_WEB_ID" placeholder="아이디(이메일형식)를 입력해주세요.">
	
		    <div class="input-group-wrap">

		      <input class="find_b" type="text" name="EMAIL" placeholder="이메일을 입력해 주세요." readonly style="
		    margin-right:10px; !important">
		      <button id="emailEdit-btn" class="button" type="button">수정</button>
		    </div>
	  	</form>

		<div class="change-pw-info">
			<h5 style="text-align:center;">임시비밀번호 받으실 이메일을 변경하실 수 있습니다.</h5>
			<ul>
			  <li>임시비밀번호는 이메일 항목에 적은곳으로 발송됩니다.</li>
			  <li>아이디를 입력하시면 이메일항목에 아이디가 자동으로 추가됩니다.</li>
			  <li style="">수정버튼을 클릭하여 임시비밀번호를 받으실 이메일을 수정하실 수 있습니다.</li>
			</ul>
		</div>
	</div>
	<button id="next-btn" type="button" class="footer nsrB" style="font-size:22px; border:none;">
		<p style="padding-bottom:20px">확인</p>
	</button>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="//unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(window).resize(function() {
    $('#content').height($(window).height() - 217);
});

$(window).trigger('resize');
function getParameterByName(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);
  return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/gi, "");
}
function getCookie(name) {
  var v = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
  return v ? v[2] : null;
}
 
$(document).ready(function(){
  // 본인인증 정보 받기
  var name = '<%=request.getParameter("name")%>';
  var ph = '<%=request.getParameter("phoneNo")%>';
  $("#CUST_NM").val(name);
  $("#MOBILE").val(ph);
  
  console.log($("#CUST_NM").val());

  //아이디 입력 이벤트
  $(document).on("keyup", "#CUST_WEB_ID", function () {
    if ( $("input[name='EMAIL']").is('[readonly]') ) {
      var text = $("#CUST_WEB_ID").val();
      $("input[name='EMAIL']").val(text);
    }
  });

  // 수정버튼 이벤트
  $("#emailEdit-btn").click(function(){
    $("input[name='EMAIL']").val("");
    $("input[name='EMAIL']").css("background-color","#fff");
    $("input[name='EMAIL']").attr("readonly", false);
  });

  // 확인 클릭 이벤트
  $(".footer").click(function(){
    var email = $("#CUST_WEB_ID").val().trim();
    var email2 = $("input[name='EMAIL']").val().trim();
    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var datas = $("#seachPw-frm").serialize();
    if( !email ){ 
      swal({
        button: "확인",
        title: "시스템 안내",
        text: '아이디를 입력해주세요.',
        closeOnClickOutside: false
      })
      return false; 
    }else { 
      if(!regExp.test(email)) { 
        swal({
        button: "확인",
        title: "시스템 안내",
        text: '잘못된 형식의 이메일주소입니다.',
        closeOnClickOutside: false
        })
      return false; 
      } 
    } 
    if( !email2 ){ 
      swal({
        button: "확인",
        title: "시스템 안내",
        text: '이메일주소를 입력해주세요.',
        closeOnClickOutside: false
      })
      return false; 
    }else { 
      if(!regExp.test(email2)) { 
        swal({
        button: "확인",
        title: "시스템 안내",
        text: '잘못된 형식의 이메일주소입니다.',
        closeOnClickOutside: false
        })
      return false; 
      } 
    } 
    console.log(datas);
    // return false;
    $.ajax({
        url : "/api/mbl_0420.jsp",
        type : 'POST',
        dataType : 'JSON',
        data : datas,
        success:function(response){
          if(response.RET_CD == "0001") {
      			swal({
      				button: "확인",
      				title: "시스템 안내",
      				text: '임시비밀번호가 해당 이메일로 전송되었습니다.',
      				closeOnClickOutside: false
      			}).then(function() {
      				window.location = "/login.html";
      			});
          }else {
            swal({
              button: "확인",
              title: "시스템 안내",
              text: '오류코드: '+response.RET_CD+'\n'+response.RET_MSG,
              closeOnClickOutside: false
            });
          }
        },
        error: function(error){
          swal({
              button: "확인",
              title: "시스템 안내",
              text: '통신상 오류가 발생했습니다. 고객센터에 문의해 주시기 바랍니다.',
              closeOnClickOutside: false
            });
        }
    })
  })
  $('#back').click(function(){
      console.log('a');
      document.location.href="/login.html";
    });
});
</script>
</body>
</html>
