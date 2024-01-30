<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
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
	    	<%@ include file="../include/menu.jsp" %>

    <!-- 본문 -->
<div class="content">
    <div class="sub_cont_wrap">

        <!-- 타이틀 -->
        <div class="font_noto all_tit_30">전문가 멘토링</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">1차분류<i class="las la-angle-right"></i>2차분류<i class="las la-angle-right"></i><b class="blue_01">3차분류</b></span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span> 전문가 멘토링</div>
        <table class="table table-bordered align_c">
        <tbody>
						<tr>
							<c:if test="${'1' == ssion_level}">
								<th class="check"><input type="checkbox"
									name="chk_calc_all" id="chk_calc_all"></th>
							</c:if>
							<th class="number">번호</th>
							<th class="picture">사진</th>
							<th class="txt_title">멘토링분야</th>
							<th class="name">전문가 이름</th>
							<th class="area">지역</th>
						</tr>
						<c:forEach var="item" items="${model.list}" varStatus="status">
                                        <tr>
                                        	<c:if test="${'1' == ssion_level}">
                                        	<td class="td_check td_check_h"><input type="checkbox" value="${item.MEMBER_ID}" name="chk_calc" data-id="${item.IDX}" data-memberid="${item.MEMBER_ID}"  data-phone="${item.PHONE}"></td>
                                        	</c:if>
	                                        <td class="td_number">${model.itemtotalcount-((model.itemCount * model.page) + status.index)}</td>
	                                        <td class="td_pic">
	                                            <div class="pic_mentor">
	                                            <img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/mentoring/${item.IMAGE}" alt="${item.IMAGE}">
	                                            </div>
	                                        </td>
	                                        <td class="td_title td_title_h"><a href="javascript:view(${item.IDX});">${item.TYPE}</a></td>
	                                        <td class="td_name td_name_h">${item.NAME}</td>
	                                        <td class="td_data td_data_h">${item.LOCATION}</td>	                                        
                                    	</tr>
                                        </c:forEach>
        </tbody>
        </table>

		<%@ include file="../include/pageing.jsp" %>


    </div>
</div>
<!-- 본문 끝 -->
    
    <!-- 오른쪽 시작 -->
		<%@ include file="../include/right.jsp" %>
	<!--  오른쪽 끝 -->
	<!-- 하단 -->
		<div class="footer">
		    <div class="container">
		        <div class="link">
		            <span><a href="">센터소개</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이용약관</a></span><span class="gab">ㅣ</span>
		            <span><a href="">개인정보처리방침</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이메일무단수집거부</a></span>
		        </div>
		        <div class="all_copy">
		            <span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트 과학영재교육연구원(34051)</span><span class="gab">ㅣ</span>
		            <span>TEL : 042-350-6227</span><span class="gab">ㅣ</span>
		            <span>FAX : 042-350-6224</span><span class="gab">ㅣ</span>
		            <span>E-MAIL : giftedup@kaist.ac.kr</span>
		        </div>
		        <div class="copy">
		            <span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
		        </div>
		    </div>
		</div>
		<!-- 하단 --> 
    </div>
    <!--본문 end-->
    
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
    
</body>
</html>
