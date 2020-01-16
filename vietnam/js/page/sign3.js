function formatDate(date) {
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
    return(date.getFullYear() + "-" + (
        (mymonth < 10)
            ? "0"
            : "") + mymonth + "-" + (
        (myweekday < 10)
            ? "0"
            : "") + myweekday);
}
$(document).ready(function(){
    // sms 쿠키 삭제
    setCookie('sms', null, -1);

    var d = new Date();
    var str = formatDate(d);
    var str2 = str.split('-');
    var strDate = str2[2] +"."+ str2[1] +"."+ str2[0];
    d.setDate(d.getDate() + 30);
    var end = formatDate(d);
    var end2 = end.split('-');
    var endDate = end2[2] +"."+ end2[1] +"."+ end2[0];
    $("#ymd").html(strDate+' ~ '+endDate);
});