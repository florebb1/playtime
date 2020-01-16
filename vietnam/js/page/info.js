$(document).ready(function(){
    //상세 히스토리 내역 감추기
    $('.history-content').hide();

    //히스토리 타이틀 클릭 이벤트
    $('.history-title').click(function(){
        $(this).find("i").toggleClass("rotate");
        $(this).next().toggle();
    });
});