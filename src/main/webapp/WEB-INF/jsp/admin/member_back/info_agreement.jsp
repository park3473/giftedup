 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script> 
</head>

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
		editor = CKEDITOR.replace("DATA", ckeditor_config);
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
    <!--헤더-->
	<%@ include file="../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>개인정보동의서</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
											<li>
                                              	<textarea name="DATA" id="DATA" class="person_content">${model.DATA}</textarea>
                                            </li>
                                        </ul>
                                    </div>
                                </form>
                            </div>

                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="bd_storage_w_btn" href="javascript:insertClick()">저장하기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
                        </div>
                    </section>
                    <!--본문 내용 end-->
                    
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/member.js"></script>

</body></html>

<script type="text/javascript">
	

	function insertClick()
	{
				
		
		$('#updateform').submit();
	}
</script>