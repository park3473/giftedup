<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
</head>
    
<style>
    #new_sub_hd .title>p:first-of-type {
        display: none;
    }
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
        <div class="font_noto all_tit_30">신입생 선발 신청</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
        </div>
		<div class="line_gab_15"></div>
        <!-- 타이틀끝 -->
    
    
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    
                    <!--신입생지원-->
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page_con">
                                <div class="sub_page">
                                    <div class="title">
                                        <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                        <p>신입생지원 이용약관</p>
                                    </div>
                                    
                                    <!--이용약관 내용-->
                                    <div class="terms_wrap">
                                        <div class="terms_area">
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>개인정보 수집·이용 동의</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공 받는 자</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ KAIST 과학영재교육연구원</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자의 개인정보 이용목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 사업 운영 및 지원</p>
                                                                <p>■ 사업 운영 및 결과보고서 작성 사업관리</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 제공되는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 성명, 성별, 학교급, 멘토교사 여부, 학교 명, 학년, 반, 생년월일, 집주소, 보호자 연락처, 지원유형, 지원 자격, 영재교육경험여부, 영재교육경험종류, 영재교육참여기간, '영재키움프로젝트'지원동기, 지원하는 분야, 성장과정, 장·단점, 활동 </p>
                                                                <p>■ [선택항목] : 연락처, 이메일</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는자의 개인정보 보유 및 이용기간</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 이용은 수집일로부터 사업 종료시까지</p>
                                                                <p>■ 보유는 사업 종료시 부터 3년</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 수집 및 이용 거부에 따른 불이익 또는 제한사항</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트 참여 제한 및 이수증 발급 불가</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join1" name="join1" onclick="javascript:all_check()">
                                                    </div>
                                                    <label for="join1">확인 및 동의합니다.</label>
                                                </div>
                                            </div>
                                            <div class="personal_wrap">
                                                <div class="title">
                                                    <h2>개인정보 제 3자 제공 동의</h2>
                                                </div>
                                                <ul class="personal_list">
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공 받는자(3자)</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 교육부, 시·도교육청</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자(3자)의 개인정보 이용목적</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트 사업 관리 및 대상자 지원</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자(3자)에게 제공되는 개인정보의 항목</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ [필수항목] : 성명, 성별, 학교급, 멘토교사 여부, 학교 명, 학년, 반, 생년월일, 집주소, 보호자 연락처, 지원유형, 지원 자격, 영재교육경험여부, 영재교육경험종류, 영재교육참여기간, '영재키움프로젝트'지원동기, 지원하는 분야, 성장과정, 장·단점, 활동 </p>
                                                                <p>■ [선택항목] : 연락처, 이메일</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 개인정보를 제공받는 자(3자)의 개인정보 보유 및 이용기간</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 이용은 수집일로부터 사업 종료시 까지</p>
                                                                <p>■ 보유는 사업 종료시 부터 3년</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <p><i class="fas fa-caret-square-right"></i> 3자 제공 동의 거부 시 불이익 또는 제한사항</p>
                                                        <ul class="personal_sub_txt">
                                                            <li>
                                                                <p>■ 영재키움 프로젝트 참여 제한 및 이수증 발급 불가</p>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join2" name="join2" onclick="javascript:all_check()">
                                                    </div>
                                                    <label for="join2">확인 및 동의합니다.</label>
                                                </div>
                                            </div>
                                            
                                            <div class="personal_wrap personal_wrap_auto">
                                                <ul class="personal_list">
                                                    <li>
                                                        <p>개인정보 제공자가 동의한 내용 외의 다른 목적으로 개인정보를 이용하지 않으며, 정보주체는 개인정보처리자 (KAIST 과학영재교육연구원)에게 본인의 개인정보에 대한 열람, 정정, 삭제를 요구할 수 있습니다.</p>
                                                    </li>
                                                    <li>
                                                        <p>『 개인정보 보호법 제15조(개인정보의 수집•이용), 제17조(개인정보의 제공), 제18조(개인정보의 이용제공 ‧ 제한), 제22조(동의를 받는 방법) 』 에 의거 개인정보 처리에 관하여 고지를 받았으며, 본인은 위와 같이 개인정보  수집 및 이용 ‧ 제공에 동의합니다.</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            
                                            <div class="all_check_box">
                                                <div class="terms_check_box">
                                                    <div class="terms_checkbox_01">
                                                        <input type="checkbox" class="check" id="join_all" onclick="checkAll(); " name="join_all">
                                                    </div>
                                                    <label for="join_all">모두 동의합니다.</label>
                                                </div>
                                            </div>
                                            
                                            <!--보드 검색_버튼-->
                                            <div class="board_btn_wrap">
                                                <div class="board_btn">
                                                    <a class="delete" href="#" onclick="goNext('1')">유형1</a>
                                                    <a class="delete" href="#" onclick="goNext('2')">유형2</a>
                                                    <a class="delete" href="#" onclick="goNext('3')">유형3</a>
                                                </div>
                                            </div>
                                            <!--보드 검색_버튼 end-->
                                            <div class="board_btn_wrap" style="text-align:center">
                                            	<img style="width:60%;" src="${pageContext.request.contextPath }/resources/img/CheckImg.png">
                                            </div>
                                        </div>
                                    </div>
                                    <!--이용약관 내용 end-->
                                    
                                </div>
                            </div>
                        </div>
                    </nav>
                    <!--신입생지원 end-->
                    
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="../include/footerJs.jsp" %> 


    </div>
