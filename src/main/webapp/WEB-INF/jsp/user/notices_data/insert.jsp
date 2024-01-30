 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <%@ include file="../include/head.jsp" %>
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
<body>
    <header id="new_hd" class="hd_wrap">
	<%@ include file="../include/header.jsp" %> 
    



    <!-- 본문 -->
       <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>자료실 - 글쓰기</p>
                                    </div>
                                    <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="TYPE" value="1" />
                                	<input type="hidden"  name="LINKS2" value="" />
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
                                            <p>위 사항을 인지하고 입력항목에 대한 수집 및 활용에 동의합니다.</p>
                                            
                                                <input type="radio" name="agree" value="Y">
                                                <label for="agree">동의함</label>
                                                <input type="radio" name="agree" value="N">
                                                <label for="agree">동의안함</label>
                                            
                                        </ul>
                                    </div>

                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">작성일</span>
                                                <input class="input_size mr" type="text" name="birth" id="birth">
                                                <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a>
                                            </li>
                                            <li>
                                                <span class="list_t">성명</span>
                                                <input class="input_size" type="text" value=<%=ssion_name%> readonly="readonly">
                                            </li>
                                            <li>
                                                <span class="list_t">제목</span>
                                                <input class="input_title" type="text" name="TITLE" id="TITLE">
                                            </li>
                                            <li>
                                                <span class="list_t">사진</span>
                                                <input class="input_size" type="text" name="picName" id="picName">
                                                <input type="file" id="file" name="file" onchange="changeValue1(this)" style="display: none;"/>
                                                <button type="button" id="btn-img-upload">사진선택</button>
                                                <span class="relate_b">115px X 150px jpg, gif</span>
                                            </li>
                                            <li>
                                                <span class="list_t">파일</span>
                                                <input class="input_size" type="text" name="fileName" id=fileName>
                                                <input type="file" id="file2" name="file2" onchange="changeValue2(this)" style="display: none;"/>
                                                <button type="button" id="btn-upload">파일선택</button>
                                            </li>
                                            <li class="pd-15">
                                                <textarea name="CONTENT" id="CONTENT"></textarea>
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
    </header>
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
	if($('#CONTENT').val() == ''){
		alert('내용 입력해주세요.');
		$('#CONTENT').focus();
		return;
	}
	
	var radiochk = $(":input:radio[name=agree]:checked").val();

	if(radiochk != 'Y'){
		alert('개인정보 수집·활용 동의 항목에 동의 해주세요.');
		return;
	}
	
	if( !($('#file2')[0].files[0] == "" || $('#file2')[0].files[0] == null 
			|| $('#file2')[0].files[0] == undefined 
			|| ( $('#file2')[0].files[0] != null && typeof value == "object" 
					&& !Object.keys($('#file2')[0].files[0]).length ) ))
	{
		
		$('#IMAGE').val($('#file2')[0].files[0].name);
		
	}else
	{
		console.log('파일없음');
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
