<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %> 
        <link href="${pageContext.request.contextPath}/resources/css/admin/member_re_list.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
    <!--헤더-->
    <%@ include file="../include/header.jsp" %>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">

                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>신입생 지원 리스트</span>
                            </div>
                            <form action="list.do?" method="get">
                                <div class="member_re_seach_form">
                                    <div class="member_re_01_wrap">
                                        <form>
                                            <div class="form_01">
                                                <div class="page_seach">

                                                    <select ID="ADDRESS_LOCAL" NAME="ADDRESS_LOCAL">
                                                        <option value="">지역</option>
                                                        <option value="서울" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '서울'}">selected</c:if>>서울</option>
                                                        <option value="경기" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '경기'}">selected</c:if>>경기</option>
                                                        <option value="인천" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '인천'}">selected</c:if>>인천</option>
                                                        <option value="강원" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '강원'}">selected</c:if>>강원</option>
                                                        <option value="대전" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '대전'}">selected</c:if>>대전</option>
                                                        <option value="세종" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '세종'}">selected</c:if>>세종</option>
                                                        <option value="충남" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '충남'}">selected</c:if>>충남</option>
                                                        <option value="충북" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '충북'}">selected</c:if>>충북</option>
                                                        <option value="광주" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '광주'}">selected</c:if>>광주</option>
                                                        <option value="전남" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '전남'}">selected</c:if>>전남</option>
                                                        <option value="전북" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '전북'}">selected</c:if>>전북</option>
                                                        <option value="부산" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '부산'}">selected</c:if>>부산</option>
                                                        <option value="경남" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '경남'}">selected</c:if>>경남</option>
                                                        <option value="대구" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '대구'}">selected</c:if>>대구</option>
                                                        <option value="경북" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '경북'}">selected</c:if>>경북</option>
                                                        <option value="제주" <c:if test="${model.beforeDomain.ADDRESS_LOCAL == '제주'}">selected</c:if>>제주</option>
                                                    </select>

                                                    <select ID="SCHOOL_TYPE" NAME="SCHOOL_TYPE">
                                                        <option value="">학교급</option>
                                                        <option value="초" <c:if test="${model.beforeDomain.SCHOOL_TYPE == '초'}">selected</c:if>>초등학교</option>
                                                        <option value="중" <c:if test="${model.beforeDomain.SCHOOL_TYPE == '중'}">selected</c:if>>중학교</option>
                                                        <option value="고" <c:if test="${model.beforeDomain.SCHOOL_TYPE == '고'}">selected</c:if>>고등학교</option>
                                                    </select>

                                                    <select ID="SCHOOL_YEAR" NAME="SCHOOL_YEAR">
                                                        <option value="">학년</option>
                                                        <option value="4" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '4'}">selected</c:if>>초등학교 4학년</option>
                                                        <option value="5" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '5'}">selected</c:if>>초등학교 5학년</option>
                                                        <option value="6" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '6'}">selected</c:if>>초등학교 6학년</option>
                                                        <option value="7" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '7'}">selected</c:if>>중학교 1학년</option>
                                                        <option value="8" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '8'}">selected</c:if>>중학교 2학년</option>
                                                        <option value="9" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '9'}">selected</c:if>>중학교 3학년</option>
                                                        <option value="10" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '10'}">selected</c:if>>고등학교 1학년</option>
                                                        <option value="11" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '11'}">selected</c:if>>고등학교 2학년</option>
                                                        <option value="12" <c:if test="${model.beforeDomain.SCHOOL_YEAR == '12'}">selected</c:if>>고등학교 3학년</option>
                                                    </select>

                                                    <select ID="SEARCH_TYPE" NAME="SEARCH_TYPE">
                                                        <option value="ALL">전체</option>
                                                        <option value="NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'NAME'}">selected</c:if>>성명</option>
                                                        <option value="SEX" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SEX'}">selected</c:if>>성별</option>
                                                        <option value="SCHOOL_NAME" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_NAME'}">selected</c:if>>학교명</option>
                                                        <option value="SCHOOL_YEAR" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SCHOOL_YEAR'}">selected</c:if>>학년</option>
                                                        <option value="SUPPORT_AREA" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'SUPPORT_AREA'}">selected</c:if>>지원유형</option>
                                                        <option value="ELIGIBILITY" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'ELIGIBILITY'}">selected</c:if>>지원자격</option>
                                                        <option value="PHONE" <c:if test="${model.beforeDomain.SEARCH_TYPE == 'PHONE'}">selected</c:if>>연락처</option>
                                                    </select>

                                                    <input style="width: 191px;" type="text" value="${model.beforeDomain.SEARCH_TEXT}" name="SEARCH_TEXT" id="SEARCH_TEXT" placeholder="검색할 내용을 입력해주세요.">
                                                    <button type="button" onClick="searchBtnClick()" value="검색">검색</button>
                                                    <a class="w_btn" href="./list.do">새로고침</a>
                                                    <button type="button" onclick="PassMemberUploadProgram()">아이디 발급</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
									
                                    <!-- 문자 발송  -->
                                    <!-- 
                                    <div class="member_re_03_wrap">
                                        <form>
                                            <span>문자메세지 (<span style="vertical-align: baseline;" id="sms_text_size">0</span>글자)</span>
                                            <input style="width: 397px;" type="text" value="" id="sms_text" name="MESSAGE">
                                            <input type="checkbox" id="RESERVATION" name="RESERVATION"  >
                                            <input class="datecalendar2" type="text"  value="" id="RESERVATION_TM" name="RESERVATION_TM" readonly style="display: none;">
                                            <input  type="text"  value="" id="RESERVATION_TM2" name="RESERVATION_TM2" readonly>
                                            <button type="button" onClick="javascript:smssend_re('member')" value="문자발송">문자발송</button>
                                            <button type="button" onClick="javascript:smssend_all('member')" value="합격문자발송">전체 문자발송</button>    
                                            <a class="w_btn" href="${pageContext.request.contextPath}/admin/sms_log/member/list.do">발송내역</a>
                                        </form>
                                    </div>
                                    -->
                                    <!-- 문자 종료  -->

                                </div>

                                <!-- 신입생 테이블 -->
                                <div class="table_wrap">
                                    <table id="gcTable" class="tablesorter">
                                        <thead>
                                            <tr>
                                                <th class="check"><input type="checkbox" class="" name="chk_calc_all" id="chk_calc_all" value=""></th>
                                                <th class="number" data-col="IDX">순번</th>
                                                <th class="type" data-col="type">유형</th>
                                                <th class="name">성명</th>
                                                <th class="sex">성별<button id="upbtn" class="updwbtn" value="SEX">▲</button><button id="dwbtn" class="updwbtn" value="SEX" >▼</button></th>
                                                <th class="address_local">지역<button id="upbtn" class="updwbtn" value="ADDRESS_LOCAL">▲</button><button id="dwbtn" class="updwbtn" value="ADDRESS_LOCAL" >▼</button></th>
                                                <th class="birth">생년월일<button id="upbtn" class="updwbtn" value="BIRTH">▲</button><button id="dwbtn" class="updwbtn" value="BIRTH" >▼</button></th>
                                                <th class="school_name">학교명<button id="upbtn" class="updwbtn" value="SCHOOL_NAME">▲</button><button id="dwbtn" class="updwbtn" value="SCHOOL_NAME" >▼</button></th>
                                                <th class="school_type">학교급</th>
                                                <th class="school_year" data-col="SCHOOL_YEAR">학년<button id="upbtn" class="updwbtn" value="SCHOOL_YEAR">▲</button><button id="dwbtn" class="updwbtn" value="SCHOOL_YEAR" >▼</button></th>
                                                <th class="phone">연락처</th>
                                                <th class="eligibility">지원자격</th>
                                                <th class="support_area">신청 날짜</th>
                                                <th class="result">서류</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${model.list}" varStatus="var">
                                            <tr onclick="update('${item.TYPE }','${item.NAME}','${item.BIRTH }','${item.LEVEL }')">
                                                <td><input type="checkbox" value="${item.IDX}" name="chk_calc" data-id="${item.IDX}"  data-idx="${item.IDX}" data-phone="${item.PHONE}"></td>
                                                <td>${model.itemtotalcount - (var.index + model.beforeDomain.PAGE *  model.beforeDomain.ITEM_COUNT)}</td>
                                                <td>
                                                	<c:if test="${item.TYPE == '1' }">
                                                		유형1
                                                	</c:if>
                                                	<c:if test="${item.TYPE == '2' }">
                                                		유형2
                                                	</c:if>
                                                	<c:if test="${item.TYPE == '3' }">
                                                		유형3
                                                	</c:if>
                                                </td>
                                                <td>${item.NAME}</td>
                                                <td>${item.SEX}</td>                                        
                                                <td>
                                                    <!--${item.ADDRESS_LOCAL}-->
                                                    <c:if test="${item.ADDRESS_LOCAL == '서울'}">서울</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '경기'}">경기</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '인천'}">인천</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '강원'}">강원</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '대전'}">대전</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '세종'}">세종</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '충남'}">충남</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '충북'}">충북</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '광주'}">광주</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '전남'}">전남</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '전북'}">전북</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '부산'}">부산</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '경남'}">경남</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '대구'}">대구</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '경북'}">경북</c:if>
                                                    <c:if test="${item.ADDRESS_LOCAL == '제주특별자치도'}">제주</c:if>
                                                </td>                                        
                                                <td>${item.BIRTH}</td>
                                                <td>${item.SCHOOL_NAME}</td>
                                                <td>
                                                    <!--${item.SCHOOL_TYPE}-->
                                                    <c:if test="${item.SCHOOL_TYPE == '초등학교'}">초등학교</c:if>
                                                    <c:if test="${item.SCHOOL_TYPE == '중학교'}">중학교</c:if>
                                                    <c:if test="${item.SCHOOL_TYPE == '고등학교'}">고등학교</c:if>
                                                </td>
                                                <td>
                                                    <!--${item.SCHOOL_YEAR}-->
                                                    <c:if test="${item.SCHOOL_YEAR == '4'}">4</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '5'}">5</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '6'}">6</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '7'}">1</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '8'}">2</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '9'}">3</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '10'}">1</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '11'}">2</c:if>
                                                    <c:if test="${item.SCHOOL_YEAR == '12'}">3</c:if>
                                                </td>
                                                <td>${item.PHONE}</td>
                                                <td id="ELIGIBILITY">${item.ELIGIBILITY}</td>
                                                <td class="td_08">${fn:substring(item.CREATE_TM,0,11)}</td>
                                                <td> 
                                                	<c:if test="${item.TYPE == '1' && item.LEVEL == '11'}">
                                                		<c:if test="${(item.DCMNT_TOTAL_CNT + 3 - item.DCMNT_CNT) > 0}">
                                                			대기
                                                		</c:if>
                                                		<c:if test="${(item.DCMNT_TOTAL_CNT + 3 - item.DCMNT_CNT) == 0}">
                                                			완료
                                                		</c:if>
                                                	</c:if>
                                                	<c:if test="${item.TYPE == '1' && item.LEVEL == '8'}">
                                                		
                                                	</c:if>
                                                	<c:if test="${item.TYPE == '2'}">
                                                		<c:if test="${(item.DCMNT_TOTAL_CNT + 2 - item.DCMNT_CNT) > 0 }">
                                                			대기
                                                		</c:if>
                                                		<c:if test="${(item.DCMNT_TOTAL_CNT + 2 - item.DCMNT_CNT) == 0 }">
                                                			완료
                                                		</c:if>
                                                	</c:if>
                                                	<c:if test="${item.TYPE == '3'}">
                                                		<c:if test="${(item.DCMNT_TOTAL_CNT + 1 - item.DCMNT_CNT) > 0 }">
                                                			대기
                                                		</c:if>
                                                		<c:if test="${(item.DCMNT_TOTAL_CNT + 1 - item.DCMNT_CNT) == 0 }">
                                                			완료
                                                		</c:if>
                                                	</c:if>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!--페이지 넘버-->
                                <nav class="paging_number">
                                    <ul class="page">

										<c:if test="${model.page > 0}"> 
											<c:if test="${model.itempagestart-model.itemCount > 0}">
								                 <li id="first_a"><a href="javascript:pageChanged(0, 0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
								                 <li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
											</c:if>
											<c:if test="${model.itempagestart-model.itemCount <= 0}">
												<li id="first_a"><a href="javascript:pageChanged(0,0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
												<li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
											</c:if>
										</c:if>
							
										<c:if test="${model.page <= 0}">
											  <li id="first_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
										      <li id="prev_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
										</c:if>
										
										<c:if test="${model.itempageend > 0}">
											<c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
												<c:choose>
													<c:when test="${model.page == i }">
														<li class="number page_active"><a href="#">${i+1}</a></li>
													</c:when>
													<c:otherwise>
														<li class="number"><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
							
										<c:if test="${model.itempageend == 0}">
											<li class="number">1</li>
										</c:if>
										<c:if test="${model.itempageend < 0}">
											<li class="number">1</li>
										</c:if>
										
										<c:if test="${model.itemCount < model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if>
										<c:if test="${model.itemCount >= model.itemtotalcount/(model.page+1)}">
											<li id="next_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
										</c:if>
							
										<fmt:parseNumber var="lastPage" value="${(model.itemtotalcount % model.itemCount)==0? ((model.itemtotalcount/model.itemCount)-1) : (model.itemtotalcount / model.itemCount)}" integerOnly="true" />
										<c:choose>
											<c:when	test="${model.itemCount < model.itemtotalcount/(page+1)}">
											<li id="end_a"><a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
												
											</c:when>
											<c:otherwise>
											<li id="end_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
											</c:otherwise>
										</c:choose>
										
										</ul>
                                </nav>
                                <!--페이지 넘버 end-->

                            </form>
                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->


	<div class="member_modal_wrap" id="memberReMoal">
		<div class="member_modal_con member_input_wrap" style="width : 1050px">
			<div class="modal_title">
			<h2>합격자 리스트 <span>총인원 : </span><span id="UploadMemberCnt"></span></h2>
			</div>
			<div id="memberUploadTable" class="table_wrap" style="max-height:300px;overflow:scroll">
				
			</div>
			<div class="member_btn adm_btn_wrap mr-0">
				<ul id="step_button">
					<li class="register modal_close"><a href="javascript:MemberModelFadeOut()">취소</a></li>
					<li class="register modal_upload" id="excel_upload_step_1">
						<a href="javascript:PassMemberInsert()">아이디 발급</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

    <!--푸터-->
    <footer>
        <%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/freshman.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.table2excel.js" type="text/javascript"></script>
	
