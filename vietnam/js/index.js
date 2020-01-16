window.onload = function() {
  
  function setCurrentSlide(ele,index){
    $(".swiper1 .swiper-slide").removeClass("selected");
    ele.addClass("selected");
    //swiper1.initialSlide=index;
  }
  
  var swiper1 = new Swiper('.swiper1', {
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween:3,
        freeMode: true,
        loop: false,
        onTab:function(swiper){
          var n = swiper1.clickedIndex;
          alert(1);
        }
    });

  swiper1.slides.each(function(index,val){
    var ele=$(this);
    ele.on("click",function(){
      setCurrentSlide(ele,index);
      swiper2.slideTo(index, 500, false);
      //mySwiper.initialSlide=index;
    });
  });
  
  
var swiper2 = new Swiper ('.swiper2', {
    autoHeight: true,
    direction: 'horizontal',
    loop: false,
    onSlideChangeEnd: function(swiper){
      var n=swiper.activeIndex;
      setCurrentSlide($(".swiper1 .swiper-slide").eq(n),n);
      swiper1.slideTo(n, 500, false);
    }
  });
  var poem="";
	$(".start").on('click',function(){
		$(".show").html('');
		var flag = true,j = 0;
			//if(flag){
				//flag = false;
				(function play(){
					if(j < poem.length){
						setTimeout(function(){
							$(".show").html(poem.slice(0,j++));
							play();
						},200);
					}
					else{
						$(".show").html(poem);
						flag = true;
					}
				})();
			//}
	});
};

// var tabs = document.getElementsByClassName('swiper-slide');
// Array.prototype.forEach.call(tabs, function(tab) {
//   tab.addEventListener('click', setActiveClass);
// });
// function setActiveClass(evt) {
//   Array.prototype.forEach.call(tabs, function(tab) {
//     tab.classList.remove('selected');
//   });
//
//   evt.currentTarget.classList.add('selected');
// }

function setCookie(cookie_name, value, days) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + days);
    // 설정 일수만큼 현재시간에 만료값으로 지정

    var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
    document.cookie = cookie_name + '=' + cookie_value;
}

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

function get(name){
    if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
        return decodeURIComponent(name[1]);
}

// 이메일 정규표현식 함수
function validateEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}