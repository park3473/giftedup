 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 제이쿼리 -->
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
	#pdf_wrap{padding:15px;}
	.person_title{text-align:center;}
	.person_title > h2{margin: 0; margin-bottom:1rem;}
	.person_content{overflow:hidden;}
	.person_data{clear:both; float:right;}
	.person_user{clear:both; float:right;}
	.storage_btn{margin-top:1rem; clear:both; text-align:center; margin-bottom: 2rem; overflow:hidden;}
	.storage_btn > a{display: inline-block; font-size: 0.9rem; color: #555; padding:10px 15px; background-color: rgb(240,240,240); text-decoration: none;}
</style>
<!DOCTYPE html>
<html lang="ko">
<div id = "pdf_wrap">
<c:if test="${model.pageDomain.INFO_AGREEMENT == '1'}"> 
<div>
	<div class="person_title">
		<h2>영재키움 프로젝트 개인정보 수집동의서[일반용]</h2>
	</div>
	<div class="person_content">
		${session_infoAgreement}
		<div class="person_data"><span>${fn:substring(model.pageDomain.INFO_AGREEMENT_TM,0,19)}</span></div>
		<div class="person_user"><span>정보 제공자 : <span>${model.pageDomain.NAME}</span></span>
			</div>
		</div>
	</div>
</div>
</c:if>
<c:if test="${model.pageDomain.INFO_AGREEMENT != '1'}"> 
<li>
		동의 하지 않음
</li>
</c:if>
</div>

<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>


<div class="storage_btn">
	<a class="storage" href="javascript:insertClick()">정보이용동의서출력</a>
	<a class="storage" href="javascript:pdfDown()">정보이용동의서출력(PDF)</a>
</div>

</html>

<script type="text/javascript">
	

	function insertClick()
	{
				
		var initBody = document.body.innerHTML;
        window.onbeforeprint = function(){
            document.body.innerHTML = document.getElementById('pdfView').innerHTML;
        }
        window.onafterprint = function(){
            document.body.innerHTML = initBody;
        }
        window.print(); 
        
		
	}

	function pdfDown()
	{
		html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
			var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
	    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
	    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
	    doc.save('infofile.pdf'); //pdf저장
	  });
	}
	pdfDown();
</script>