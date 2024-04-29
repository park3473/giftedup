<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- ckeditor필요한 부분 -->
<script src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.css">
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<style>
.ck-button{margin-left: 0px !important}
</style>
<body>
    
	<a href="#" class="openMenu pos_a"><i class="las la-bars"></i></a>
		 <div class="menu_overlay"></div>
		<div class="layout">
	    <!-- 왼쪽 -->
	    	<%@ include file="../../include/menu.jsp" %>

    <!-- 본문 -->
<div class="content">
    <div class="sub_cont_wrap">

        <!-- 타이틀 -->
        <div class="font_noto all_tit_30">${model.NOTICES.pageDomain.NAME}</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->
        
        <section id="new_sub" class="sub_wrap">
					<div id="new_sub_area" class="sub_area">
						<div id="new_sub_con" class="sub_con">
							<div class="sub_size">
								<!-- 교사 comm list start -->
        

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
                                        <input type="hidden"  name="MEMBER_ID" value="${ssion_user_id }" />
                                        <input type="hidden" name="FILES" value="${model.pageDomain.FILES }"/>
                                        <div>
                                        	<!-- 
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
											-->
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
                                            	<span> ${fn:substring(item.FILE_NAME,13,fn:length(item.FILE_NAME))}</span>
                                            	<a class="relate_c" href="javascript:fileDown('${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/notices_data/${item}')">다운로드</a>
                                            	<input type="text" id="file" name="file${status.index+1}"  value="${item.FILE_NAME}" style="display:none" />
												<!--<a class="relate_c" href="javascript:fileRemove('${item}', '${status.index}')">(삭제)</a>
												-->
												<a class="relate_c" href="javascript:fileRemove('${model.pageDomain.IDX}', '${item.FILE_PATH}')">(삭제)</a>
                                            	&nbsp; &nbsp; 
                                            	</div>
                                            	</c:if>
	                                            </c:forEach>
	                                            </li>
	                                            <c:if test="${model.fileLIst.size() < 3 }">
	                                            <c:forEach var="i" begin="1" end="${3 - model.fileLIst.size()}">
	                                            	<li>
		                                                <span class="list_t">파일선택</span>
		                                                <input type="file" id="file" name="file${model.fileLIst.size() + i}"> 
	                                            	</li> 
	                                            </c:forEach>
	                                            </c:if>
                                                    <li class="pd-15">
                                                        <textarea class="ta" name="CONTENT" id="editor">${model.pageDomain.CONTENT}</textarea>
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
    <%@ include file="../../include/footerJs.jsp" %> 


    </div>
</div>
<!-- 하단 -->
		<div class="footer">
			<div class="container">
				<div class="link">
					<span><a href="">센터소개</a></span><span class="gab">ㅣ</span> <span><a
						href="">이용약관</a></span><span class="gab">ㅣ</span> <span><a href="">개인정보처리방침</a></span><span
						class="gab">ㅣ</span> <span><a href="">이메일무단수집거부</a></span>
				</div>
				<div class="all_copy">
					<p><span>TEL : </span>서울・강원・제주권역 (서울대학교) : 02-880-4477~8, 경기・인천권역 (인천대학교) : 032-835-4915, 충청・호남권역 (대전대학교) : 042-226-0701(혹은 0705), 경상권역 (부산대학교) : 051-510-1840~2</p>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
		</div>
		</body>
		</html>
<script type="module" >
import editor from '/resources/ckeditor2/editor.js'

window.ckeditorInstance;

    $(document).ready(function () {
		let editorInstance1;
        editor("#editor").then(editor => {
			window.ckeditorInstance = editor;
        })
    })
</script>
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
        
        /* 
        var radiochk = $(":input:radio[name=agree]:checked").val();
        
        if(radiochk != 'Y'){
            alert('개인정보 수집·활용 동의 항목에 동의 해주세요.');
            return;
        } */
        
        
        $('#updateform').submit();
    }
    
    function deleteClick(){

        $("#updateform").attr("action", "./delete.do");

        $('#updateform').submit();
    }
    
    function fileRemove(IDX,FILENAME){
    	
    	FILENAME = encodeURIComponent(FILENAME);
    	
    	console.log("IDX : " + IDX);
    	console.log(" FILENAME : " + FILENAME);
    	
    	
    	$.ajax({
    		url : '/user/notices_data/fileRemove.do',
    		type : 'POST',
    		data : ({
    			IDX : IDX,
    			FILES : FILENAME
    		}),
    		success : function(status , xhr){
    			console.log('FileRemove success');
    		},
    		error : function(status , xhr){
    			console.log('error');
    		}
    	})
    	
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
