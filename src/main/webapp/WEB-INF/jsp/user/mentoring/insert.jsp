 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>

   <%@ include file="../include/head.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>
<script language="JavaScript">
	// ckeditor setting
	var ckeditor_config = {
		allowedContent : true,
		

		resize_enabled : false, // 에디터 크기를 조절하지 않음
		enterMode : CKEDITOR.ENTER_BR, // 엔터키를 <br> 로 적용함.
		shiftEnterMode : CKEDITOR.ENTER_P, // 쉬프트 +  엔터를 <p> 로 적용함.
		toolbarCanCollapse : true,
		removePlugins : "elementspath", // DOM 출력하지 않음                        
		filebrowserUploadUrl : '${pageContext.request.contextPath}/ckeditor/file_upload.do', // 파일 업로드를 처리 할 경로 설정.
		height : '500px',
		// 에디터에 사용할 기능들 정의
		toolbar : [
				[  'Source','NewPage', 'Preview' ],
				[ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
				[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript',
						'Superscript' ],
				['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
				[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight',
						'JustifyBlock' ], '/',
				['Image','Link','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
				['Styles','Format','Font','FontSize'],['TextColor','BGColor'],['Maximize', 'ShowBlocks','-'],
				
				[ 'About' ] ]

	};
	
	var editor = null;

	jQuery(function() {
		// ckeditor 적용
		editor = CKEDITOR.replace("CONTENT", ckeditor_config);
	});
	
	  CKEDITOR.on('dialogDefinition', function( ev ){
          var dialogName = ev.data.name;
          var dialogDefinition = ev.data.definition;
        
          switch (dialogName) {
              case 'image': //Image Properties dialog
                  //dialogDefinition.removeContents('info');
                  dialogDefinition.removeContents('Link');
                  dialogDefinition.removeContents('advanced');
                  break;
          }
      });
	  //CKEDITOR.config.contentsCss = '${pageContext.request.contextPath}/resources/css/startupTemplate.css';

</script>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
	<%@ include file="../include/header.jsp" %>
	<!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
           <%@ include file="../include/menu_sub.jsp" %>
        </section>
  	</header>
    

    <!-- 본문 -->
       <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                
                	<!-- 메뉴바 -->
                	<nav class="right_nav_wrap">
                		<div class="title">
                				<c:if test="${
                                           fn:indexOf(requestURI, '/subpage/program/study/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/6/') > -1
                                        || fn:indexOf(requestURI, '/program/104/') > -1
                                        || fn:indexOf(requestURI, '/program/101/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/7/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/8/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/9/') > -1
                                        || fn:indexOf(requestURI, '/notices_data/10/') > -1
                                        || fn:indexOf(requestURI, 'user/mentoring/') > -1}"><h2>찾아가는 영재교육 프로그램</h2></c:if>
                		</div>
                		<ul class="right_nav_area">
                			<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<!--<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>-->
                			<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/program/104/list.do">고등자율연구 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학 프로젝트 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                			<li>
                				<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></c:if>
                				<ul>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a></li></c:if>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a></li></c:if>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a></li></c:if>
                					<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a></li></c:if>
                				</ul>
               				</li>
               				<c:if test="${fn:indexOf(requestURI, 'user/mentoring/') > -1}"><li><a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가 멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li></c:if>
                		</ul>
                	</nav>
                	<!-- 메뉴바  end-->
                
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>글쓰기</p>
                                    </div>
                                    <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="MEMBER_ID" value="<%=ssion_user_id %>" />
                                	<input class="input_size8" type="hidden" name="IMAGE" id="IMAGE" value="${model.pageDomain.IMAGE}">
									<div>
                                    <div class="personal_wrap">
                                        <div class="title">
                                            <h2>개인정보 수집·활용 동의 및 필수항목의 고지</h2>
                                        </div>
                                        <ul class="personal_list">
                                            <li>
                                                <p><i class="fas fa-caret-square-right"></i> 개인정보의 수집·이용 목적</p>
                                                <ul class="personal_sub_txt">
                                                    <li>
                                                        <p>■ 영재키움 프로젝트에서 이용자관리와 콘텐츠 서비스의 제공을 위해 아래와 같은 개인정보를 필수항목으로 수집하고 있습니다.</p>
                                                        <p>■ 아래 입력한 개인정보는 문의하신 사항에 답변하기 위한 용도로 수집·이용됩니다.</p>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p><i class="fas fa-caret-square-right"></i> 수집하는 개인정보의 항목</p>
                                                <ul class="personal_sub_txt">
                                                    <li>
                                                        <p>■ [필수항목] : 성명</p>
                                                        <p>■ [선택항목] : 이메일 등</p>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p><i class="fas fa-caret-square-right"></i> 보유 및 이용기간 : 3년 또는 게시글 작성자가 삭제 시 까지</p>
                                            </li>
                                            <li>
                                                <p><i class="fas fa-caret-square-right"></i> 동의를 거부할 권리가 있다는 사실 및 동의 거부에 따른 불이익의 내용</p>
                                                <ul class="personal_sub_txt">
                                                    <li>
                                                        <p>■ 선택항목은 필수 입력항목이 아니며 수집에 동의하지 않으면 글쓰기를 할 수 없습니다.</p>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <ul class="category_list">
                                            <li>
                                                <p><i class="fas fa-caret-square-right"></i> 게시글 작성 시 <span>주민등록번호, 전화번호 등 개인정보가 포함되지 않도록 작성</span>해주세요.</p>
                                            </li>
                                            <li>
                                                <p><i class="fas fa-caret-square-right"></i> 만 14세 미만 아동의 경우 법정대리인(부모 등)의 동의가 필요합니다.</p>
                                            </li>
                                            <li>
                                                <p><i class="fas fa-caret-square-right"></i> 자세한 내용은 <span>"개인정보 처리방침"</span>을 확인하시기 바랍니다.</p>
                                            </li>
                                            <div class="category_con">
                                            	<p>위 사항을 인지하고 입력항목에 대한 수집 및 활용에 동의합니다.</p>
                                            
                                                <input type="radio" name="agree" value="Y" id="agree_1">
                                                <label for="agree_1">동의함</label>
                                                <input type="radio" name="agree" value="N" id="agree_2">
                                                <label for="agree_2">동의안함</label>
                                            </div>
                                        </ul>
                                    </div>

                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                              <li>
                                                <span class="list_t">성명</span>
                                                <input class="input_size" type="text" id="NAME" name="NAME" value="">
                                                <label class="blind" for="NAME">성명</label>
                                            </li>
                                            <li>
                                                <span class="list_t">멘토링분야</span>
                                                <input class="input_size" type="text" id="TYPE" name="TYPE" value="">
                                                <label class="blind" for="TYPE">멘토링분야</label>
                                            </li>
                                            <li>
                                                <span class="list_t">소속</span>
                                                <input class="input_size" type="text" id="GROUP" name="GROUP" value="">
                                                <label class="blind" for="GROUP">소속</label>
                                            </li>
                                            <li>
                                                <span class="list_t">근무지 주소</span>
                                                <input class="input_address" type="text" id="ADDRESS" name="ADDRESS" value="">
                                                <label class="blind" for="ADDRESS">근무지 주소</label>
                                            </li>
                                            <li>
                                                <span class="list_t">지역</span>
                                                <input class="input_size" type="text" id="LOCATION" name="LOCATION" value="">
                                                <label class="blind" for="LOCATION">지역</label>
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" id="EMAIL" name="EMAIL" value="">
                                                <label class="blind" for="EMAIL">이메일</label>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="text" id="PHONE" name="PHONE" value="">
                                                <label class="blind" for="PHONE">연락처</label>
                                            </li>
                                            <li>
                                                <span class="list_t">비고</span>
                                                <input class="input_size" type="text" id="MEMO" name="MEMO" value="">
                                                <label class="blind" for="MEMO">비고</label>
                                            </li>
                                           
                                            <li>
                                                <span class="list_t">사진</span>
                                                <input class="input_size" type="text" name="picName" id="picName">
                                                <label class="blind" for="picName">사진</label>
                                                <input type="file" id="file" name="file" onchange="changeValue1(this)" style="display: none;"/>
                                                <label class="blind" for="file">파일</label>
                                                <button type="button" id="btn-img-upload">사진선택</button>
                                                <span class="relate_b">115px X 150px jpg, gif</span>
                                            </li>

                                            <li class="pd-15">
                                                <textarea name="CONTENT" id="CONTENT"></textarea>
                                                <label class="blind" for="CONTENT">컨텐츠</label>
                                            </li>
                                        </ul>
                                    </div>
									</div>
									</form>
                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                            <a class="delete" href="javascript:insertClick();">등록하기</a>
                                            <a class="register" href="${pageContext.request.contextPath}/user/notices_data/5/list.do">취소하기</a>
                                        </div>
                                    </div>
                                    <!--보드 검색_버튼 end-->



                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
	<%@ include file="../include/footer.jsp" %> 
    </footer>
	<%@ include file="../include/footerJs.jsp" %> 
</body></html>

<script type="text/javascript">

$(function () {
	$('#btn-img-upload').click(function (e) {
		e.preventDefault();
		$('#file').click();
	});
	
	$('#btn-upload').click(function (e) {
		e.preventDefault();
		$('#file2').click();
	});
	
});

function changeValue1(obj){
	var fileObj = obj.value;
	var pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
	pathHeader = fileObj.lastIndexOf("\\");
    pathMiddle = fileObj.lastIndexOf(".");
    pathEnd = fileObj.length;
    fileName = fileObj.substring(pathHeader+1, pathMiddle);
    extName = fileObj.substring(pathMiddle+1, pathEnd);
    allFilename = fileName+"."+extName;
    
	$('#picName').val(allFilename);
}

function changeValue2(obj){
	var fileObj = obj.value;
	var pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
	pathHeader = fileObj.lastIndexOf("\\");
    pathMiddle = fileObj.lastIndexOf(".");
    pathEnd = fileObj.length;
    fileName = fileObj.substring(pathHeader+1, pathMiddle);
    extName = fileObj.substring(pathMiddle+1, pathEnd);
    allFilename = fileName+"."+extName;
    
	$('#fileName').val(allFilename);
}


function insertClick(){

	//성명
	if($('#NAME').val() == ''){
		alert('성명 입력해주세요.');
		$('#NAME').focus();
		return;
	}
	//제목
	if($('#TITLE').val() == ''){
		alert('제목 입력해주세요.');
		$('#TITLE').focus();
		return;
	}
	//내용
	/* if($('#CONTENT').val() == ''){
		alert('내용 입력해주세요.');
		$('#CONTENT').focus();
		return;
	} */
	
	var radiochk = $(":input:radio[name=agree]:checked").val();

	if(radiochk != 'Y'){
		alert('개인정보 수집·활용 동의 항목에 동의 해주세요.');
		return;
	}
	
	
	
	$('#updateform').submit();
}
</script>
  
  
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/slider_sub.js"></script>

    <!--부트스트랩 js-->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
