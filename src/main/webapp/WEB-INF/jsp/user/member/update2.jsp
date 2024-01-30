<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <%@ include file="../include/head.jsp" %>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
	    <%@ include file="../include/header.jsp" %> 
   
        <!-- 본문 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="../include/menu_sub.jsp" %> 
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
                                || fn:indexOf(requestURI, '/activity_allowance/') > -1 }"><h2>마이페이지</h2>
                            </c:if>
                        </div>
                        <ul>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/member/view.do">기본정보수정 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${ssion_member_type == '1'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/detail/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/portfolio/list.do">포트폴리오<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/program/list.do">프로그램 신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">   
                            <li>
                                <a href="${pageContext.request.contextPath}/user/mypage/survey/list.do">설문조사 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
                            <c:if test="${ssion_member_type == '2'}">
                            <c:if test="${fn:indexOf(requestURI, '/member/') > -1 || fn:indexOf(requestURI, '/portfolio/') > -1 || fn:indexOf(requestURI, '/mypage/program/') > -1 || fn:indexOf(requestURI, '/mypage/survey/') > -1 || fn:indexOf(requestURI, '/activity_allowance/') > -1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/activity_allowance/insert.do">활동수당신청<span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a>
                            </li>
                            </c:if>
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
                                        <p>회원정보 변경</p>
                                    </div>
                                    <form action="./update.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                                        <input type="hidden"  name="MEMBER_ID" value="${model.pageDomain.MEMBER_ID}" />
                                        <input type="hidden"  name="IMAGE" value="${model.pageDomain.IMAGE}" />

                                        <c:if test="${ssion_member_type == '1'}">
                                        <div class="member_register_wrap">
                                            <div class="member_input_wrap">
                                                <ul class="member_input">
                                                    <li style="display:none;">
                                                        <span class="list_t">구분</span>
                                                        <input type="radio" name="TYPE_SUB" id="TYPE_SUB" value="1" <c:if test="${model.pageDomain.TYPE_SUB == '1'}">checked</c:if>>
                                                        <label for="new">신규</label>
                                                        <input type="radio" name="TYPE_SUB" id="TYPE_SUB" value="2" <c:if test="${model.pageDomain.TYPE_SUB == '2'}">checked</c:if>>
                                                        <label for="add">추가</label>
                                                        <input type="radio" name="TYPE_SUB" id="TYPE_SUB" value="3" <c:if test="${model.pageDomain.TYPE_SUB == '3'}">checked</c:if>>
                                                        <label for="basic">추가2</label>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">아이디</span>
                                                        <input class="input_size" type="text" name="" id="" value="${model.pageDomain.MEMBER_ID}" readonly>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">비밀번호<b class="relate_c">＊</b></span>
                                                        <input class="input_size mr" type="password" name="PASSWORD" id="PASSWORD" >
                                                        <span class="relate_c">비밀번호 변경시 원하는 비밀번호 입력 or 기존 비밀번호 입력</span>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">비밀번호 확인<b class="relate_c">＊</b></span>
                                                        <input class="input_size" type="password" name="PASSWORD2" id="PASSWORD2">
                                                    </li>
                                                    <li>
                                                        <span class="list_t">이름</span>
                                                        <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="한글" value="${model.pageDomain.NAME}">
                                                    </li>
                                                    <li>
                                                        <span class="list_t">사진</span>
                                                        <input type="file" id="file" name="file">${model.pageDomain.IMAGE}
                                                        <span class="relate_b">115px X 150px jpg, gif</span>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">지역</span>
                                                        <select class="input_size" ID="ADDRESS_LOCAL" NAME="ADDRESS_LOCAL">
                                                            <option value="">선택하여주세요</option>
                                                            <option value="서울" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '서울'}">selected</c:if>>서울</option>
                                                            <option value="부산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '부산'}">selected</c:if>>부산</option>
                                                            <option value="대구" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대구'}">selected</c:if>>대구</option>
                                                            <option value="인천" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '인천'}">selected</c:if>>인천</option>
                                                            <option value="광주" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '광주'}">selected</c:if>>광주</option>
                                                            <option value="대전" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대전'}">selected</c:if>>대전</option>
                                                            <option value="울산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '울산'}">selected</c:if>>울산</option>
                                                            <option value="세종" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '세종'}">selected</c:if>>세종</option>
                                                            <option value="경기도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경기도'}">selected</c:if>>경기도</option>
                                                            <option value="강원도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '강원도'}">selected</c:if>>강원도</option>
                                                            <option value="충청북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청북도'}">selected</c:if>>충청북도</option>
                                                            <option value="충청남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청남도'}">selected</c:if>>충청남도</option>
                                                            <option value="전라북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라북도'}">selected</c:if>>전라북도</option>
                                                            <option value="전라남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라남도'}">selected</c:if>>전라남도</option>
                                                            <option value="경상북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상북도'}">selected</c:if>>경상북도</option>
                                                            <option value="경상남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상남도'}">selected</c:if>>경상남도</option>
                                                            <option value="제주도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '제주도'}">selected</c:if>>제주도</option>
                                                        </select>                                                
                                                        <span class="relate_b">현재 거주하는 시,도명</span>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">학교급</span>
                                                        <select class="input_size mr-2" name="SCHOOL_TYPE" id="SCHOOL_TYPE" value="${model.pageDomain.SCHOOL_TYPE}">
                                                            <option>초등학교</option>
                                                            <option>중학교</option>
                                                            <option>고등학교</option>
                                                        </select>
                                                        <span class="list_t">학교명</span>
                                                        <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.pageDomain.SCHOOL_NAME}">
                                                    </li>
                                                    <li>
                                                        <span class="list_t">학년</span>
                                                        <select class="input_size mr-2" id="SCHOOL_YEAR" name="SCHOOL_YEAR">
                                                            <option value="">선택해주세요</option>
                                                            <option value="4"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교4학년</option>
                                                            <option value="5"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교5학년</option>
                                                            <option value="6"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교6학년</option>
                                                            <option value="7"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교1학년</option>
                                                            <option value="8"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교2학년</option>
                                                            <option value="9"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교3학년</option>
                                                            <option value="10"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교1학년</option>
                                                            <option value="11"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교2학년</option>
                                                            <option value="12"  <c:if test="${model.pageDomain.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교3학년</option>
                                                        </select>
                                                        <span class="list_t">반</span>
                                                        <input class="input_size" type="text" name="SCHOOL_GROUP" id="SCHOOL_GROUP" value="${model.pageDomain.SCHOOL_GROUP}">
                                                    </li>
                                                    <li>
                                                        <span class="list_t">생년월일</span>
                                                        <input class="input_size mr datecalendar" type="text" name="BIRTH" id="BIRTH" value="${model.pageDomain.BIRTH}">
                                                        <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                        <span class="list_t">성별</span>
                                                        <input type="radio" name="SEX" id="SEX" value="남자" <c:if test="${model.pageDomain.SEX == '남자'}">checked</c:if>>
                                                        <label for="man">남자</label>
                                                        <input type="radio" name="SEX" id="SEX" value="여자" <c:if test="${model.pageDomain.SEX == '여자'}">checked</c:if>>
                                                        <label for="woman">여자</label>
                                                    </li>
                                                    <li>
                                                        <div class="address_01">
                                                            <span class="list_t">학교주소</span>
                                                            <input class="input_size" type="text" name="SCHOOL_ZIPCODE" id="SCHOOL_ZIPCODE" value="${model.pageDomain.SCHOOL_ZIPCODE}" readonly>
                                                            <button type="button" onClick="schoolZipCode()">우편번호</button>
                                                        </div>
                                                        <div class="address_02">
                                                            <input class="input_address" type="text" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" value="${model.pageDomain.SCHOOL_ADDRESS}" readonly>
                                                            <input class="input_address" type="text" name="SCHOOL_ADDRESS_DETAIL" id="SCHOOL_ADDRESS_DETAIL" value="${model.pageDomain.SCHOOL_ADDRESS_DETAIL}">
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">휴대폰</span>
                                                        <input class="input_size" type="text" name="PHONE" id="PHONE" value="${model.pageDomain.PHONE}">
                                                    </li>
                                                    <li>
                                                        <span class="list_t">이메일</span>
                                                        <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.pageDomain.EMAIL}">
                                                    </li>
                                                    <li>
                                                        <span class="list_t">지원영역</span>
                                                        <select class="input_size" id="SUPPORT_AREA" name="SUPPORT_AREA" value="${model.pageDomain.SUPPORT_AREA}">
                                                            <option <c:if test="${model.pageDomain.SUPPORT_AREA == '수학'}">selected</c:if>>수학</option>
                                                            <option <c:if test="${model.pageDomain.SUPPORT_AREA == '과학'}">selected</c:if>>과학</option>
                                                            <option <c:if test="${model.pageDomain.SUPPORT_AREA == '수·과학'}">selected</c:if>>수·과학</option>
                                                            <option <c:if test="${model.pageDomain.SUPPORT_AREA == '발명'}">selected</c:if>>발명</option>
                                                            <option <c:if test="${model.pageDomain.SUPPORT_AREA == '정보'}">selected</c:if>>정보</option>
                                                            <option <c:if test="${model.pageDomain.SUPPORT_AREA == '인문사회'}">selected</c:if>>인문사회</option>
                                                        </select>
                                                    </li>
                                                    <li>
                                                        <div class="address_01">
                                                            <span class="list_t">집주소</span>
                                                            <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" readonly value="${model.pageDomain.ZIPCODE}">
                                                            <button type="button" onClick="zipCode()">우편번호</button>
                                                        </div>
                                                        <div class="address_02">
                                                            <input class="input_address" type="text" name="ADDRESS" id="ADDRESS" readonly value="${model.pageDomain.ADDRESS}">
                                                            <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL" value="${model.pageDomain.ADDRESS_DETAIL}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="title">
                                                <h2>보호자 정보입력</h2>
                                            </div>
                                            <div class="guardian_input_wrap">
                                                <ul class="guardian_input">
                                                    <li>
                                                        <span class="list_t">이름</span>
                                                        <input class="input_size" type="text" name="PARENTS_NAME" id="PARENTS_NAME" value="${model.pageDomain.PARENTS_NAME}"/>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">학생과의 관계</span>
                                                        <input class="input_size" type="text" name="PARENTS_RELATION" id="PARENTS_RELATION" value="${model.pageDomain.PARENTS_RELATION}"/>
                                                    </li>
                                                    <li>
                                                        <span class="list_t">연락처</span>
                                                        <input class="input_size" type="text" name="PARENTS_PHONE" id="PARENTS_PHONE" value="${model.pageDomain.PARENTS_PHONE}"/>
                                                    </li>
                                                    <!-- 
                                                    <li>
                                                        <span class="list_t">휴대폰</span>
                                                        <input class="input_size" type="text" name="PARENTS_PHONE2" id="PARENTS_PHONE2" value="${model.pageDomain.PARENTS_PHONE2}"/>
                                                    </li>
                                                    -->
                                                </ul>
                                            </div>
                                        </div>
                                        </c:if>

                                        <c:if test="${ssion_member_type == '2'}">
                                        <div class="member_input_wrap nanumgothic">
                                            <ul class="member_input">
                                                <li>
                                                    <span class="list_t">아이디</span>
                                                    <input class="input_size" type="text" name="" id="" value="${model.pageDomain.MEMBER_ID}" readonly>
                                                </li>
                                                <li>
                                                    <span class="list_t">비밀번호<b class="relate_c">＊</b></span>
                                                    <input class="input_size mr" type="password" name="PASSWORD" id="PASSWORD" >
                                                    <span class="relate_c">비밀번호 변경시 원하는 비밀번호를 써주세요.</span>
                                                </li>
                                                <li>
                                                    <span class="list_t">비밀번호 확인<b class="relate_c">＊</b></span>
                                                    <input class="input_size" type="password" name="PASSWORD2" id="PASSWORD2">
                                                </li>
                                                <li>
                                                    <span class="list_t">이름</span>
                                                    <input class="input_size" type="text"  name="NAME" id="NAME" value="${model.pageDomain.NAME}">
                                                </li>
                                                <li>
                                                    <span class="list_t">소속</span>
                                                    <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME" value="${model.pageDomain.SCHOOL_NAME}">
                                                </li>
                                                <li>
                                                    <span class="list_t">시도명</span>
                                                    <select class="input_size" ID="ADDRESS_LOCAL" NAME="ADDRESS_LOCAL">
                                                        <option value="">선택하여주세요</option>
                                                        <option value="서울" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '서울'}">selected</c:if>>서울</option>
                                                        <option value="부산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '부산'}">selected</c:if>>부산</option>
                                                        <option value="대구" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대구'}">selected</c:if>>대구</option>
                                                        <option value="인천" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '인천'}">selected</c:if>>인천</option>
                                                        <option value="광주" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '광주'}">selected</c:if>>광주</option>
                                                        <option value="대전" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '대전'}">selected</c:if>>대전</option>
                                                        <option value="울산" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '울산'}">selected</c:if>>울산</option>
                                                        <option value="세종" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '세종'}">selected</c:if>>세종</option>
                                                        <option value="경기도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경기도'}">selected</c:if>>경기도</option>
                                                        <option value="강원도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '강원도'}">selected</c:if>>강원도</option>
                                                        <option value="충청북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청북도'}">selected</c:if>>충청북도</option>
                                                        <option value="충청남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '충청남도'}">selected</c:if>>충청남도</option>
                                                        <option value="전라북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라북도'}">selected</c:if>>전라북도</option>
                                                        <option value="전라남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '전라남도'}">selected</c:if>>전라남도</option>
                                                        <option value="경상북도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상북도'}">selected</c:if>>경상북도</option>
                                                        <option value="경상남도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '경상남도'}">selected</c:if>>경상남도</option>
                                                        <option value="제주도" <c:if test="${model.pageDomain.ADDRESS_LOCAL == '제주도'}">selected</c:if>>제주도</option>
                                                    </select>                                                
                                                    <span class="relate_b">현재 거주하는 시,도명</span>
                                                </li>
                                                <li>
                                                    <span class="list_t">휴대전화</span>
                                                    <input class="input_size" type="text" name="PHONE" id="PHONE" value="${model.pageDomain.PHONE}">
                                                    <span class="relate_c">- 없이 입력해주세요.</span>
                                                </li>
                                                <li>
                                                    <span class="list_t">우편번호</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" value="${model.pageDomain.ZIPCODE}" readonly>
                                                    <button type="button" onClick="zipCode();">우편번호 검색</button>
                                                </li>
                                                <li>
                                                    <span class="list_t">주소</span>
                                                    <input class="input_address" type="text"  name="ADDRESS" id="ADDRESS" value="${model.pageDomain.ADDRESS}" readonly>
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL"  value="${model.pageDomain.ADDRESS_DETAIL}">
                                                </li>
                                                <li>
                                                    <span class="list_t">이메일</span>
                                                    <input class="input_size" type="text" name="EMAIL" id="EMAIL" value="${model.pageDomain.EMAIL}" >
                                                </li>
                                                <li>
                                                    <span class="list_t">전공</span>
                                                    <input class="input_size" type="text" name="SCHOOL_MAJOR" id="SCHOOL_MAJOR" value="${model.pageDomain.SCHOOL_MAJOR}">
                                                </li>
                                            </ul>
                                        </div>
                                        </c:if>
                                    </form>

                                    <!--보드 검색_버튼-->
                                    <div class="board_btn_wrap">
                                        <div class="board_btn">
                                            <a class="delete" href="javascript:insertClick();">저장하기</a>
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
        <%@ include file="../include/footer.jsp" %> 
    </footer>
    
    <%@ include file="../include/footerJs.jsp" %> 
