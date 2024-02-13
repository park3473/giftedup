<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
</head>
<script src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.css">
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<style>
    #new_sub_hd .title > p:first-of-type {
        display: none;
    }
    .tabs .tab-contents ul li{
    	white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: block;
    }
</style>


<body>
     <a href="#" class="openMenu pos_a"><i class="las la-bars"></i></a>
		 <div class="menu_overlay"></div>
		<div class="layout">
	    <!-- 왼쪽 -->
	    	<%@ include file="../include/menu.jsp" %>

    <!-- 본문 -->
    
     <div class="content">
    <div class="sub_cont_wrap">
    
     <!-- 타이틀 -->
        <div class="font_noto all_tit_30">${model.award.title }</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트 참여 게시판.</span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->
        
        
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    <nav class="sub_min_size" id="mento_member_insert">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>${model.award.title }</p>
                                    </div>
                                    
                                    <input type="hidden" name="csrf" value="${CSRF_TOKEN}" />
                                    <input type="hidden" name="award_idx" value="${model.view.idx }">
                                    <input type="hidden" name="member_id" value="${ssion_user_id }">
                                    <input type="hidden" name="name" value="${ssion_name }">
                                   	<div id="respondents" class="member_input_wrap">
                                        <!-- 학생 view페이지 -->
                                        <ul class="member_input nanumgothic">
                                        	<c:forEach var="item" items="${model.require}" varStatus="status">
                                        		<li class="pd-lr-10 submission_detail">
                                        			<input type="hidden" name="require_idx" value="${item.idx }">
                                        			<span class="list_t">${item.require_name}</span>
                                        			<input class="input_title" type="text" name="respond" placeholder="${item.require_content }">
                                        		</li>
                                        	</c:forEach>
                                        	<c:forEach var="fileCnt" begin="1" end="${model.award.file_cnt }">
                                        	<li class="pd-lr-10">
                                        	<form action="" method="post" name="insertform" id="insertform_${fileCnt }" enctype="multipart/form-data" class="file_list"> 
                                        		<input type="hidden" name="">
                                        		<span class="list_t">파일 등록_${fileCnt }</span>
                                                <input class="input_size" type="text" name="fileName" id="fileName_${fileCnt}" style="display:none;">
                                                <input type="file" id="file1" name="file1" onchange="changeValue(this , ${fileCnt})" />
                                                <input type="hidden" name="file" value="" id="file_${fileCnt}">
                                        	</form>
                                        	</li>
                                        	</c:forEach>
                                        	<li class="pd-lr-10">
                                        		<span class="list_t">추가입력</span>
                                        		<textarea name="content" id="editor"></textarea>
                                        	</li>
                                        	           
                                        </ul>
                                    </div>                              
                                    <div class="board_btn_wrap">
                                  		<div class="board_btn">
                                  			<a class="stat_update" href="#" onclick="submission()">설문 제출</a>
                                  		</div>
                                  	</div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
 
  <%@ include file="../include/footerJs.jsp" %> 


    </div>
</div>
    <%@ include file="../include/right.jsp"%>
    
    <!-- 하단 -->
		<div class="footer">
			<div class="container">
				<div class="link">
					<span><a href="">센터소개</a></span><span class="gab">ㅣ</span> <span><a
						href="">이용약관</a></span><span class="gab">ㅣ</span> <span><a href="">개인정보처리방침</a></span><span
						class="gab">ㅣ</span> <span><a href="">이메일무단수집거부</a></span>
				</div>
				<div class="all_copy">
					<span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트
						과학영재교육연구원(34051)</span><span class="gab">ㅣ</span> <span>TEL :
						042-350-6227</span><span class="gab">ㅣ</span> <span>FAX :
						042-350-6224</span><span class="gab">ㅣ</span> <span>E-MAIL :
						giftedup@kaist.ac.kr</span>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
    
</body>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
<script type="module" >
import editor from '/resources/ckeditor2/editor.js'

window.ckeditorInstance;

    $(document).ready(function () {
		let editorInstance1;
        editor("#editor").then(editor => {
			window.ckeditorInstance = editor;
        	// some code..
            // then 이후에 받은 editor를 다른 변수로 받아주시는 편이 좋습니다!
        })
    })
</script>
<script type="text/javascript">

function changeValue(obj , file_num){
    var fileObj = obj.value;
    var pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
    pathHeader = fileObj.lastIndexOf("\\");
    pathMiddle = fileObj.lastIndexOf(".");
    pathEnd = fileObj.length;
    fileName = fileObj.substring(pathHeader+1, pathMiddle);
    extName = fileObj.substring(pathMiddle+1, pathEnd);
    allFilename = fileName+"."+extName;

    $('#fileName_'+file_num+'').val(allFilename);
    $('#file_'+file_num+'').val(allFilename);
}

function submission(){
	
	var result = confirm('제출하시겠습니까?');
	if(!result){
		return;
	}
	
	var content = ckeditorInstance.getData();
	var member_id = $('[name="member_id"]').val();
	var name = $('[name="name"]').val();
	var award_idx = $('[name="award_idx"]').val();
	$.ajax({
		url : '/user/submission/insert.do',
		type : 'POST',
		data : ({
			award_idx : award_idx,
			member_id : member_id,
			name : name,
			content : content
		}),
			dataType : 'json',
			success: function(data , status , success) {
				console.log('success : ' + data);
				
				var cnt = $(".submission_detail").length;
				if(cnt > 0){
					
					$(".submission_detail").each(function(index) {
						var submission_idx = data;
						var require_idx = $(this).find('input[name="require_idx"]').val();
					    var respond = $(this).find('input[name="respond"]').val();
					    
						$.ajax({
	                    	url : '/user/submission/detail/insert.do',
	                		type : 'POST',
	                		data : ({
	                			submission_idx : submission_idx,
	                			require_idx : require_idx,
	                			respond : respond
	                		}),
	                		success: function(status , success) {
	                			
	                			console.log('success_detail : ' + index);
	                			
	                		},
	                		error : function (xhr , status , error){
	                			
	                			console.log('error_detail : ' + index);
	                			
	                		}
	                    })
						
					})
					
				}
				
				
				var filecnt = $(".file_list").length;
				if(filecnt > 0){
					$(".file_list").each(function(index) {
					    var fileName = $(this).find('input[name="file1"]').val();
					    
					    if(fileName != ''){
						    
						    var formData = new FormData($(this)[0]);

						    var submission_idx = data;
						    var member_id = $('[name="member_id"]').val();
						    formData.append("submission_idx", submission_idx);
						    formData.append("member_id", member_id);
						    
						    $.ajax({
						    	type: "POST",
						    	enctype: 'multipart/form-data',	// 필수
						    	url: '/user/submission/file/insert.do',
						    	data: formData,		// 필수
						    	processData: false,	// 필수
						    	contentType: false,	// 필수
						    	cache: false,
						    	success: function (stauts) {
						    	},
						    	error: function (e) {
						    	}
						    });
					    	
					    }
					    
					})
				}
				
				alert('제출 완료 되었습니다.');
				location.href='/index.do';
			
			},
	        error: function(xhr, status, error) {
	            
	            console.log('error');
	        }
		});
		
	}

</script>

</html>