 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
   <!-- style start-->
<%@ include file="./include/head.jsp" %>
<!-- script end-->
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
  line-height:34px;
}
    
.tabs {
  /*max-width: 640px;*/
  margin: 0 auto;
}

#tab-button {
  display: table;
  table-layout: fixed;
  width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
}

#tab-button li {
  display: table-cell;
  width: 20%;border-left:1px rgba(0,89,156,.8) solid;font-weight:500
}

#tab-button li i{
padding-left:5px
}




#tab-button li:first-child {
border-left:none
}


#tab-button li:hover {
border-left:1px rgba(255,255,555,.5) solid
}

#tab-button li a {
  display: block;
  padding: .5em;
  background: #00599c;
  text-align: center;
  color: #fff;
  text-decoration: none;
}
#tab-button li:not(:first-child) a {
  border-left: none;
}
#tab-button li a:hover,
#tab-button .is-active a {
  background:rgba(255,255,255,0.8);
  color:#000;
}
.tab-contents {
  padding: .5em 2em 1em;
  border: 0px solid #ddd;
  background-color: rgba(255,255,255,0.8);
  border-radius: 0 0 5px 5px;
}

.carousel-item img {
	border-radius: 5px;
}

#tab-button li:first-child a {
border-radius: 5px 0 0 0;
}

#tab-button li:last-child a {
border-radius: 0 5px 0 0;
}

.tab-button-outer {
  display: none;
}
.tab-contents {
  margin-top: 20px;
}

@media screen and (max-width:992px) {
.tab-contents {
  margin-top: 0;
  padding:15px;
}

.tab-select-outer {
  margin-top: 20px;
}


.tabs .tab-contents ul li{
width:280px;
line-height:20px;
}

}

@media screen and (min-width: 640px) {
  .tab-button-outer {
    position: relative;
    z-index: 2;
    display: block;
  }
  .tab-select-outer {
    display: none;
  }
  .tab-contents {
    position: relative;
    margin-top: 0;
  }
}
</style>

