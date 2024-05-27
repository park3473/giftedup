<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
    
</script>  

<style>
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
                            <div class="sub_page_con">
                                <div class="sub_page">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>${model.NOTICES.pageDomain.NAME}</p>
                                    </div>
                                    <table class="txt learning_con board_txt" style="table-layout:auto;">
                                        <caption class="blind">커뮤니티 게시판</caption>
                                        <tr>
                                            <c:if test="${'1' == ssion_level && model.noticesid != '1' && model.noticesid != '2' && model.noticesid != '3' && model.noticesid != '12' && model.noticesid != '11'}">
                                            <th class="check"><input type="checkbox" name="chk_calc_all" id="chk_calc_all"></th>
                                            </c:if>
                                            <th class="number">번호</th>
                                            <th class="txt_title">제목</th>
                                            <th class="views">조회수</th>
                                            <th class="writer">작성자</th>
                                            <th class="date">작성일</th>
                                        </tr>

                                        <c:forEach var="item" items="${model.list}" varStatus="status">
                                        <tr>
                                            <c:if test="${'1' == ssion_level && model.noticesid != '1' && model.noticesid != '2' && model.noticesid != '3' && model.noticesid != '12' && model.noticesid != '11'}">
                                            <td class="td_check">
                                                <input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.IDX}" data-memberid="${item.MEMBER_ID}"  data-phone="${item.PHONE}">
                                            </td>
                                            </c:if>
                                            <c:if test="${item.TYPE == '2'}">
                                            <td class="td_number"><span class="notice">공지</span></td>	
                                            </c:if>
                                            <c:if test="${item.TYPE != '2'}">
                                            <td class="td_number">${model.itemtotalcount-((model.itemCount * model.page) + status.index)}</td>
                                            </c:if>
                                            <td class="td_title">
                                                <c:if test="${item.TYPE == '3'}">
                                                <span><img src="${pageContext.request.contextPath}/resources/img/lmi_lock.png" alt="비밀글"></span>
                                                </c:if>
                                                <c:choose>
                                                <c:when test="${'1' == ssion_level || item.MEMBER_ID == ssion_user_id}">
                                                <a href="javascript:view(${item.IDX});">${item.TITLE}</a>
                                                </c:when>
                                                <c:when test="${item.TYPE == '3'}">
                                                <a href="javascript:alert('비밀글 기능으로 보호된 글입니다.');">${item.TITLE}</a>
                                                </c:when>
                                                <c:otherwise>
                                                <a href="javascript:view(${item.IDX});">${item.TITLE}</a>
                                                </c:otherwise>
                                                </c:choose>
                                                <c:if test="${fn:length(item.IMAGE) > 1 && item.IMAGE != '' && item.IMAGE != null}">
                                                <span><img src="${pageContext.request.contextPath}/resources/img/lmi_img.png" alt="이미지"></span>
                                                </c:if>
                                                <c:if test="${fn:length(item.FILES) > 1 && item.FILES != '' && item.FILES != null}">
                                                <span><img src="${pageContext.request.contextPath}/resources/img/lmi_file.png" alt="파일"></span>
                                                </c:if>
                                            </td>
                                            <td class="td_read"><span class="view_icon"><i class="fas fa-eye"></i></span>${item.READ_CNT}</td>
                                            <td class="td_name">${fn:substring(item.MEMBER_NAME,0,11)}</td>
                                            <td class="td_data">${fn:substring(item.CREATE_TM,0,11)}</td>
                                        </tr>
                                        </c:forEach>
                                    </table>


                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_seach">
                                            <form>
                                                <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                                    <option value="ALL">전체</option>
                                                    <option value="MEMBER_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'MEMBER_ID'}">selected</c:if>>작성자</option>
                                                    <option value="TITLE" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'TITLE'}">selected</c:if>>제목</option>
                                                    <option value="CONTENT" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'CONTENT'}">selected</c:if>>내용</option>
                                                </select>
                                                <label class="blind" for="SEARCH_TYPE">검색조건</label>
                                                <input type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT"  />
                                                <label class="blind" for="SEARCH_TEXT">검색창</label>
                                                <button type="button" name="seach" value="검색" onClick="searchBtnClick()">검색</button>
                                            </form>
                                        </div>
                                        <c:if test="${model.NOTICES.pageDomain.WRITE_LEVEL == '10' }">
                                        <div class="board_btn">
                                            <c:if test="${'1' == ssion_level && model.noticesid != '1' && model.noticesid != '2'}">         
                                            <a class="delete" href="javascript:deleteArrClick()">선택삭제</a>
                                            </c:if>
                                            <c:if test="${'okok' == ssion_login && model.NOTICES.pageDomain.NOTICES  == '13'}">
                                            	<c:if test="${'1' == ssion_level }">
                                            	<a class="register" href="./insert.do">글쓰기</a>
                                            	</c:if>
                                            </c:if>
                                            <c:if test="${'okok' == ssion_login && model.NOTICES.pageDomain.NOTICES  != '13'}">
                                            	<a class="register" href="./insert.do">글쓰기</a>
                                            </c:if>
                                        </div>
                                        </c:if>
                                    </div>
                                    <!--보드 검색_버튼 end-->


                                    <!--페이지 넘버-->
                                    <nav class="paging_number">
                                        <%@ include file="../../include/pageing.jsp" %> 
                                    </nav>
                                    <!--페이지 넘버 end-->
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
<%@ include file="../../include/right.jsp"%>
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
						042-350-6223</span><span class="gab">ㅣ</span> <span>FAX :
						042-350-8660</span><span class="gab">ㅣ</span> <span>E-MAIL :
						giftedup@kaist.ac.kr</span>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