</body>

</html>

<%@ include file="../include/footerJs.jsp" %>


<script>			
function pageChanged(page, endpage)
{
	if (page < 0) 
	{
		page = 0;
	}
	if (endpage < 0){
		endpage = 0;
	}
	if (page >= endpage) {
		page = endpage;
	}
	
	
	var URL = "pass.do?RESULT=pass&PAGE="+page;
	 URL = URL + "&ITEM_COUNT=" + '10';

	URL = URL + "&SEARCH_TEXT=" + encodeURI('${model.beforeDomain.SEARCH_TEXT}');
	URL = URL + "&SEARCH_TYPE=" + '${model.beforeDomain.SEARCH_TYPE}';

	
	if('${model.beforeDomain.LEVEL}' != ''){
		URL = URL + "&LEVEL=" + '${model.beforeDomain.LEVEL}';
	}
	

	if('${model.beforeDomain.ADDRESS_LOCAL}' != ''){
		URL = URL + "&ADDRESS_LOCAL=" + '${model.beforeDomain.ADDRESS_LOCAL}';
	}
	
	if('${model.beforeDomain.SCHOOL_TYPE}' != ''){
		URL = URL + "&SCHOOL_TYPE=" + '${model.beforeDomain.SCHOOL_TYPE}';
	}
	
	if('${model.beforeDomain.TYPE}' != ''){
		URL = URL + "&TYPE=" + '${model.beforeDomain.TYPE}';
	}
	
	
	if('${model.beforeDomain.YEAR}' != ''){
		URL = URL + "&YEAR=" + '${model.beforeDomain.YEAR}';
	}
	
	if('${model.beforeDomain.LOCATION}' != ''){
		URL = URL + "&LOCATION=" + '${model.beforeDomain.LOCATION}';
	}
	
	if('${model.beforeDomain.SCHOOL_YEAR}' != ''){
		URL = URL + "&SCHOOL_YEAR=" + '${model.beforeDomain.SCHOOL_YEAR}';
	}
	
	if('${model.beforeDomain.UP}' != ''){
		URL = URL + "&UP=" + '${model.beforeDomain.UP}';
	}
	
	
	if('${model.beforeDomain.DOWN}' != ''){
		URL = URL + "&DOWN=" + '${model.beforeDomain.DOWN}';
	}
	
	if('${model.beforeDomain.SEX}' != ''){
		URL = URL + "&SEX=" + '${model.beforeDomain.SEX}';
	}
	if('${model.beforeDomain.ADDRESS_LOCAL}' != ''){
		URL = URL + "&ADDRESS_LOCAL=" + '${model.beforeDomain.ADDRESS_LOCAL}';
	}
	
	var birth = '';
	birth = '${model.beforeDomain.BIRTH}';
	if('${model.beforeDomain.BIRTH}' != ''){
		URL = URL + "&BIRTH=" + '${model.beforeDomain.BIRTH}';
	}
	if('${model.beforeDomain.SCHOOL_NAME}' != ''){
		URL = URL + "&SCHOOL_NAME=" + '${model.beforeDomain.SCHOOL_NAME}';
	}
	
	location.href = URL;
}


