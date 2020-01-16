$(document).ready(function() {
   $("#myCarousel").swiperight(function() {
      $(this).carousel('prev');
   });
   $("#myCarousel").swipeleft(function() {
      $(this).carousel('next');
   });
});

// 쿠키 저장
function setCookie(cookie_name, value, days) {
   var exdate = new Date();
   exdate.setDate(exdate.getDate() + days);
   // 설정 일수만큼 현재시간에 만료값으로 지정

   var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
   document.cookie = cookie_name + '=' + cookie_value;
}

// 쿠키 조회
function getCookie(cookie_name) {
   var x, y;
   var val = document.cookie.split(';');

   for (var i = 0; i < val.length; i++) {
      x = val[i].substr(0, val[i].indexOf('='));
      y = val[i].substr(val[i].indexOf('=') + 1);
      x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
      if (x == cookie_name) {
         return unescape(y); // unescape로 디코딩 후 값 리턴
      }
   }
}

// getprameter 조회
function get(name){
   if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
      return decodeURIComponent(name[1]);
}

// 이메일 정규표현식 함수
function validateEmail(email) {
   var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   return re.test(email);
}