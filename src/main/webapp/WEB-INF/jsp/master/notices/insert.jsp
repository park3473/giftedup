<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">




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
				[ 'Source','NewPage', 'Preview' ],
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
	var editor2 = null;
	var editor3 = null;

	jQuery(function() {
		// ckeditor 적용
		editor = CKEDITOR.replace("HEAD_HTML", ckeditor_config);
		editor2 = CKEDITOR.replace("STYLE_HTML", ckeditor_config);
		editor3 = CKEDITOR.replace("FOOTER_HTML", ckeditor_config);
		
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

   
   
  			 <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">추가</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" >
            
             <p>
               		<form:form action="./insertAccess.do?page=${model.page}&search=${model.search}"
					modelAttribute="noticesDomain" method="post" name="updateform" id="updateform" class="form-horizontal form-label-left">
             	   <table id="bootstrap-data-table" class="table table-striped table-bordered">
                		<input type="hidden" NAME="IDX" id="IDX" value='${model.IDX}' />
						<input type="hidden" NAME="CREATE_TM" id="CREATE_TM" value='${model.CREATE_TM}' />
						<input type="hidden" NAME="csrf" value="${CSRF_TOKEN}" />
						
                      <span class="section"><h6 style="margin-bottom: 10px;">상세페이지</h6></span>
                      <!-- hidden -->
	
						<tr>
							<td>게시판명</td>
							<td>
	                            <input class="form-control col-md-7 col-xs-12" required="required" type="text"  id="TITLE" name="TITLE" value="${model.TITLE}">
							</td>
						</tr>
						<tr>
							<td>게시판상세</td>
							<td>
							<input class="form-control col-md-7 col-xs-12" required="required" type="text"  id="MEMO" name="MEMO" value="${model.MEMO}">
							</td>
						</tr>
						
						<tr>
							<td>게시판종류</td>
							<td>
							<select name="TYPE" id="TYPE" class="form-control">
									<c:forEach var="item" items="${model.NOTICES_TYPE_LIST}" varStatus="status">
										<c:choose>
										<c:when test="${model.TYPE == item.TITLE }">
											<option value="${item.TITLE}" selected="selected">${item.NAME}</option>
										</c:when>
										<c:otherwise>
											<option value="${item.TITLE}">${item.NAME}</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</td>
						</tr>
						<!-- 
						<tr>
							<td>게시판사용</td>
							<td>
							<select class="form-control col-md-7 col-xs-12" name="USE_KEY" id="USE_KEY" class="form-control">
								   <c:choose>
										<c:when test="${model.USE_KEY == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>											
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						 -->
						<tr>
							<td>게시판작성권한</td>
							<td>
							 <c:set var="WAITING_MEMBER" value="10"/>
	                        	<select name="WRITE_LEVEL" id="WRITE_LEVEL" class="form-control">
								   <c:forEach var="item" items="${model.CONFIGLEVELLIST}" varStatus="status">
								   		<c:if test="${item.TITLE != WAITING_MEMBER}">
											<c:choose>
											<c:when test="${model.WRITE_LEVEL == item.TITLE }">
												<option value="${item.TITLE}" selected="selected">${item.NAME}</option>
											</c:when>
											<c:otherwise>
												<option value="${item.TITLE}">${item.NAME}</option>
											</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</select>
	
							</td>
						</tr>
						<tr>
							<td>게시판읽기권한</td>
							<td>
							<select name="READ_LEVEL" id="READ_LEVEL" class="form-control">
								   <c:forEach var="item" items="${model.CONFIGLEVELLIST}" varStatus="status">
								   		<c:if test="${item.TITLE != WAITING_MEMBER}">
											<c:choose>
											<c:when test="${model.READ_LEVEL == item.TITLE }">
												<option value="${item.TITLE}" selected="selected">${item.NAME}</option>
											</c:when>
											<c:otherwise>
												<option value="${item.TITLE}">${item.NAME}</option>
											</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>자동글쓰기방지</td>
							<td>
							<select name="CHECK_CAPTCHA" id="CHECK_CAPTCHA" class="form-control">
								   <c:choose>
										<c:when test="${model.CHECK_CAPTCHA == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>											
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<td>비밀글</td>
							<td>
								<select name="CHECK_SECRET_WRITING" id="CHECK_SECRET_WRITING" class="form-control">
								   <c:choose>
										<c:when test="${model.CHECK_SECRET_WRITING == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>											
										 </c:otherwise>
									</c:choose>
								</select>
								
							</td>
						</tr>
						
					
						<tr>
							<td>공지사항</td>
							<td>
							<select name="CHECK_FIRSTTURN" id="CHECK_FIRSTTURN" class="form-control">
								    <c:choose>
										<c:when test="${model.CHECK_FIRSTTURN == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>											
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>답글</td>
							<td>
							    <select name="CHECK_REPLY" id="CHECK_REPLY" class="form-control">
								   <c:choose>
										<c:when test="${model.CHECK_REPLY == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>											
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<td>댓글</td>
							<td>
							<select name="CHECK_COMMENT" id="CHECK_COMMENT" class="form-control">
								   	<c:choose>
										<c:when test="${model.CHECK_COMMENT == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>											
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>					

						<tr>
							<td>바로가기</td>
							<td>
							<select name="CHECK_LINK" id="CHECK_LINK" class="form-control">
								    <c:choose>
										<c:when test="${model.CHECK_LINK == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>		
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<td>예약접수</td>
							<td>
							<select name="CHECK_RECEPTION" id="CHECK_RECEPTION" class="form-control">
								    <c:choose>
										<c:when test="${model.CHECK_RECEPTION == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>		
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<td>파일업로드</td>
							<td>
							
	               				<select name="CHECK_FILEUPLOAD" id="CHECK_FILEUPLOAD" class="form-control">
								   <c:choose>
										<c:when test="${model.CHECK_FILEUPLOAD == '0' }">
										   <option value="0" selected>사용안함</option>
										   <option value="1" >사용</option>
										</c:when>
										<c:otherwise>
										   <option value="0">사용안함</option>
										   <option value="1" selected>사용</option>											
										 </c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>																		
						<tr>
							<td>파일업로드수</td>
							<td>
							<select name="CHECK_FILEUPLOADCOUNT" id="CHECK_FILEUPLOADCOUNT" class="form-control">
								   <c:choose>
									<c:when test="${model.CHECK_FILEUPLOADCOUNT == '1' }">
									   <option value="1" selected>1</option>
									   <option value="2">2</option>
									   <option value="3">3</option>
									   <option value="4">4</option>
									   <option value="5">5</option>
									   <option value="6">6</option>
									   <option value="7">7</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADCOUNT == '2' }">
									   <option value="1">1</option>
									   <option value="2" selected>2</option>
									   <option value="3">3</option>
									   <option value="4">4</option>
									   <option value="5">5</option>
									   <option value="6">6</option>
									   <option value="7">7</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADCOUNT == '3' }">
									   <option value="1">1</option>
									   <option value="2">2</option>
									   <option value="3" selected>3</option>
									   <option value="4">4</option>
									   <option value="5">5</option>
									   <option value="6">6</option>
									   <option value="7">7</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADCOUNT == '4' }">
									   <option value="1">1</option>
									   <option value="2">2</option>
									   <option value="3">3</option>
									   <option value="4" selected>4</option>
									   <option value="5">5</option>
									   <option value="6">6</option>
									   <option value="7">7</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADCOUNT == '5' }">
									   <option value="1">1</option>
									   <option value="2">2</option>
									   <option value="3">3</option>
									   <option value="4">4</option>
									   <option value="5" selected>5</option>
									   <option value="6">6</option>
									   <option value="7">7</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADCOUNT == '6' }">
									   <option value="1">1</option>
									   <option value="2">2</option>
									   <option value="3">3</option>
									   <option value="4">4</option>
									   <option value="5">5</option>
									   <option value="6" selected>6</option>
									   <option value="7">7</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADCOUNT == '7' }">
									   <option value="1">1</option>
									   <option value="2">2</option>
									   <option value="3">3</option>
									   <option value="4">4</option>
									   <option value="5">5</option>
									   <option value="6">6</option>
									   <option value="7" selected>7</option>
									</c:when>
									<c:otherwise>
									   <option value="1">1</option>
									   <option value="2">2</option>
									   <option value="3" selected>3</option>
									   <option value="4">4</option>
									   <option value="5">5</option>
									   <option value="6">6</option>
									   <option value="7">7</option>		
									</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr>
							<td>파일업로드 파일크기</td>
							<td>
							<select name="CHECK_FILEUPLOADFILESIZE" id="CHECK_FILEUPLOADFILESIZE" class="form-control">
								<c:choose>
									<c:when test="${model.CHECK_FILEUPLOADFILESIZE == '10485760' }">
										<option value="10485760" selected>1MB</option>
									   	<option value="20971520">2MB</option>
									   	<option value="52428800" >5MB</option>
									   	<option value="104857600">10MB</option>
									   	<option value="209715200">20MB</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADFILESIZE == '20971520' }">
										<option value="10485760">1MB</option>
									   	<option value="20971520" selected>2MB</option>
									   	<option value="52428800" >5MB</option>
									   	<option value="104857600">10MB</option>
									   	<option value="209715200">20MB</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADFILESIZE == '52428800' }">
										<option value="10485760">1MB</option>
								   		<option value="20971520">2MB</option>
								   		<option value="52428800" selected>5MB</option>
								   		<option value="104857600">10MB</option>
								   		<option value="209715200">20MB</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADFILESIZE == '104857600' }">
										<option value="10485760">1MB</option>
									    <option value="20971520">2MB</option>
									    <option value="52428800">5MB</option>
									    <option value="104857600" selected>10MB</option>
									    <option value="209715200">20MB</option>
									</c:when>
									<c:when test="${model.CHECK_FILEUPLOADFILESIZE == '209715200' }">
										<option value="10485760">1MB</option>
										<option value="20971520">2MB</option>
									    <option value="52428800">5MB</option>
									    <option value="104857600">10MB</option>
									    <option value="209715200" selected>20MB</option>
									</c:when>																																												
									<c:otherwise>
										<option value="10485760">1MB</option>
									   	<option value="20971520">2MB</option>
									  	<option value="52428800" selected>5MB</option>
									   	<option value="104857600">10MB</option>
									   	<option value="209715200">20MB</option>										
									</c:otherwise>
								</c:choose>
								</select>
							</td>
						</tr>						
						<tr>
							<td>HEAD HTML</td>
							<td> <textarea type="text" id="HEAD_HTML" name="HEAD_HTML">${model.HEAD_HTML}</textarea> </td>
						</tr>
						<tr>
							<td>STYLE_HTML</td>
							<td> <textarea type="text" id="STYLE_HTML" name="STYLE_HTML">${model.STYLE_HTML}</textarea> </td>
						</tr>							
						<tr>
							<td>FOOTER_HTML</td>
							<td> <textarea type="text" id="FOOTER_HTML" name="FOOTER_HTML">${model.FOOTER_HTML}</textarea> </td>
						</tr>								
							
						</table>
					</form:form>

             </p>
 			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" onClick="insertAccessClicked();">추가</button>
            </div>
 
          
             