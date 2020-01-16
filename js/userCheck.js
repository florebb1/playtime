function userCheck(userId){
	$.ajax({
		url : "/api/mbl_0500.jsp",
		type : 'POST',
		dataType : 'JSON',
		data : "USER_ID=MOBILE&CUST_ID="+userId,
    success:function(response){
      if(response.RESULT[0] !== undefined){  	
	    	if(response.RET_CD == "0001") {
            // console.log(response.RESULT[0].CUST_STAT);
           		if (response.RESULT[0].CUST_STAT != null) {
               		if (response.RESULT[0].CUST_STAT != "2") {
                   		document.location.href="logout.html";
               		}
           		}
       		}else if(response.RET_CD == "0170"){
           		document.location.href="logout.html";
       		}
      }else{
        document.location.href="logout.html";
      }
		}
	});
}