</div>
    <%@ include file="../include/right.jsp"%>
    
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
						042-350-6227</span><span class="gab">ㅣ</span> <span>FAX :
						042-350-6224</span><span class="gab">ㅣ</span> <span>E-MAIL :
						giftedup@kaist.ac.kr</span>
				</div>
				<div class="copy">
					<span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
				</div>
			</div>
		</div>
		<!-- 하단 -->
		
		
    <!--주의 모달-->
    <div class="danger_modal_area">
        <div class="danger_modal_con">
            <div class="danger_icon">
                <img src="${pageContext.request.contextPath}/resources/img/danger_icon.png" alt="주의"/>
            </div>
            <div class="danger_txt">
                <h2>본 사이트는 <span>Chrome, Safari, Firefox 및 IE11</span> 이상의<br> 최신 브라우저에 최적화 되어있습니다.</h2>
                <p>HTML5, CSS3 기반으로 제작되어 IE9 버전 이하에서는 일부 기능이 정상적으로 작동하지 않을수 있습니다.</p>
                <p>최신 브라우저를 사용하지 않는 경우에 오류가 발생할 수 있으며, 오류 발생 시 서비스 지원할 수 없다는 점 양해 부탁드립니다.</p>
            </div>
            <ul class="danger_btn_box">
                <li class="danger_btn_01">
                    <a onclick="$('.danger_modal_area').css('display','none'); $('.danger_bg').hide();">아니오</a>
                </li>
                <li class="danger_btn_02">
                    <a id="link_insert" href="./insert.do">다음으로</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="danger_bg"></div>
    <!--주의 모달 end-->
            
    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../include/footer.jsp" %>
    </footer>
        
    <%@ include file="../include/footerJs.jsp" %>
        
</body>
        
</html>
            
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
            
<script type="text/javascript">
    function goNext(TYPE){
        var form = document.memberForm;
        if($("input[name='join1']:checked").val() == "on" && $("input[name='join2']:checked").val() == "on"){
        	$('.danger_modal_area').css('display','block');
            $(".danger_bg").show();
            $('#link_insert').attr('href','${pageContext.request.contextPath}/user/member_re/insert.do?TYPE='+TYPE);
        } else{
            alert("약관에 동의를 하셔야 합니다.");
            return false;
        }
    }

    function checkAll(){
        if($("input[name='join_all']").is(':checked') == true){
        	var check = $("input[name='join_all']").is(":checked");
            $("input[name='join1']").prop("checked", true);
            $("input[name='join2']").prop("checked", true);
//            $("input[name='join3']").attr("checked", check);
            $("input[name='join4']").prop("checked", true);
        }else{
        	var check = $("input[name='join_all']").is(":checked");
            $("input[name='join1']").prop("checked", false);
            $("input[name='join2']").prop("checked", false);
//            $("input[name='join3']").attr("checked", check);
            $("input[name='join4']").prop("checked", false);
        }
        
    }

    function all_check(){
        var check1 = $("input[name='join1']").is(":checked");
        var check2 = $("input[name='join2']").is(":checked");
//        var check3 = $("input[name='join3']").is(":checked");
        var check4 = $("input[name='join4']").is(":checked");

        if(check1 && check2 && check4){
        	//alert(check1 && check2 && check4);
            $("input[name='join_all']").prop("checked", true);
        }else{
        	//alert(check1 && check2 && check4);
            $("input[name='join_all']").prop("checked", false);
        }

    }

</script>