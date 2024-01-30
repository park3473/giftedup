<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
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
            [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript' ],
            ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
            [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ], '/',
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
        <%@ include file="../../include/header.jsp" %> 
        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../../include/menu_sub.jsp" %>
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
                            || fn:indexOf(requestURI, 'user/mentoring/') > -1}">
                            <h2>찾아가는 영재교육 프로그램</h2>
                            </c:if>
                            
                            <c:if test="${
                            fn:indexOf(requestURI, '/user/subpage/program/find/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/mentoring/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/4/') > -1
                            || fn:indexOf(requestURI, '/user/program/110/') > -1
                            || fn:indexOf(requestURI, '/user/program/111/') > -1
                            || fn:indexOf(requestURI, '/user/subpage/program/patent/') > -1
                            || fn:indexOf(requestURI, '/user/program/105/') > -1}">
                            <h2>체험 진로탐색 프로그램</h2>
                            </c:if>

                            <c:if test="${
                            fn:indexOf(requestURI, '/notices_data/1/') > -1
                            || fn:indexOf(requestURI, '/notices_data/2/') > -1
                            || fn:indexOf(requestURI, '/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/notices_data/11/') > -1
                            || fn:indexOf(requestURI, '/notices_data/12/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1
                            || fn:indexOf(requestURI, '/user/member_re/insert.do') > -1}">
                            <h2>커뮤니티</h2>
                            </c:if>
                        </div>
                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/study/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <!--
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/6/list.do">진로상담 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            -->
                            
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/101/list.do">융합과학 프로젝트 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">온라인학습멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/7/list.do">학습도전</a>
                                    </li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/8/list.do">학습질문</a>
                                    </li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/9/list.do">학습작품</a>
                                    </li>
                                    </c:if>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/10/list.do">학습상담</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </li>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/6/') > -1 || fn:indexOf(requestURI, '/notices_data/10/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mentoring/list.do">전문가 멘토링 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>

                        <ul class="right_nav_area">
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/subpage/program/find/index.do">프로그램소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/mentoring/index.do">또래 멘토링 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/notices_data/4/list.do">· 또래 멘토링</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </li>

                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/110/list.do">문화체험 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/program/111/list.do">진로탐색 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <li>
                                <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                <a href="${pageContext.request.contextPath}/user/subpage/program/patent/index.do">발명 및 특허교육 소개 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                                </c:if>
                                <ul>
                                    <c:if test="${fn:indexOf(requestURI, '/user/notices_data/4/') > -1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/program/105/list.do">· 발명 및 특허 교육</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                        
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">공지사항 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1  
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/2/list.do">홍보자료 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                           
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1  
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">자료실 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1  
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">알림마당 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>                            
                            <c:if test="${fn:indexOf(requestURI, '/user/notices_data/1/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/2/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/3/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/12/') > -1 
                            || fn:indexOf(requestURI, '/user/notices_data/11/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member_re/insert.do">신입생 지원 모집 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->

                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>수정하기</p>
                                    </div>
                                    <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden"  name="LINKS2" value="" />
                                        <input type="hidden"  name="LINKS" value="" />
                                        <input type="hidden"  name="IDX" id="IDX" value="${model.pageDomain.IDX}">
                                        <input type="hidden"  name="MEMBER_ID" value="<%=ssion_user_id %>" />
                                        <input class="input_size8" type="hidden" name="IMAGE" id="IMAGE" value="">
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
                                                        <input type="radio" name="agree" value="Y">
                                                        <label for="agree">동의함</label>
                                                        <input type="radio" name="agree" value="N">
                                                        <label for="agree">동의안함</label>
                                                    </div>
                                                </ul>
                                            </div>

                                            <div class="member_input_wrap">
                                                <ul class="member_input">
                                                    <c:if test="${model.NOTICES.pageDomain.SECRET == 1}">
                                                    <li>
                                                        <span class="list_t">구분</span>
                                                        <input style="margin-left:10px;" type="checkbox" value="3" id="TYPE" name="TYPE"  <c:if test="${model.pageDomain.TYPE == '3'}">checked</c:if>>
                                                        <label for="secret">비밀글</label>
                                                    </li>
                                                    </c:if>
                                                    <li>
                                                        <span class="list_t">제목</span>
                                                        <input class="input_title" type="text" name="TITLE" id="TITLE" value="${model.pageDomain.TITLE}">
                                                    </li>
                                                
                                                <li>
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
                                                    <li class="pd-15">
                                                        <textarea name="CONTENT" id="CONTENT">${model.pageDomain.CONTENT}</textarea>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                            <!--<a class="delete" href="javascript:deleteClick();">삭제하기</a>-->
                                            <a class="delete" href="javascript:insertClick();">수정하기</a>
                                            <a class="register" href="javascript:history.back()">취소하기</a>
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
        <%@ include file="../../include/footer.jsp" %> 
    </footer>
    <%@ include file="../../include/footerJs.jsp" %> 
</body>

</html>

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
        $('#IMAGE').val(allFilename);
        
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
        
        
        var radiochk = $(":input:radio[name=agree]:checked").val();
        
        if(radiochk != 'Y'){
            alert('개인정보 수집·활용 동의 항목에 동의 해주세요.');
            return;
        }
        
        if( !($('#file')[0].files[0] == "" || $('#file')[0].files[0] == null || $('#file')[0].files[0] == undefined || ( $('#file')[0].files[0] != null && typeof value == "object" && !Object.keys($('#file')[0].files[0]).length ) )) {
            $('#IMAGE').val($('#file')[0].files[0].name);
        }else {
            console.log('파일없음');
        }
        
        $('#updateform').submit();
    }
    
    function deleteClick(){

        $("#updateform").attr("action", "./delete.do");

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
