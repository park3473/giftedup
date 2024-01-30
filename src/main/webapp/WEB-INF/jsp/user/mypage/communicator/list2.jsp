<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>

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
                            fn:indexOf(requestURI, '/member/') > -1
                            || fn:indexOf(requestURI, '/portfolio/') > -1
                            || fn:indexOf(requestURI, '/mypage/program/') > -1
                            || fn:indexOf(requestURI, '/mypage/survey/') > -1
                            || fn:indexOf(requestURI, '/user/survey/') > -1
                            || fn:indexOf(requestURI, '/activity_allowance/') > -1
                            || fn:indexOf(requestURI, '/mypage/communicator/') > -1 }">
                            <h2>마이페이지</h2>
                            </c:if>
                        </div>
                        
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1 || fn:indexOf(requestURI, '/mypage/communicator') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1 || fn:indexOf(requestURI, '/mypage/communicator') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/communicator/list.do">커뮤니케이터<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '1'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1 || fn:indexOf(requestURI, '/mypage/communicator') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1 || fn:indexOf(requestURI, '/mypage/communicator') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1 || fn:indexOf(requestURI, '/mypage/communicator') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1 || fn:indexOf(requestURI, '/mypage/communicator') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
    
                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1 || fn:indexOf(requestURI, '/mypage/communicator') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->
 					
 					<!-- 교사 comm list start -->
 					<c:if test="${ssion_member_type == '2' }">
 					<nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>나의 개설 강의 리스트</p>
                                </div>
                                <table class="txt comm_student_now_txt">
                                    <tr>
                                        <th class="comm_index">순번</td>
                                        <th class="comm_name">강좌 명</td>
                                        <th class="comm_create_tm">개설 일시</td>
                                        <th class="comm_stat">강좌 개설 상태</td>
                                        <th class="comm_personnel">강의 신청 현황</td>
                                        <th class="comm_supplies">준비물</td>
                                        <th class="comm_date">강의 일시</td>
                                    </tr>
                                    <c:if test="${model.List.size() != 0 }">
                                    <c:forEach var="item" items="${model.List}" varStatus="status">
                                    <tr class="comm_tr" onclick="getView(${item.COMM_IDX})">
                                        <td class="comm_index">${status.index+1}</td>
                                        <td class="comm_name">${item.COMM_NAME }</td>
                                        <td class="comm_create_tm">${fn:substring(item.COMM_CREATE_TM,0,11) }</td>
                                        <td class="comm_stat">
                                            <c:if test="${item.COMM_STAT == '0' }">
                                        		개설 중
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '1' }">
                                        		접수 중
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '2' }">
                                        		접수 마감
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '3' }">
                                        		강의 준비
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '4' }">
                                        		<span><a onclick="alert('문자로 받으신 회의 코드 및 비밀번호를 입력하여주세요.')">강의 참여</a></span>
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '5' }">
                                        		강의 종료
                                        	</c:if>
                                        </td>
                                        <td class="comm_personnel check_personnel" id="comm_personnel" comm_idx="${item.COMM_IDX }">${item.COMM_PERSONNEL } / ${item.COMM_PERSONNEL_CNT }</td>
                                        <td class="comm_supplies">
                                        	<c:if test="${item.COMM_SUPPLIES == 'true'}">
                                        		O
                                        	</c:if>
                                        	<c:if test="${item.COMM_SUPPLIES == 'false' }">
                                        		X
                                        	</c:if>
                                        </td>
                                        <td class="comm_date">${fn:substring(item.COMM_START_TM,0,16)} ~ ${fn:substring(item.COMM_END_TM,0,16) }</td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${model.List.size() == 0 }">
                                    <tr>
                                    	<td colspan="8">현재 개설된 강의가 없습니다.</td>
                                    </tr>
                                    </c:if>
                                </table>

                                <!--페이지 넘버-->
                                <!--페이지 넘버 end-->
                            </div>
                        </div>
                    </nav>
                    </c:if>
                    <!-- 교사 comm list end -->
                    
                    <!-- 학생 comm list start -->
                    <c:if test="${ssion_member_type == '1' }">
 					<nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>현재 시작된 강의</p>
                                </div>
                                <table class="txt comm_student_now_txt">
                                    <tr>
                                        <th class="comm_index">순번</td>
                                        <th class="comm_name">강좌 명</td>
                                        <th class="comm_create_tm">개설 일시</td>
                                        <th class="comm_personnel">강의 신청 현황</td>
                                        <th class="comm_supplies">준비물</td>
                                        <th class="comm_date">강의 일시</td>
                                        <th class="comm_stat">수업 참여</td>
                                        <th class="comm_mento">교사 명</td>
                                    </tr>
                                    <c:if test="${model.NowList.size() != 0 }">
                                    <c:forEach var="item" items="${model.NowList}" varStatus="status">
                                    <tr class="comm_tr" onclick="getView(${item.COMM_IDX})">
                                        <td class="comm_index">${status.index}</td>
                                        <td class="comm_name">${item.COMM_NAME }</td>
                                        <td class="comm_create_tm">${fn:substring(item.COMM_CREATE_TM,0,11) }</td>
                                        <td class="comm_personnel">정원(${item.COMM_PERSONNEL } 명) / 신청(${item.COMM_PERSONNEL_CNT } 명)</td>
                                        <td class="comm_supplies">
                                        	<c:if test="${item.COMM_SUPPLIES == 'true'}">
                                        		O
                                        	</c:if>
                                        	<c:if test="${item.COMM_SUPPLIES == 'false' }">
                                        		X
                                        	</c:if>
                                        </td>
                                        <td class="comm_date">${fn:substring(item.COMM_START_TM,0,16)} ~ ${fn:substring(item.COMM_END_TM,0,16) }</td>
                                        <td class="comm_stat">
                                        	<c:if test="${item.COMM_STAT == '1' }">
                                        		접수 중
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '2' }">
                                        		접수 마감
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '3' }">
                                        		강의 준비
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '4' }">
                                        		<span><a href="https://giftedup-org.zoom.us/j/" onclick="GetZoom('${item.COMM_MENTO}')">강의 참여</a></span>
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '5' }">
                                        		강의 종료
                                        	</c:if>
                                        </td>
                                        <td class="comm_mento">${item.COMM_MENTO }</td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${model.NowList.size() == 0 }">
                                    <tr>
                                    	<td colspan="8">현재 시작된 강의가 없습니다.</td>
                                    </tr>
                                    </c:if>
                                </table>

                                <!--페이지 넘버-->
                                <!--페이지 넘버 end-->
                            </div>
                        </div>
                    </nav>
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>나의 신청한 강의 리스트</p>
                                </div>
                                <table class="txt comm_student_now_txt">
                                    <tr>
                                        <th class="comm_index">순번</td>
                                        <th class="comm_name">강좌 명</td>
                                        <th class="comm_creat_tm">개설 일시</td>
                                        <th class="comm_personnel">강의 신청 현황</td>
                                        <th class="comm_supplies">준비물</td>
                                        <th class="comm_date">강의 일시</td>
                                        <th class="comm_stat">수업 참여</td>
                                        <th class="comm_mento">교사 명</td>
                                    </tr>
                                    <c:if test="${model.List.size() != 0 }">
                                    <c:forEach var="item" items="${model.List}" varStatus="status">
                                    <tr class="comm_tr" onclick="getView(${item.COMM_IDX})">
                                        <td class="comm_index">${status.index}</td>
                                        <td class="comm_name">${item.COMM_NAME }</td>
                                        <td class="comm_create_tm">${fn:substring(item.COMM_CREATE_TM,0,11) }</td>
                                        <td class="comm_personnel">${item.COMM_PERSONNEL } / ${item.COMM_PERSONNEL_CNT }</td>
                                        <td class="comm_supplies">
                                        	<c:if test="${item.COMM_SUPPLIES == 'true'}">
                                        		O
                                        	</c:if>
                                        	<c:if test="${item.COMM_SUPPLIES == 'false' }">
                                        		X
                                        	</c:if>
                                        </td>
                                        <td class="comm_date">${fn:substring(item.COMM_START_TM,0,16)} ~ ${fn:substring(item.COMM_END_TM,0,16) }</td>
                                        <td class="comm_stat">
                                        	<c:if test="${item.COMM_STAT == '1' }">
                                        		접수 중
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '2' }">
                                        		접수 마감
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '3' }">
                                        		강의 준비
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '4' }">
                                        		강의 시작
                                        	</c:if>
                                        	<c:if test="${item.COMM_STAT == '5' }">
                                        		강의 종료
                                        	</c:if>
                                        </td>
                                        <td class="comm_mento">${item.COMM_MENTO }</td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${model.List.size() == 0 }">
                                    <tr>
                                    	<td colspan="8">현재 신청한 강의가 없습니다.</td>
                                    </tr>
                                    </c:if>
                                </table>
                            </div>
                        </div>
                    </nav>
                    </c:if>
                    <!-- 학생 comm list end -->
                    <c:if test="${ssion_member_type == '2' }">
                    <c:if test="${ssion_comm_data == 'OK'}">
					<div class="board_btn_wrap">
						<div class="board_btn">
							<a class="delete" href="${pageContext.request.contextPath }/user/mypage/communicator/insert.do;">강의 작성</a>
						</div>
					</div>
					</c:if>
					</c:if>
					
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
	/*현재 신청한 학생 목록 가져오기*/
	function GetZoom(COMM_MENTO){
		$.ajax({
			type : "POST",
			url : "./GetZoom.do?",
			cache : false,
			data : ({
				ZOOM_MEMBER_ID : COMM_MENTO
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
				alert("입장하실 zoom 회의실 번호는 : "+data[0].ZOOM_MT_ID+"이며 \n입장 비밀번호는 "+data[0].ZOOM_MT_PW+"입니다.");
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	}
	
	
	$('.check_personnel').click(function() {
		console.log($(this).attr('comm_idx'));
		var COMM_IDX = $(this).attr('comm_idx');

		$.ajax({
			type : "POST",
			url : "./studentlist.do?",
			cache : false,
			data : ({
				COMM_IDX : COMM_IDX
			}),
			dataType : "json",
			success : function(data, status, xhr) {
				console.log(data);
			},
			error : function(xhr, status, error) {
				if (xhr.status == 404) {
					alert("오류!!");
				}
			}
		});
	})
	
	
	function getView(COMM_IDX){
		location.href='${pageContext.request.contextPath}/user/mypage/communicator/view.do?COMM_IDX='+COMM_IDX+'';
	}
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">