</body>
</html>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript">

    function insertClick(){

        if($('#PASSWORD').val() == ''){
            alert('저장을 하실려면 비밀번호를 입력해주세요. 비밀번호 변경시 새로운 비밀번호를 입력해주세요.');
            $('#PASSWORD').focus();
            return;
        }
        
        //이름
        /* 
        if($('#NAME').val() == ''){
            alert('이름을 입력해주세요.');
            $('#NAME').focus();
            return;
        } 
        */
        /* 
        //소속
        if($('#SCHOOL_NAME').val() == ''){
            alert('소속을 입력해주세요.');
            $('#SCHOOL_NAME').focus();
            return;
        }
        
        //휴대전화
        if($('#PHONE').val() == ''){
            alert('휴대전화를 입력해주세요.');
            $('#PHONE').focus();
            return;
        }
        */

        /*
        var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
        if(!regExp.test($('#PHONE').val())){
            alert('휴대전화 번호 확인해주세요.');
            $('#PHONE').focus();
            return;
        }
        */

        //우편번호
        /*
        if($('#ZIPCODE').val() == ''){
            alert('우편번호를 입력해주세요.');
            $('#ZIPCODE').focus();
            return;
        }
        */
        
        //주소
        /*
        if($('#ADDRESS').val() == ''){
            alert('주소를 입력해주세요.');
            $('#ADDRESS').focus();
            return;
        }
        */
        
        //이메일
        /*
        if($('#EMAIL').val() == ''){
            alert('이메일을 입력해주세요.');
            $('#EMAIL').focus();
            return;
        }
        */
        
        /*
        var URL = '${pageContext.request.contextPath}/user/member/update.do'
        var formData = $("#updateform").serialize();

        $.ajax({
            type : "POST",
            url : URL,
            cache : false,
            data : formData,
            success: function(result)
            {
                var s = result.indexOf("true");
                if(s != -1)
                {
                    location.href = '${pageContext.request.contextPath}/user/member/view.do';
                    return;
                }else{
                    alert('수정 오류');
                    return;
                }

            }
        });
        */

        $("#updateform").submit();
    }


    function schoolZipCode(){

        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                $('#SCHOOL_ZIPCODE').val(data.zonecode);
                $('#SCHOOL_ADDRESS').val(data.roadAddress);
            }
        }).open();	
    }

    function zipCode()
    {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                $('#ZIPCODE').val(data.zonecode);
                $('#ADDRESS').val(data.roadAddress);
            }
        }).open();	
    }

    $.datetimepicker.setLocale('ko');
    jQuery('.datecalendar').datetimepicker({
        format:'Y.m.d',
        lang: "ko",
        timepicker:false
    });

</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">

<!--추가 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
