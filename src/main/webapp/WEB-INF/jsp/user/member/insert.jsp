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
    
         <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
           <%@ include file="../include/menu_sub.jsp" %> 
      </section>
	</header>      
    <!-- 본문 -->
   <section id="new_sub" class="sub_wrap notosans">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">
                    <nav class="sub_min_size">
                        <div class="sub_page_wrap">
                            <div class="sub_page">
                                <div class="list_wrap">
								<form action="./insert.do?" method="post" name="updateform" id="updateform" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden"  name="TYPE_SUB" value="" />
                        <c:if test="${model.TYPE == '1'}">
                        <div class="sc_con" id="div_con">
  
                            <div class="member_register_wrap">
                                
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">가입유형</span>
                                                <input type="radio" name="TYPE" id="student" value="1" checked >
                                                <label for="student">학생</label>
                                                <input type="radio" name="TYPE" id="teacher" value="2">
                                                <label for="teacher">교사</label>
                                            </li>
                                            <!-- <li>
                                                <span class="list_t">구분</span>
                                                <input type="radio" name="sortation" id="TYPE_SUB">
                                                <label for="new">신규</label>
                                                <input type="radio" name="sortation" id="TYPE_SUB">
                                                <label for="add">추가</label>
                                                <input type="radio" name="sortation" id="TYPE_SUB">
                                                <label for="basic">추가2</label>
                                            </li> -->
                                            <li>
                                                <span class="list_t">아이디＊</span>
                                                <input class="input_size" type="text" name="MEMBER_ID" id="MEMBER_ID" placeholder="아이디를 써주세요.">
                                                <button type="button" onClick="idCheck()">아이디중복검사</button>
                                                <span class="relate_c">영문자,숫자조합(7자 ~ 20자)</span>
                                            </li>
                                            <li>
                                                <span class="list_t">비밀번호＊</span>
                                                <input class="input_size mr" type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호를 써주세요.">
                                                <span class="relate_c">영문자,숫자조합,특수문자 조합(7자 ~ 20자)</span>
                                                <span class="relate_c span_none span_active">※ 특수조합을 같이 조합해주세요.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">비밀번호 확인＊</span>
                                                <input class="input_size" type="password" name="PASSWORD2" id="PASSWORD2">

                                            </li>
                                            <li>
                                                <span class="list_t">이름＊</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="한글">
                                                <input class="input_size mr" type="text" name="NAME_ENG" id="NAME_ENG" placeholder="영문">
                                                <input class="input_size mr" type="text" name="NAME_HANJA" id="NAME_HANJA" placeholder="한자">
                                                <!-- <input type="radio" name="name" id="name">
                                                <label class="relate_c" for="name">동명이인(성명+생년월일+성별 일치)</label> -->
                                            </li>
                                            <li>
                                                <span class="list_t">사진</span>
                                                <input type="file" id="file" name="file">
                                                <!-- <input class="input_size" type="text" name="pic" id="pic"> -->
                                                <span class="relate_b">115px X 150px jpg, gif</span>
                                            </li>
                                            <li>
                                                <span class="list_t">시도명＊</span>
                                                <input class="input_size" type="text" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL">
                                                <span class="relate_b">현재 거주하는 시,도명</span>
                                            </li>
                                            <li>
                                                <span class="list_t">학교급＊</span>
                                                <select class="input_size mr-2" name="SCHOOL_TYPE" id="SCHOOL_TYPE">
                                                    <option>초등학교</option>
                                                    <option>중학교</option>
                                                    <option>고등학교</option>
                                                </select>
                                                <span class="list_t">학교명＊</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME">
                                            </li>
                                            <li>
                                                <span class="list_t">학년＊</span>
                                                <input class="input_size mr-2" type="number" name="SCHOOL_YEAR" id="SCHOOL_YEAR">
                                                <span class="list_t">반＊</span>
                                                <input class="input_size" type="number" name="SCHOOL_GROUP" id="SCHOOL_GROUP">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr-2 datecalendar" type="text" name="BIRTH" id="BIRTH" placeholder="날짜를 선택해주세요.">
                                                <!--  <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a>-->
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" id="man" value="남자" checked >
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" id="woman" value="여자">
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">학교주소</span>
                                                    <input class="input_size" type="text" name="SCHOOL_ZIPCODE" id="SCHOOL_ZIPCODE" readonly>
                                                    <button type="button" onClick="schoolZipCode()">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" readonly>
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS_DETAIL" id="SCHOOL_ADDRESS_DETAIL">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">휴대폰＊</span>
                                                <input class="input_size" type="number" name="PHONE" id="PHONE">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일＊</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL">
                                            </li>
                                            <li>
                                                <span class="list_t">지원영역</span>
                                                <select class="input_size" id="SUPPORT_AREA" name="SUPPORT_AREA">
                                                    <option>수학</option>
                                                    <option>영어</option>
                                                    <option>국어</option>
                                                </select>
                                            </li>

                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">집주소</span>
                                                    <input class="input_size" type="text" name="ZIPCODE" id="ZIPCODE" readonly>
                                                    <button type="button" onClick="ZipCode()">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="ADDRESS" id="ADDRESS" readonly>
                                                    <input class="input_address" type="text" name="ADDRESS_DETAIL" id="ADDRESS_DETAIL">
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
                                                <input class="input_size" type="text" name="PARENTS_NAME" id="PARENTS_NAME" />
                                            </li>
                                            <li>
                                                <span class="list_t">학생과의 관계</span>
                                                <input class="input_size" type="text" name="PARENTS_RELATION" id="PARENTS_RELATION" />
                                            </li>
                                            <li>
                                                <span class="list_t">연락처</span>
                                                <input class="input_size" type="number" name="PARENTS_PHONE" id="PARENTS_PHONE" />
                                            </li>
                                            <li>
                                                <span class="list_t">휴대폰</span>
                                                <input class="input_size" type="number" name="PARENTS_PHONE2" id="PARENTS_PHONE2" />
                                            </li>
                                        </ul>
                                    </div>
                                
                            </div>

                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="storage" href="javascript:insertClick()">저장하기</a>
                                    <a class="cancel" href="javascript:history.back()">취소하기</a>
                                </div>
                            </div>
                            <!--저장하기 버튼 end-->
                        </div>
                        </c:if>
                       <c:if test="${model.TYPE == '2'}"> 
                        <div class="sc_con" id="div_con2">

                            <div class="member_register_wrap">
                                    <div class="member_input_wrap">
                                        <ul class="member_input">
                                            <li>
                                                <span class="list_t">가입유형</span>
                                                <input type="radio" name="TYPE" id="student" value="1">
                                                <label for="student">학생</label>
                                                <input type="radio" name="TYPE" id="teacher" value="2" checked>
                                                <label for="teacher">교사</label>
                                            </li>