<body>
	    <!-- 전체 -->
	<a href="#" class="openMenu pos_a"><i class="las la-bars"></i></a>
		<div class="menu_overlay"></div>
		<div class="layout">
	    <!-- 왼쪽 -->
	    	<%@ include file="./include/menu.jsp" %>
	    <!-- 왼쪽끝 -->



    <!-- 본문 -->
   <div class="content">
	    <div class="cont_wrap">
	        <!-- 왼쪽 -->
	        <div class="cont_left">
	
	            <!-- 캐치프레이즈 -->
	            <div class="big_txt font_noto f_wet_01">카이스트<br><span class="f_wet_05">영재키움</span> 프로젝트란?</div>
	            <div class="small_txt">
	                <span class="green_01">환경에 상관없이 잠재력과 재능이 충분히 발휘 될 수 있도록</span><br>도움이 필요한 영재교육 대상자를 선발하여<br>맞춤형 교육을 지원합니다.
	            </div>
				<!-- 캐치프레이즈끝-->
				<!-- 현황 -->
	            <div class="count_wrap pos_r">
	                <div class="container count pos_a">
	                    <div class="row font_noto">
	                        <div class="col-sm-4 txt_18 font_wet_04">
	                            <div>학생현황</div>
	                            <div class="gray_04 pad_5 c_hide">참여중</div>
	                            <div class="txt_30 gray_10"><span class="timer f_wet_05" data-to="720" data-speed="1000"></span><span class="txt_20 l_pad_5">명</span></div>
	                        </div>
	                        <div class="col-sm-4 txt_18 font_wet_04">
	                            <div>교사현황</div>
	                            <div class="gray_04 pad_5 c_hide">참여중</div>
	                            <div class="txt_30 gray_10"><span class="timer f_wet_05" data-to="511" data-speed="1000"></span><span class="txt_20 l_pad_5">명</span></div>
	                        </div>
	                        <div class="col-sm-4 txt_18 font_wet_04">
	                            <div>참여학교<span class="blink">현황</span></div>
	                            <div class="gray_04 pad_5 c_hide">참여중</div>
	                            <div class="txt_30 gray_10"><span class="timer f_wet_05" data-to="${model.schoolcnt}" data-speed="1000"></span><span class="txt_20 l_pad_5">곳</span></div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- 현황끝 -->
	
	        </div>
	        <!-- 왼쪽끝 -->
	
	        <!-- 오늘쪽 -->
	        <div class="cont_right">
	
	            <!-- 슬라이드 -->
	            <div class="slide">
	                <div id="carousel11_indicator" class="carousel slide carousel-fade_" data-ride="carousel" data-interval="5000">
	                    <ol class="carousel-indicators">
	                        <li data-target="#carousel11_indicator" data-slide-to="0" class="active"></li>
	                        <li data-target="#carousel11_indicator" data-slide-to="1"></li>
	                        <li data-target="#carousel11_indicator" data-slide-to="2"></li>
	                    </ol>
	                    <div class="carousel-inner">
	                        <div class="carousel-item active">
	                            <img src="${pageContext.request.contextPath}/resources/img/sin_2024.png" alt="">
	                        </div>
	                    </div>
	                    <a class="carousel-control-prev" href="#carousel11_indicator" role="button" data-slide="prev"><i class="la la-angle-left" aria-hidden="true"></i></a>
	                    <a class="carousel-control-next" href="#carousel11_indicator" role="button" data-slide="next"><i class="la la-angle-right" aria-hidden="true"></i></a>
	                </div>
	            </div>
	            <!-- 슬라이드끝 -->
	            <!-- 탭 -->
	            <div class="tabs border_5_">
	                <div class="tab-button-outer font_noto f_wet_03">
	                    <ul id="tab-button">
	                        <li><a href="#tab01">공지사항<i onclick="location.href='${pageContext.request.contextPath}/user/notices_data/1/list.do'" class="las la-arrow-right"></i></a></li>
	                        <li><a href="#tab02">알림마당<i onclick="location.href='${pageContext.request.contextPath}/user/notices_data/11/list.do'" class="las la-arrow-right"></i></a></li>
	                        <li><a href="#tab03">자료실<i onclick="location.href='${pageContext.request.contextPath}/user/notices_data/3/list.do'" class="las la-arrow-right"></i></a></li>
	                    </ul>
	                </div>
	                <div class="tab-select-outer font_noto">
	                    <select id="tab-select">
	                    <option value="#tab01">공지사항</option>
	                    <option value="#tab02">알림마당</option>
	                    <option value="#tab03">자료실</option>
	                    </select>
	                </div>
	                <div id="tab01" class="tab-contents">
	                    <ul>
	                    	<c:forEach var="item" items="${model.NOTICES1.list }" varStatus="status">
	                        	<li>
	                        		‐ <a href="${pageContext.request.contextPath}/user/notices_data/1/${item.IDX}/view.do">${item.TITLE}</a>
                               </li>
	                        </c:forEach>
	                    </ul>
	                </div>
	                <div id="tab02" class="tab-contents">
	                    <ul>
	                    	<c:forEach var="item" items="${model.NOTICES11.list }" varStatus="status">
	                        	<li>
	                        		‐ <a href="${pageContext.request.contextPath}/user/notices_data/1/${item.IDX}/view.do">${item.TITLE}</a>
                               </li>
	                        </c:forEach>
	                    </ul>
	                </div>
	                <div id="tab03" class="tab-contents">
	                    <ul>
	                    	<c:forEach var="item" items="${model.NOTICES3.list }" varStatus="status">
	                        	<li>
	                        		‐ <a href="${pageContext.request.contextPath}/user/notices_data/1/${item.IDX}/view.do">${item.TITLE}</a>
                               </li>
	                        </c:forEach>
	                    </ul>
	                </div>
	            </div>
	            <!-- 탭끝 -->
	            <!-- 멘토링 -->
	            <div class="kaist font_noto f_wet_03">
	                <div class="flexbox align_c gray_10">
	                    <div class="item box_01 pointer" onclick="location.href='/user/subpage/program/mentoring/index.do'">
	                        <img src="${pageContext.request.contextPath}/resources/img/2022/main_ico_01.png" alt="">
	                        <div>또래멘토링</div>
	                    </div>
	                    <div class="item box_01 pointer" onclick="location.href='/user/mentoring/list.do'">
	                        <img src="${pageContext.request.contextPath}/resources/img/2022/main_ico_02.png" alt="">
	                        <div>전문가멘토링</div>
	                    </div>
	                    <div class="item box_01 pointer" onclick="location.href='/user/member/login.do?URL=/user/notices_data/7/list.do'">
	                        <img src="${pageContext.request.contextPath}/resources/img/2022/main_ico_03.png" alt="">
	                        <div>온라인학습멘토링</div>
	                    </div>
	                </div>
	            </div>
	            <!--멘토링 끝-->
	
	        </div>
	        <!-- 오른쪽끝 -->
	    </div>
	</div>
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
	
	<!-- 오른쪽 시작 -->
		<%@ include file="./include/right.jsp" %>
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
		            <span>TEL : 042-350-6223</span><span class="gab">ㅣ</span>
		            <span>FAX : 042-350-8660</span><span class="gab">ㅣ</span>
		            <span>E-MAIL : giftedup@kaist.ac.kr</span>
		        </div>
		        <div class="copy">
		            <span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
		        </div>
		    </div>
		</div>
		<!-- 하단 --> 
	</div>
	
	
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
	
	$(document).ready(function() {
		var $tabButtonItem = $('#tab-button li'),
		    $tabSelect = $('#tab-select'),
		    $tabContents = $('.tab-contents'),
		    activeClass = 'is-active';

		$tabButtonItem.first().addClass(activeClass);
		$tabContents.not(':first').hide();

		// button
		$tabButtonItem.find('a').on('click', function(e) {
			var target = $(this).attr('href');

			$tabButtonItem.removeClass(activeClass);
			$(this).parent().addClass(activeClass);
			$tabSelect.val(target);
			$tabContents.hide();
			$(target).show();
			e.preventDefault();
		});

		// select
		$tabSelect.on('change', function() {
			var target = $(this).val(),
			    targetSelectNum = $(this).prop('selectedIndex');

			$tabButtonItem.removeClass(activeClass);
			$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
			$tabContents.hide();
			$(target).show();
		});
	});
	
	console.log('${session_update_tm}');
	if('${session_update_tm}' != ''){
	
		var now = new Date();
		console.log(now);
		var update_tm = new Date('${session_update_tm}');
		const oneDay = 1000 * 60 * 60 * 24;
		const diff = Math.round((now - update_tm) / oneDay);
		console.log(diff);
		
		if(diff > 90){
			
			console.log('90일 경과');
			Swal.fire({
				  title: '영재키움 홈페이지 정보 최신화',
				  html: '영재키움 홈페이지 정보를 최신화 해주세요.<br>마이페이지로 이동하여 정보를 최산화 해주시길바랍니다.',
				  icon: 'info',
				  showCancelButton: true,
				  confirmButtonText: '마이페이지',
				  cancelButtonText: '취소',
				  showDenyButton: true,
				  denyButtonText: '나중에'
				}).then((result) => {
				  if (result.isConfirmed) {
				    // 확인 버튼 클릭 시 처리할 로직 작성
				    console.log('확인 버튼이 클릭되었습니다.');
				  } else if (result.isDenied) {
				    // 나중에 버튼 클릭 시 처리할 로직 작성
				    console.log('나중에 버튼이 클릭되었습니다.');
				  } else if (result.dismiss === Swal.DismissReason.cancel) {
				    // 취소 버튼 클릭 시 처리할 로직 작성
				    console.log('취소 버튼이 클릭되었습니다.');
				  }
				});
		}
		
		
	}
	
        
    </script>
	
	
	
</body></html>