</body>
</html>

<script>
    <c:if test="${'1' == ssion_level}">            

        function deleteArrClick()
    {

        cnt =  0;
        deleteArrIdx = "";
        $("input[name=chk_calc]").each(function() {

            var chk = $(this).is(":checked");

            console.log(chk);

            if(chk == true)
            {
                cnt = cnt + 1;
                deleteArrIdx = deleteArrIdx + $(this).data("id") + ",";
            }

        }); 

        if(deleteArrIdx == '')
        {
            alert('삭제할 대상을를 선택 하여 주세요');
            return;
        }

        var URL = './deleteArr.do?IDX='+ deleteArrIdx;
        console.log(URL);
        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : "",
            success: function(result)
            {
                var s = result.indexOf("true");
                console.log(s);
                if(s != -1)
                {
                    
                    alert('삭제되었습니다.');
                    
                    var moveUrl = "?SEARCH_TEXT="+encodeURI('${model.boforeDomain.SEARCH_TEXT}');
                    moveUrl = moveUrl + "&SEARCH_TYPE="+encodeURI('${model.boforeDomain.SEARCH_TYPE}');
                    
                    if("${model.boforeDomain.page}" != "")
                    {
                        moveUrl = moveUrl + "&page=${model.boforeDomain.page}";
                    }
                    
                    idchk = true;
                    location.href = './list.do'+moveUrl;
                    return;
                }else 
                {
                    alert('실패하였습니다.');
                    return;
                }
            }
        });
    }
    $(document).on("click", "#chk_calc_all", function(e) {

        if ($(this).prop('checked')) {
            $('input[name="chk_calc"]').prop('checked', true);
        } else {
            $('input[name="chk_calc"]').prop('checked', false);
        }
    });
    </c:if>
    function searchBtnClick()
    {
        
        URL = './list.do';
        URL = URL + "?PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }

    function view(id){
        var URL = './'+id+'/view.do?';
        URL = URL + "PAGE=${model.beforeDomain.PAGE}";
        URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
        URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
        location.href = URL;
    }
</script>