</script>

<script>

    // 정렬 
    $(document).ready(function(){
        $(".updwbtn").click(function(){
            if(($(this).attr('id')) == 'upbtn'){
                UPDWVAL = $(this).val();
                URL = './pass.do?RESULT=pass&';
                URL = URL + "PAGE=0";
                URL = URL + "&ITEM_COUNT=" + '10';
                
                URL = URL + "&ADDRESS_LOCAL=" + $('#ADDRESS_LOCAL').val();
                URL = URL + "&SCHOOL_TYPE=" +$('#SCHOOL_TYPE').val();
                URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();
                URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
                URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
                URL = URL + "&UP=" + UPDWVAL;
                location.href = URL;
            }else{
                UPDWVAL = $(this).val();
                URL = './pass.do?RESULT=pass&';
                URL = URL + "PAGE=0";
                URL = URL + "&ITEM_COUNT=" + '10';
                
                URL = URL + "&ADDRESS_LOCAL=" + $('#ADDRESS_LOCAL').val();
                URL = URL + "&SCHOOL_TYPE=" +$('#SCHOOL_TYPE').val();
                URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();

                URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
                URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
                URL = URL + "&DOWN=" + UPDWVAL;
                location.href = URL;
            }
        });
    });

 

    $("#bootstrap-data-table tr").click(function(){     
        console.log($(this).data("id"));
        if($(this).data("role") == 'button') {
            var URL = './'+$(this).data("id")+'/update.do?';
            URL = URL + "PAGE=${model.beforeDomain.PAGE}";
            URL = URL + "&SEARCH_TEXT=${model.beforeDomain.SEARCH_TEXT}";
            URL = URL + "&SEARCH_TYPE=${model.beforeDomain.SEARCH_TYPE}";
            location.href = URL;
        }	    
    });

    function searchBtnClick() {
        URL = './list.do';
        URL = URL + "?PAGE=0";
        URL = URL + "&ITEM_COUNT=" + '10';
        
        URL = URL + "&RESULT="+$('#RESULT').val();
        URL = URL + "&ADDRESS_LOCAL=" + $('#ADDRESS_LOCAL').val();
        URL = URL + "&SCHOOL_TYPE=" +$('#SCHOOL_TYPE').val();
        URL = URL + "&SCHOOL_YEAR=" +$('#SCHOOL_YEAR').val();
        URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
        URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();
        location.href = URL;
    }
    
    function update(TYPE , NAME , BIRTH , LEVEL){
    	location.href='${pageContext.request.contextPath}/admin/member_re/update.do?TYPE='+TYPE+'&NAME='+NAME+'&BIRTH='+BIRTH+'&LEVEL='+LEVEL+'';
    }
    
    function PassMemberReUploadProgram(){
    	
    	var result = confirm('해당 대상자들의 아이디발급을 진행하시겠습니까?');
    	if(result == true){
    		console.log('아이디 발급 진행');
    		
    		$.ajax({
    			type : 'GET',
    			url : '/admin/member_re/PassMemberReUploadProgram.do',
    			success : function(status , xhr){
    				console.log('아이디발급 완료');
    			},
    			error : function(error , status){
    				console.log('error')
    			}
    		})
    		
    	}else{
    		console.log('종료');
    	}
    	
    }
    
    function MemberModelFadeOut(){
    	
    	$("#memberUploadTable").html('');
    	$(".member_modal_wrap").fadeOut(300);
    }
    
    function PassMemberUploadProgram() {
        $.ajax({
            url: "/admin/member_re/api/PassMemberListAll.do",
            type: "POST",
            dataType: "json",
            success: function(data) {
                if (data.length > 0) {
                    let tableHtml = '<table id="memberUploadTable" style="width:100%"><thead><tr><th>기존 아이디</th><th>이름</th><th>생년월일</th><th>전화번호</th></tr></thead><tbody>';

                    data.forEach(function(item) {
                    	
                    	var cleanName = item.NAME.replace(/[0-9]+$/, '');
                    	var cleanType = '';
                    	if(item.LEVEL == '11'){
                    		cleanType = '1';
                    	}else if(item.LEVEL == '8'){
                    		cleanType = '2';
                    	}
                        tableHtml += '<tr>' +
                                        '<td class="member_id">' + item.MEMBER_ID + '</td>' +
                                        '<td class="name">' + cleanName + '</td>' +
                                        '<td class="birth">' + item.BIRTH + '</td>' +
                                        '<td class="phone">' + item.PHONE + '</td>' +
                                        '<input type="hidden" name="IDX" value="' + item.IDX + '">' +
                                        '<input type="hidden" name="MEMBER_ID" value="' + item.MEMBER_ID + '">' +
                                        '<input type="hidden" name="PASSWORD" value="' + item.PASSWORD + '">' +
                                        '<input type="hidden" name="TYPE" value="' + cleanType + '">' +
                                        '<input type="hidden" name="TYPE_SUB" value="' + item.TYPE_SUB + '">' +
                                        '<input type="hidden" name="LEVEL" value="' + item.LEVEL + '">' +
                                        '<input type="hidden" name="NAME" value="' + cleanName + '">' +
                                        '<input type="hidden" name="BIRTH" value="' + item.BIRTH + '">' +
                                        '<input type="hidden" name="SEX" value="' + item.SEX + '">' +
                                        '<input type="hidden" name="PHONE" value="' + item.PHONE + '">' +
                                        '<input type="hidden" name="EMAIL" value="' + item.EMAIL + '">' +
                                        '<input type="hidden" name="PARENT_PHONE" value="' + item.PARENT_PHONE + '">' +
                                        '<input type="hidden" name="ZIPCODE" value="' + item.ZIPCODE + '">' +
                                        '<input type="hidden" name="ADDRESS" value="' + item.ADDRESS + '">' +
                                        '<input type="hidden" name="ADDRESS_DETAIL" value="' + item.ADDRESS_DETAIL + '">' +
                                        '<input type="hidden" name="ADDRESS_LOCAL" value="' + item.ADDRESS_LOCAL + '">' +
                                        '<input type="hidden" name="SCHOOL_ADDRESS" value="' + item.SCHOOL_ADDRESS + '">' +
                                        '<input type="hidden" name="SCHOOL_LOCATION" value="' + item.SCHOOL_LOCATION + '">' +
                                        '<input type="hidden" name="SCHOOL_TYPE" value="' + item.SCHOOL_TYPE + '">' +
                                        '<input type="hidden" name="SCHOOL_NAME" value="' + item.SCHOOL_NAME + '">' +
                                        '<input type="hidden" name="SCHOOL_YEAR" value="' + item.SCHOOL_YEAR + '">' +
                                        '<input type="hidden" name="SCHOOL_GROUP" value="' + item.SCHOOL_GROUP + '">' +
                                        '<input type="hidden" name="ELIGIBILITY" value="' + item.ELIGIBILITY + '">' +
                                        '<input type="hidden" name="RESULT" value="' + item.RESULT + '">' +
                                        '<input type="hidden" name="MATCHING" value="' + item.MATCHING + '">' +
                                      '</tr>';
                    });
                    
                    tableHtml += '</tbody></table>';
                    $("#memberUploadTable").html(tableHtml);
                    $("#UploadMemberCnt").html(data.length);
                    $(".member_modal_wrap").fadeIn(300);
                } else {
                    Swal.fire("알림", "합격자 리스트가 없습니다.", "info");
                }
            },
            error: function() {
                Swal.fire("오류", "합격자 리스트를 가져오는 데 실패했습니다.", "error");
            }
        });
    }
    
    
    function PassMemberInsert() {
        var rows = $("#memberUploadTable tbody tr").toArray();
        var total = rows.length;
        var progress = 0;

        Swal.fire({
            title: "아이디 발급 중",
            html: '<div id="progress">0 / ' + total + '</div>',
            allowOutsideClick: false,
            willOpen: () => {
                Swal.showLoading();
                processRows(rows, total, progress);
            }
        });
    }

    function processRows(rows, total, progress) {
        var rowIndex = 0;

        function processNextRow() {
            if (rowIndex < total) {
                var row = $(rows[rowIndex]);
                var memberData = {
                    IDX: row.find('input[name="IDX"]').val(),
                    MEMBER_ID: row.find('input[name="MEMBER_ID"]').val(),
                    PASSWORD: row.find('input[name="PASSWORD"]').val(),
                    TYPE: row.find('input[name="TYPE"]').val(),
                    TYPE_SUB: row.find('input[name="TYPE_SUB"]').val(),
                    LEVEL: row.find('input[name="LEVEL"]').val(),
                    NAME: row.find('input[name="NAME"]').val(),
                    BIRTH: row.find('input[name="BIRTH"]').val(),
                    SEX: row.find('input[name="SEX"]').val(),
                    PHONE: row.find('input[name="PHONE"]').val(),
                    EMAIL: row.find('input[name="EMAIL"]').val(),
                    PARENT_PHONE: row.find('input[name="PARENT_PHONE"]').val(),
                    ZIPCODE: row.find('input[name="ZIPCODE"]').val(),
                    ADDRESS: row.find('input[name="ADDRESS"]').val(),
                    ADDRESS_DETAIL: row.find('input[name="ADDRESS_DETAIL"]').val(),
                    ADDRESS_LOCAL: row.find('input[name="ADDRESS_LOCAL"]').val(),
                    SCHOOL_ADDRESS: row.find('input[name="SCHOOL_ADDRESS"]').val(),
                    SCHOOL_LOCATION: row.find('input[name="SCHOOL_LOCATION"]').val(),
                    SCHOOL_TYPE: row.find('input[name="SCHOOL_TYPE"]').val(),
                    SCHOOL_NAME: row.find('input[name="SCHOOL_NAME"]').val(),
                    SCHOOL_YEAR: row.find('input[name="SCHOOL_YEAR"]').val(),
                    SCHOOL_GROUP: row.find('input[name="SCHOOL_GROUP"]').val(),
                    ELIGIBILITY: row.find('input[name="ELIGIBILITY"]').val(),
                    SELF_INTR: row.find('input[name="SELF_INTR"]').val(),
                    RESULT: row.find('input[name="RESULT"]').val(),
                    COMMENT: row.find('input[name="COMMENT"]').val(),
                    MATCHING: row.find('input[name="MATCHING"]').val(),
                    CREATE_TM: row.find('input[name="CREATE_TM"]').val(),
                    UPDATE_TM: row.find('input[name="UPDATE_TM"]').val(),
                    EXP_DATA: row.find('input[name="EXP_DATA"]').val(),
                    EXP_TYPE: row.find('input[name="EXP_TYPE"]').val(),
                    FILE_TYPE: row.find('input[name="FILE_TYPE"]').val()
                };

                $.ajax({
                    url: "/admin/member_re/api/PassMemberInsert.do",
                    type: "POST",
                    data: memberData,
                    dataType: "json",
                    success: function(response) {
                        if (response) {
                            progress++;
                            $("#progress").text(progress + ' / ' + total);
                        }
                        rowIndex++;
                        processNextRow();
                    },
                    error: function() {
                        rowIndex++;
                        processNextRow();
                    }
                });
            } else {
            	Swal.fire({
                    title: "완료",
                    text: "아이디 발급 및 문자 발송이 완료되었습니다. 매칭 작업을 실행하시겠습니까?",
                    icon: "success",
                    showCancelButton: true,
                    confirmButtonText: "예",
                    cancelButtonText: "아니오"
                }).then((result) => {
                    if (result.isConfirmed) {
                        executeMatching();
                    }else{
                    	MemberModelFadeOut();
                    }
                });
            }
        }

        processNextRow();
    }
    
    function executeMatching() {
        Swal.fire({
            title: "매칭 작업 실행 중",
            html: "잠시만 기다려주세요...",
            allowOutsideClick: false,
            willOpen: () => {
                Swal.showLoading();
                $.ajax({
                    url: "/admin/member_re/api/PassMemberMatching.do",
                    type: "POST",
                    dataType: "json",
                    success: function(response) {
                        if (response) {
                            Swal.fire("완료", "매칭 작업이 완료되었습니다.", "success");
                            MemberModelFadeOut();
                        } else {
                            Swal.fire("오류", "매칭 작업 중 오류가 발생했습니다.", "error");
                            MemberModelFadeOut();
                        }
                    },
                    error: function() {
                        Swal.fire("오류", "매칭 작업 중 오류가 발생했습니다.", "error");
                        MemberModelFadeOut();
                    }
                });
            }
        });
    }
    
</script>


<div id="iframe2" style="display:none">
    <iframe id="iframeDiv" src="#" width="750" height="800" left="300" top="150"></iframe>
</div>