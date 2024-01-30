<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
	<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
<script>
function fileDown(url)
{
	location.href = encodeURI(url);
	
}

$( document ).ready(function() {
	var oldVal = "";
	$("#sms_text").on("change keyup paste", function() {
	    var currentVal = $(this).val();
	    if(currentVal == oldVal) {
	        return;
	    }
	 
	    oldVal = currentVal;
	    $('#sms_text_size').text(oldVal.length);
	});

	
	
	$("#RESERVATION").change(function(){
	        if($("#RESERVATION").is(":checked")){
	            $("#RESERVATION_TM").show();
	            $("#RESERVATION_TM2").hide();

	        }else{
	        	$("#RESERVATION_TM").hide();
	        	$("#RESERVATION_TM2").show();
	        }
    });
});


//member 회원 관리 쪽 문자 보내기
function smssend(type)
{
	console.log(type);
	if($('#sms_text').val() == '')
	{
		alert('문자메세지를 이용하세요.');
		
		return;
	}
	
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			console.log($(this).data());
			deleteArrIdx = deleteArrIdx + $(this).data("memberid") + ",";
		}

	}); 
	
	if(deleteArrIdx == '')
	{
		alert('문자메세지를 대상을 확인 부탁 드립니다.');
		return;
	}
		
	var URL = '${pageContext.request.contextPath}/admin/sms_log/'+type+'/insert.do?';
	
	//var formData = $("#updateform").serialize();
	var formData = "MESSAGE="+$('#sms_text').val();
	formData += "&PHONE="+deleteArrIdx;
	formData += "&RESERVATION="+$("input:checkbox[id='RESERVATION']").is(":checked")
	formData += "&RESERVATION_TM="+$('#RESERVATION_TM').val();
	console.log(formData);
	console.log(URL);
	/*
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : formData,
		success: function(result)
		{
			if(result.indexOf("true") > -1)
			{
				alert('성공하였습니다.');
				//$('.modal').click();
				window.location.reload();	
			}else
			{
				alert('실패 하였습니다.');
				//$('.modal').click();
				
			}
		}
	});
	*/
}

//member_re (신입생 지원 리스트) 쪽 문자 보내기
function smssend_re(type)
{
	console.log(type);
	if($('#sms_text').val() == '')
	{
		alert('문자메세지를 이용하세요.');
		
		return;
	}
	
	deleteArrIdx = "";
	$("input[name=chk_calc]").each(function() {
			
		var chk = $(this).is(":checked");

		console.log(chk);
		
		if(chk == true)
		{
			console.log($(this).data());
			deleteArrIdx = deleteArrIdx + $(this).data("idx") + ",";
		}

	}); 
	
	if(deleteArrIdx == '')
	{
		alert('문자메세지를 대상을 확인 부탁 드립니다.');
		return;
	}
		
	var URL = '${pageContext.request.contextPath}/admin/sms_log/'+type+'/insert_re.do?';
	
	//var formData = $("#updateform").serialize();
	var formData = "MESSAGE="+$('#sms_text').val();
	formData += "&PHONE="+deleteArrIdx;
	formData += "&RESERVATION="+$("input:checkbox[id='RESERVATION']").is(":checked")
	formData += "&RESERVATION_TM="+$('#RESERVATION_TM').val();
	console.log(formData);
	console.log(URL);
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : formData,
		success: function(result)
		{
			if(result.indexOf("true") > -1)
			{
				alert('성공하였습니다.');
				//$('.modal').click();
				window.location.reload();	
			}else
			{
				alert('실패 하였습니다.');
				//$('.modal').click();
				
			}
		}
	});
}
//신입생 전체 문자 보내기
function smssend_all(type){
	console.log(type);
	if($('#sms_text').val() == '')
	{
		alert('문자메세지를 이용하세요.');
		
		return;
	}
	
	var URL = '${pageContext.request.contextPath}/admin/sms_log/'+type+'/insert_pass.do?';
	
	//var formData = $("#updateform").serialize();
	var formData = "MESSAGE="+$('#sms_text').val();
	formData += "&RESERVATION="+$("input:checkbox[id='RESERVATION']").is(":checked");
	formData += "&RESERVATION_TM="+$('#RESERVATION_TM').val();
	console.log(formData);
	console.log(URL);
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : formData,
		success: function(result)
		{
			if(result.indexOf("true") > -1)
			{
				alert('성공하였습니다.');
				//$('.modal').click();
				window.location.reload();	
			}else
			{
				alert('실패 하였습니다.');
				//$('.modal').click();
				
			}
		}
	});
	
}

</script>