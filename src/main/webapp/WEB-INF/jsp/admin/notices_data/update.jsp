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
    <!--헤더-->
	<%@ include file="../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>${model.NOTICES.pageDomain.NAME}</span>
                            </div>

                            <div class="member_register_wrap">
                                <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                	<input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                	<input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                	<input type="hidden"  name="FILES" id="FILES"  value="${model.pageDomain.FILES}" />
                                	<input class="input_size8" type="hidden" name="IMAGE" id="IMAGE" >
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">분류</span>
                                                <input type="radio" value="1" name="TYPE" <c:if test="${fn:indexOf(model.pageDomain.TYPE, '1') > -1}">checked</c:if>>
                                                <label>일반글</label>
                                                <input type="radio" value="2" name="TYPE" <c:if test="${fn:indexOf(model.pageDomain.TYPE, '2') > -1}">checked</c:if>>
                                                <label>공지글</label>
                                                <!-- <input type="checkbox" value="3" name="TYPE" <c:if test="${fn:indexOf(model.pageDomain.TYPE, '3') > -1}">checked</c:if>>
                                                <label>비밀글</label> -->
                                            </li>
                                            <li>
                                                <span class="list_t">제목</span>
                                                <input class="input_title" type="text" name="TITLE" id="TITLE" value="${model.pageDomain.TITLE}">
                                            </li>
                                            <li>
                                                <!-- <span class="list_t">내용</span> -->
                                                <textarea class="ta" name="CONTENT" id="CONTENT">${model.pageDomain.CONTENT}</textarea>
                                            </li>
                                            <li>
                                                <span class="list_t">파일</span>
                                                
                                                
                                                <c:forEach var="item" items="${model.fileLIst}" varStatus="status">
                                                <c:if test="${item != '' && item != null}">
                                            	<div id="fileDiv_${status.index}">
                                            	<a class="relate_c" href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/notices_data/${item}')">다운로드</a>
                                            	<input type="hidden" id="file_${status.index}"  value="${item}" />
												<!--<a class="relate_c" href="javascript:fileRemove('${item}', '${status.index}')">(삭제)</a>
												-->
												<a class="relate_c" href="javascript:fileRemove('${status.index}', '${status.index}')">(삭제)</a>
                                            	&nbsp; &nbsp; 
                                            	</div>
                                            	</c:if>
                                            	
                                            	</c:forEach>
                                            </li>
                                            <li>
                                                <span class="list_t">파일선택</span>
                                                <input type="file" id="file" name="file3"> 
                                            </li>
                                            <li>
                                                <span class="list_t">파일선택</span>
                                                <input type="file" id="file" name="file4"> 
                                            </li>                                            
                                            <li>
                                                <span class="list_t">파일선택</span>
                                                <input type="file" id="file" name="file5"> 
                                            </li>                                            
                                            <li>
                                                <span class="list_t">파일선택</span>
                                                <input type="file" id="file" name="file6"> 
                                            </li>                                            
                                                                                        
                                            <li>
                                            	<span class="list_t">이미지</span>
                                         	   	<input type="file" id="file2" name="file2">
                                                <c:if test="${model.pageDomain.IMAGE != '' && model.pageDomain.IMAGE != null}">
                                            	<a class="relate_c" href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/notices_data/${model.pageDomain.IMAGE}')">다운로드</a>
                                            	</c:if>
                                            </li>
                                                                                        
                                            <li>
                                                <span class="list_t">링크주소</span>
                                                <input class="input_size7" type="text" name="LINKS" id="LINKS" value="${model.pageDomain.LINKS}">
                                                <select class="input_size1" name="LINKS_TYPE" id="LINKS_TYPE">
                                                    <option value="" >현재창</option>
                                                    <option value="_blank" <c:if test="${model.pageDomain.LINKS_TYPE ==  '_blank'}">selected</c:if>>새창</option>
                                                </select>
                                            </li>
                                            <li>
                                                <span class="list_t">링크주소</span>
                                                <input class="input_size7" type="text" name="LINKS2" id="LINKS2" value="${model.pageDomain.LINKS2}">
                                                <select class="input_size1"  name="LINKS2_TYPE" id="LINKS2_TYPE">
                                                    <option value="">현재창</option>
                                                    <option value="_blank" <c:if test="${model.pageDomain.LINKS2_TYPE == '_blank'}">selected</c:if>>새창</option>
                                                </select>
                                            </li>
                                            <input class="input_address" type="hidden" name="PHOTO_SHOW" id="PHOTO_SHOW" value="1">
                                           <%--  <li>
                                                <span class="list_t">첨부사진</span>
                                                <input type="radio"  name="PHOTO_SHOW" id="PHOTO_SHOW" value="1" <c:if test="${model.pageDomain.PHOTO_SHOW == '1'}">checked</c:if>>
                                                <label>상단출력</label>
                                                <input type="radio"  name="PHOTO_SHOW" id="PHOTO_SHOW" value="2" <c:if test="${model.pageDomain.PHOTO_SHOW == '2'}">checked</c:if>>
                                                <label>하단출력</label>
                                            </li> --%>
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
    <script src="${pageContext.request.contextPath}/resources/js/admin/board.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

</body></html>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function()
	{
//		 $("input:radio[name=TYPE]").click(function(){
//		        if($("input[name=TYPE]:checked").val() == "1"){
//		        	location.href='./insert.do?TYPE=1';
//		        }else if($("input[name=TYPE]:checked").val() == "2"){
//		        	location.href='./insert.do?TYPE=2';					
//		        }
//             
//		        $("input[name=radio]:checked")
//		    });
	});

	function insertClick()
	{
		
		if($('#TITLE').val() == '')
		{
			alert('제목을 입력 하여 주세요');
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

	function fileRemove(fileName, idx)
	{
		fileName = $('#file_'+idx).val()
		console.log('fileName : ' + fileName);
		$('#fileDiv_'+idx).hide();
		var aa = $('#FILES').val();
		console.log('aa 1 : ' + aa);
		aa = aa.replace(fileName, "")
	 	$('#FILES').val(aa);
		console.log('aa 2 : ' + aa);
	}
	
	
			
</script>