<!--                                             <li>
                                                <span class="list_t">구분</span>
                                                <input type="radio" name="TYPE_SUB" id="new" checked>
                                                <label for="new">신규</label>
                                                <input type="radio" name="TYPE_SUB" id="add">
                                                <label for="add">추가</label>
                                                <input type="radio" name="TYPE_SUB" id="basic">
                                                <label for="basic">추가2</label>
                                            </li>
 -->                                            <li>
                                                <span class="list_t">아이디＊</span>
                                                <input class="input_size" type="text" name="MEMBER_ID" id="MEMBER_ID" placeholder="아이디를 써주세요.">
                                                <button type="button" onClick="idCheck()">아이디중복검사</button>
                                                <span class="relate_c">영문자,숫자조합(6자 ~ 20자)</span>
                                            </li>
                                            <li>
                                                <span class="list_t">비밀번호＊</span>
                                                <input class="input_size mr" type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호를 써주세요.">
                                                <span class="relate_c">영문자,숫자조합,특수문자 조합(8자 ~ 20자)</span>
                                                <span class="relate_c span_none span_active">※ 특수조합을 같이 조합해주세요.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">비밀번호 확인＊</span>
                                                <input class="input_size" type="password" name="PASSWORD2" id="PASSWORD2">
                                                <span class="relate_c span_none span_active">※ 비밀번호가 동일하지 않습니다.</span>
                                                <span class="relate_c span_none">※ 비밀번호가 동일합니다.</span>
                                            </li>
                                            <li>
                                                <span class="list_t">이름＊</span>
                                                <input class="input_size mr" type="text" name="NAME" id="NAME" placeholder="한글">
                                                <input class="input_size mr" type="text" name="NAME_ENG" id="NAME_ENG" placeholder="영문">
                                                <input class="input_size mr" type="text" name="NAME_HANJA" id="NAME_HANJA" placeholder="한자">
                                                <!-- <input type="radio" name="name" id="name">
                                                <label class="relate_c" for="name">동명이인(성명+생년월일+성별 일치)</label> -->
                                            </li>
                                            <li>
                                                <span class="list_t">사진</span>
                                                
                                                <input type="file" id="file" name="file"/>
                                                <span class="relate_b">115px X 150px jpg, gif</span>
                                            </li>
                                            <li>
                                                <span class="list_t">시도명＊</span>
                                                <input class="input_size" type="text" name="ADDRESS_LOCAL" id="ADDRESS_LOCAL">
                                                <span class="relate_b">현재 거주하는 시,도명</span>
                                            </li>
                                            <li>
                                                <span class="list_t">소속학교명＊</span>
                                                <input class="input_size" type="text" name="SCHOOL_NAME" id="SCHOOL_NAME">
                                            </li>
                                            <li>
                                                <span class="list_t">직급＊</span>
                                                <input class="input_size mr-2" type="text" name="SCHOOL_JIGGEUB" id="SCHOOL_JIGGEUB">
                                            </li>
                                            <li>
                                                <span class="list_t">생년월일</span>
                                                <input class="input_size mr-2 datecalendar" type="text" name="BIRTH" id="BIRTH" placeholder="달력을 선택해주세요.">
                                                <!-- <a class="mr-3" href="#"><img src="${pageContext.request.contextPath}/resources/img/admin/calendar.png" alt="달력" /></a> -->
                                                <span class="list_t">성별</span>
                                                <input type="radio" name="SEX" value="남자" id="man" checked>
                                                <label for="man">남자</label>
                                                <input type="radio" name="SEX" value="여자" id="woman">
                                                <label for="woman">여자</label>
                                            </li>
                                            <li>
                                                <div class="address_01">
                                                    <span class="list_t">학교주소</span>
                                                    <input class="input_size" type="text" name="SCHOOL_ZIPCODE" id="SCHOOL_ZIPCODE" readonly>
                                                    <button type="button" onClick="schoolZipCode()">우편번호</button>
                                                </div>
                                                <div class="address_02">
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS" id="SCHOOL_ADDRESS" readonly>
                                                    <input class="input_address" type="text" name="SCHOOL_ADDRESS_DETAIL" id="SCHOOL_ADDRESS_DETAIL">
                                                </div>
                                            </li>
                                            <li>
                                                <span class="list_t">연락처＊</span>
                                                <input class="input_size" type="number" name="TEL" id="TEL">
                                            </li>
                                            <li>
                                                <span class="list_t">휴대폰＊</span>
                                                <input class="input_size" type="number" name="PHONE" id="PHONE">
                                            </li>
                                            <li>
                                                <span class="list_t">이메일</span>
                                                <input class="input_size" type="text" name="EMAIL" id="EMAIL">
                                            </li>
                                            <li>
                                                <span class="list_t">연수지명번호</span>
                                                <input class="input_size" type="text" name="AREA_NUMBER" id="AREA_NUMBER">
                                                <!-- <input type="checkbox" name="place_name" id="place_name">
                                                <label class="relate_c" for="name">체크시 활성화 됨</label> -->
                                            </li>
                                        </ul>
                                    </div>
                                
                            </div>
                            <!--저장하기 버튼-->
                            <div class="register_btn_area">
                                <div class="register_btn_con">
                                    <a class="storage" href="javascript:insertClick()">저장하기</a>
                                    <a class="cancel" href="javascript:history.back()">취소하기</a>
                                </div>
                            </div>
                            </c:if>
                            </form>
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
</body></html>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	 $("input:radio[name=TYPE]").click(function(){
	        if($("input[name=TYPE]:checked").val() == "1"){
	        	location.href='./insert.do?TYPE=1';
	        }else if($("input[name=TYPE]:checked").val() == "2"){
	        	location.href='./insert.do?TYPE=2';					
	        }
	        $("input[name=radio]:checked")
	    });
});
</script>
<script>

	function ZipCode()
	{
		new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	$('#ZIPCODE').val(data.sigunguCode);
	        	$('#ADDRESS').val(data.roadAddress);
	        }
	    }).open();	
	}
	function schoolZipCode()
	{
		new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	$('#SCHOOL_ZIPCODE').val(data.sigunguCode);
	        	$('#SCHOOL_ADDRESS').val(data.roadAddress);
	        }
	    }).open();	
	}
	var idchk  = false;
	function idCheck()
	{
		
		if(CheckPass($('#MEMBER_ID').val()) == false)
		{
			  alert("아이디는 영문 숫자 조합 7자리 ~ 20자리 입력 부탁 드립니다.");   // 넣고 싶은 메세지 넣으시면 됩니다~
			  return;
		}
		
		
		var URL = "${pageContext.request.contextPath}/user/member/idCheck.do?MEMBER_ID=" + $('#MEMBER_ID').val();
		
		$.ajax({
            url: URL,
            type: 'GET',
            success: function(result)
            {
            	console.log(result);
            	var s = result.indexOf("true");
				if(s != -1)
				{
					idchk = true;
					$('#MEMBER_ID').attr("readonly", true); 
					alert('사용가능합니다.');
					return;
				}else
				{
					alert('이미사용중입니다.');
					return;
				}
            }
        });  
	}
	function CheckPass(str)
	{
		   var reg1 = /^[a-z0-9]{7,20}$/;    // a-z 0-9 중에 7자리 부터 14자리만 허용 한다는 뜻이구요
		   var reg2 = /[a-z]/g;    
		   var reg3 = /[0-9]/g;
		   return(reg1.test(str) &&  reg2.test(str) && reg3.test(str));
	}
	function validatePassword(character) {
	    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{7,}$/.test(character)
	}
	function insertClick()
	{
	
		if(validatePassword($('#PASSWORD').val()) == false)
		{
			  alert("비밀번호는 영문, 숫자, 특수문자 조합 7자리 ~ 20자리 입력 부탁 드립니다.");   // 넣고 싶은 메세지 넣으시면 됩니다~
			  return;
		}
		if($('#PASSWORD').val() != $('#PASSWORD2').val())
		{
			  alert("입력된 비밀번호가 일치 하지 않습니다.");   // 넣고 싶은 메세지 넣으시면 됩니다~
			  return;
		}
		
		if(CheckPass($('#MEMBER_ID').val()) == false)
		{
			  alert("아이디는 영문 숫자 조합 7자리 ~ 20자리 입력 부탁 드립니다.");   // 넣고 싶은 메세지 넣으시면 됩니다~
			  return;
		}
		if(idchk == false)
		{
			alert('아이디 중복 검사 확인 부탁 드립니다.');
			return;
		}

		
		if(idchk == false)
		{
			alert('아이디 중복 검사 확인 부탁 드립니다.');
			return;
		}
		if($('#ADDRESS_LOCAL').val() == '')
		{
			alert('시도명을 입력 하여 주세요');
			return;
		}
		if($('#SCHOOL_NAME').val() == '')
		{
			alert('소속학교명 입력 하여 주세요');
			return;
		}
		
		
		if($('#NAME').val() == '')
		{
			alert('이름을 입력 하여 주세요');
			return;
		}
		
		if($('#PHONE').val() == '')
		{
			alert('연락처를 입력 하여 주세요');
			return;
		}
		
		$('#updateform').submit();
	}
	
</script>



	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_02.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_write.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/slider_sub.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

    <!--부트스트랩 js-->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>