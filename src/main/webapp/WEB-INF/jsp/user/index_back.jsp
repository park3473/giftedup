 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
   <%@ include file="./include/head.jsp" %>
</head>


<body>
    <header id="new_hd" class="hd_wrap">
	    <%@ include file="./include/header.jsp" %> 
    </header>



    <!-- 본문 -->
    <section id="new_sc" class="sc_wrap">
        <div id="new_sc_area" class="sc_area">
            <div id="new_sc_con" class="sc_con">
                <div class="sc_size">
                    <div class="board_stat">
                        <div class="col-sm-6 board_notice_size">
                            <div class="board_notice">
                               
                                <div class="board_two">
                                    <div class="title col-sm-12">
                                        <div class="title_tab">
                                            <span class="title_icon_ob"><img src="${pageContext.request.contextPath}/resources/img/notice_icon.png" alt="공지사항"></span>
                                            <h3 class="notosans">공지사항</h3>
                                        </div>
                                        <div class="more_btn_box">
                                            <a href="${pageContext.request.contextPath}/user/notices_data/1/list.do">
                                                <img src="${pageContext.request.contextPath}/resources/img/plus_icon.png" alt="더보기">
                                            </a>
                                        </div>
                                    </div>
                                    <ul class="notice_list">

                                        <c:forEach var="item" items="${model.NOTICES1.list}" varStatus="status">
                                        <li class="nanumgothic">
                                            <div class="noice_con">
                                                <div class="notice_left">
                                                    <div class="board_icon p-0">
                                                        <!-- 
                                                        <span class="icon hangle">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                        </span>
                                                        <span class="icon pdf">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                        </span>
                                                         -->
                                                    </div>
                                                    <a class="board_title" href="${pageContext.request.contextPath}/user/notices_data/1/${item.IDX}/view.do">
                                                        <h3>${item.TITLE}</h3>
                                                    </a>
                                                    <!-- 
                                                    <div class="board_txt">
                                                        ${item.CONTENT}
                                                    </div>
                                                     -->
                                                </div>
                                                <div class="notice_right">
                                                    <div class="more_btn">
                                                        <a href="${pageContext.request.contextPath}/user/notices_data/1/${item.IDX}/view.do">
                                                            <!--
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/resources/img/more_check.png" alt="더보기체크" />
                                                            </span>
                                                            -->
                                                            	더보기
                                                        </a>
                                                    </div>
                                                    <div class="days">
                                                        <p>${fn:substring(item.CREATE_TM,0,10)}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                                
                                <div class="board_two">
                                    <div class="title col-sm-12">
                                        <div class="title_tab">
                                            <span class="title_icon_ob"><img src="${pageContext.request.contextPath}/resources/img/notice_icon.png" alt="공지사항"></span>
                                            <h3 class="notosans">알림마당</h3>
                                        </div>
                                        <div class="more_btn_box">
                                            <a href="${pageContext.request.contextPath}/user/notices_data/11/list.do">
                                                <img src="${pageContext.request.contextPath}/resources/img/plus_icon.png" alt="더보기">
                                            </a>
                                        </div>
                                    </div>
                                    <ul class="notice_list">

                                        <c:forEach var="item" items="${model.NOTICES11.list}" varStatus="status">
                                        <li class="nanumgothic">
                                            <div class="noice_con">
                                                <div class="notice_left">
                                                    <div class="board_icon p-0">
                                                        <!-- 
                                                        <span class="icon hangle">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_hangle.png" />
                                                        </span>
                                                        <span class="icon pdf">
                                                            <img src="${pageContext.request.contextPath}/resources/img/board_pdf.png" />
                                                        </span>
                                                         -->
                                                    </div>
                                                    <a class="board_title" href="${pageContext.request.contextPath}/user/notices_data/1/${item.IDX}/view.do">
                                                        <h3>${item.TITLE}</h3>
                                                    </a>
                                                    <!-- 
                                                    <div class="board_txt">
                                                        ${item.CONTENT}
                                                    </div>
                                                     -->
                                                </div>
                                                <div class="notice_right">
                                                    <div class="more_btn">
                                                        <a href="${pageContext.request.contextPath}/user/notices_data/1/${item.IDX}/view.do">
                                                            <!--
                                                            <span>
                                                                <img src="${pageContext.request.contextPath}/resources/img/more_check.png" alt="더보기체크" />
                                                            </span>
                                                            -->
                                                            	더보기
                                                        </a>
                                                    </div>
                                                    <div class="days">
                                                        <p>${fn:substring(item.CREATE_TM,0,10)}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-sm-6 board_stats_size notosans">
                            <div class="board_stats">
                            	<div class="title col-sm-12">
                            		<span class="title_icon_ob"><img src="${pageContext.request.contextPath}/resources/img/stu_icon.png" alt="현황안내"></span>
                                    <h3 class="notosans">현황 안내</h3>
                                </div>
                                <ul class="stat_list_wrap col-sm-12">
                                    <li class="col-sm-4">
                                        <h3>학생현황</h3>
                                        <div class="stat_icon">
                                            <img src="${pageContext.request.contextPath}/resources/img/stat_icon_04.png" alt="학생현황" />
                                        </div>
                                        <!-- <p class="counter">458</p> -->
                                        <p class="counter">${model.membercnt1}</p>
                                    </li>
                                    <li class="col-sm-4">
                                        <h3>교사현황</h3>
                                        <div class="stat_icon">
                                            <img src="${pageContext.request.contextPath}/resources/img/stat_icon_05.png" alt="교사현황" />
                                        </div>
                                        <!-- <p class="counter">422</p> -->
                                        <p class="counter">${model.membercnt2}</p>
                                    </li>
                                    <li class="col-sm-4">
                                        <h3>참여학교현황</h3>
                                        <div class="stat_icon">
                                            <img src="${pageContext.request.contextPath}/resources/img/stat_icon_06.png" alt="참여학교현황" />
                                        </div>
                                        <p class="counter">${model.schoolcnt}</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="board_banner">
                        <div class="board_file_wrap col-sm-6">
                            <div class="board_file_size">
                                <div class="board_prom">
                                    <div class="title">
                                    	<span class="title_icon_ob"><img src="${pageContext.request.contextPath}/resources/img/pub_icon.png" alt="홍보자료"></span>
                                        <h3 class="notosans">홍보자료</h3>
                                    </div>
                                    <ul class="prom_slider row nanumgothic">
                                    
                                     
                                        <c:forEach var="item" items="${model.NOTICES2.list}" varStatus="status">
                                        <li class="col-sm-4 prom_slide">
                                            <a href="${pageContext.request.contextPath}/user/notices_data/2/${item.IDX}/view.do">
                                                <div class="date">
                                                    <p>${item.TITLE}</p>
                                                </div>
                                                <div class="txt">
                                                    <span>
                                                    	<img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/notices_data/${item.IMAGE}" alt="${item.IMAGE}">
                                                    </span>
                                                    <!-- 
                                                    <p>${item.CONTENT}</p>
                                                     -->
                                                </div>
                                            </a>
                                        </li>
                                        </c:forEach>
                                      
                                    </ul>
                                </div>
                                <!-- 
                                <div class="board_qna">
                                    <div class="title">
                                        <h3 class="notosans">질문과 답변</h3>
                                        <div class="more_btn">
                                            <a href="${pageContext.request.contextPath}/user/notices_data/3/list.do">
                                                <img src="${pageContext.request.contextPath}/resources/img/plus_icon.png" alt="더보기">
                                            </a>
                                        </div>
                                    </div>
                                    <ul class="qna_list_wrap nanumgothic">
                                        <c:forEach var="item" items="${model.NOTICES3.list}" varStatus="status">
                                        <li class="col-sm-12 p-0">
                                            <a href="${pageContext.request.contextPath}/user/notices_data/3/${item.IDX}/view.do" class="row">
                                                <div class="txt col-sm-9">
                                                    <p class="col-sm-9">${item.TITLE}</p>
                                                    
                                                </div>
                                                <div class="date col-sm-3">
                                                    <span>${fn:substring(item.CREATE_TM,0,10)}</span>
                                                </div>
                                            </a>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                 -->
                            </div>
                        </div>
                        <div class="banner_zone_wrap col-sm-6">
                            <div class="banner_zone_size">
                                <div class="title">
                                	<span class="title_icon_ob"><img src="${pageContext.request.contextPath}/resources/img/pic_icon.png" alt="배너존"></span>
                                    <h3 class="notosans">배너존</h3>
                                </div>
                                <ul class="banner_slider">

                                    <c:forEach var="item" items="${model.BANNER.list}" varStatus="status">
                                    <li class="banner_slide">
                                        <a href="${item.LINK}" target = "${item.LINK_TYPE}">
                                            <img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/banner/${item.FILES}" alt="${item.FILES}">
                                        </a>
                                    </li>
                                    </c:forEach>

                                </ul>
                                <div class="banner_req">
                                    <ul class="banner_req_list row">
                                        <li class="banner_req_box col-sm-4">
                                            <a href="${pageContext.request.contextPath}/user/program/102/list.do">
                                                <img src="${pageContext.request.contextPath}/resources/img/banner_req_03.png" alt="창의융합캠프신청">
                                                <p>창의융합 캠프 신청</p>
                                            </a>
                                        </li>
                                        <li class="banner_req_box col-sm-4">
                                            <a href="${pageContext.request.contextPath}/user/program/201/list.do">
                                                <img src="${pageContext.request.contextPath}/resources/img/banner_req_04.png" alt="멘토링데이신청">
                                                <p>교사연수 신청</p>
                                            </a>
                                        </li>
                                        <li class="banner_req_box col-sm-4">
                                            <a href="${pageContext.request.contextPath}/user/program/106/list.do">
                                                <img src="${pageContext.request.contextPath}/resources/img/banner_req_05.png" alt="기타">
                                                <p>기타</p>
                                            </a>
                                        </li>                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->
	
	<!-- 모달 -->
	<div class="modal_wrap">
		<div class="modal_area">
			<ul class="modal_con">
				<!-- 모달 박스 -->
				<c:forEach var="item" items="${model.POPUP.list}" varStatus="status">
				<li class="modal_box" id="popup${item.IDX}"  style="display: none;">
					<div class="modal_img">
						<div class="modal_img_con">
							<a href="${item.LINKS}" target = "${item.LINK_TYPE}">
								 <img src="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/upload/popup/${item.FILES}" alt="${item.FILES}">
							</a>
						</div>
					</div>
					<div class="modal_txt">
						<div class="modal_oneday modal_oneday">
							<div><input type="checkbox" id="popupToday${item.IDX}"></div>
							<p>오늘 하루 보지 않음</p>
						</div>
						<div class="modal_close modal_close">
							<div><a href="javascript:popupclose('${item.IDX}')"> <i class="fas fa-times"></i></a></div>
						</div>
					</div>
				</li>
				</c:forEach>
				<!-- 모달 박스 end -->
				
			</ul>
		</div>
	</div>
	
	
    <footer id="new_ft" class="ft_wrap">
	<%@ include file="./include/footer.jsp" %> 
    </footer>
	<%@ include file="./include/footerJs.jsp" %> 
	
	
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
	<script>
        $(document).ready(function($) {
            $('.counter').counterUp({
                delay: 10,
                time: 1000
            });
        });
        
        
        var getCookie = function(name) {
        	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        	return value? value[2] : null;
       	};
        
        function popupclose(idx)
        {
        	
        	if($('input[id="popupToday'+idx+'"]').is(":checked") == true)
        	{
        		var today = new Date();
        		var dd = today.getDate();
        		
        		today.setTime(today.getTime() + 1*24*60*60*1000);

        		var name = "popupToday"+idx;
        		document.cookie = name + '=' + dd + ';expires=' + today.toUTCString() + ';path=/';
        	}
        	$('#popup'+idx).hide();
        }
        
        
		var today2 = new Date();
		var dd2 = today2.getDate();
		
		
        <c:forEach var="item" items="${model.POPUP.list}" varStatus="status">
        var is_expend = getCookie("popupToday${item.IDX}");
        
        console.log(is_expend == dd2);
        if(dd2 == is_expend)
        {
        	$('#popup${item.IDX}').hide();
        }else
        {
        	$('#popup${item.IDX}').show();	
        }
        </c:forEach>
                
     console.log('${ssion_user.INFO_AGREEMENT}');
	if('${ssion_user.INFO_AGREEMENT}' != '1' && '${ssion_login}' == 'okok')
	{
		$('#person_modal').show();
	}
    
	$("input[name=INFO_AGREEMENT]").change(function() {

		var radioValue = $(this).val();

		if (radioValue == "0") {

			//$('#person_modal').hide();

		} else if (radioValue == "1") {

			$('#person_modal').hide();
			location.href = './user/member/setINFO_AGREEMENT.do';
		} 

	});
        
    </script>
	
	
	
</body></html>
