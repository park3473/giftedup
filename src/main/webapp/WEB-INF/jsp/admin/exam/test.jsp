<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/head.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css"> 
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ckeditor필요한 부분 -->
<script src="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor2/ckeditor.css">
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<style>
	/*admin css 와 ckeditor css 충돌나서 바꿔버림*/
	.member_input_wrap .member_input button {
    margin-left: 0px !important;
	}
	.member_input_wrap .member_input textarea {
    	width: 100%;
    	height: 100%;
    	padding: 0px;
    }


    /* 설문폼 */
	.survey_wrap{margin: 0 auto;width:80%}
	.survey_wrap li{float:left}
	.survey_wrap input{height:50px;border:1px rgba(0,0,0,.3) solid;border-radius:5px;margin-bottom:20px;padding-left:10px;font-size:15px;color:#555}
	.survey_wrap textarea{border:1px rgba(0,0,0,.3) solid;border-radius:5px;padding:10px;font-size:15px;color:#555}
	.survey_wrap select{height:50px;border:1px rgba(0,0,0,.3) solid;border-radius:5px;margin-bottom:10px;padding-left:10px;font-size:15px;color:#555}
	.survey_wrap .box_01{background:#fff;border:1px rgba(0,0,0,.3) solid;padding:30px 30px 25px;font-size:15px;color:#555;border-radius:5px;width:75%;margin-right:15px;margin-bottom:50px;box-shadow: 0 0 10px #ccc;}
	.survey_wrap .select_cont{background:#fff;border:1px rgba(0,0,0,.3) solid;padding:10px;font-size:15px;color:#555;border-radius:5px;display:none;margin-bottom:20px}
	.survey_wrap .input_100{width:100%}
	.survey_wrap .input_70{width:70%}
	.survey_wrap .input_30{width:28%;float:right}
    
	.survey_wrap .btn_01{background:#009dc4;display:inline-block;padding:3px 30px;border-radius:5px;color:#fff;font-weight:bold}
	.survey_wrap .btn_02{background:#687693;display:inline-block;padding:3px 30px;border-radius:5px;color:#fff;font-weight:bold}
	.survey_wrap .btn_03{background:#f4f4f4;display:inline-block;padding:3px 30px;border-radius:5px;font-weight:bold;margin-left:12px;border:1px rgba(0,0,0,.3) solid}
	.survey_wrap .btn_04{background:#009dc4;padding:3px 30px;border-radius:5px;color:#fff;font-weight:bold;text-align:center}




</style>




<!-- ckeditor필요한 부분 -->




<body>
<!--헤더-->
    <%@ include file="../include/header.jsp" %>
<!--헤더 end-->


<!--본문-->
<section id="adm_sc">
<div id="adm_sc_area">
    <div id="adm_sc_con">
        <div class="adm_sc_size">

            <!--본문 내용-->
            <section class="adm_sc_txt">
            <!-- 폼 -->
            <div class="survey_wrap">
                <form id="" action="" method="">
                <!-- 내용1 -->
                <ul>
                    <li class="box_01">
                    <input type="text" name="" value="" id="" class="input_100" placeholder="설문제목입력">
                    <textarea name="" id="" rows="3" class="input_100">설문조사 설명입력</textarea>
                    </li>
                    <li>
                    <input type="submit" value="설문저장" id="" accesskey="" class="btn_01">
                    <input type="submit" value="설문시작" id="" accesskey="" class="btn_02">
                    </li>
                </ul>
                <!-- 내용1끝 -->

                <!-- 내용2 -->
                <ul>
                    <li class="box_01">
                    <input type="text" name="" value="" id="" class="input_70" placeholder="질문내용">
                    <select id="survey_select" class="input_30">
                    <option value="">--- 유형선택 ---</option>
                    <option value="survey_01">객관식</option>
                    <option value="survey_02">체크박스</option>
                    <option value="survey_03">답변형</option>
                    </select>
                    <div id="type_01" class="select_cont">
                        유형_01
                    </div>
                    <div id="type_02" class="select_cont">
                        유형_02
                    </div>
                    <input type="text" name="" value="" id="" class="input_70" placeholder="답변"> <input type="submit" value="삭제" id="" accesskey="" class="btn_03">
                    <input type="text" name="" value="" id="" class="input_70" placeholder="답변"> <input type="submit" value="삭제" id="" accesskey="" class="btn_03">

                    <input type="submit" value="추가하기" id="" accesskey="" class="input_70 btn_04">

                    </li>
                    <li>
                    <input type="submit" value="추가하기" id="" accesskey="" class="btn_01">
                    <input type="submit" value="삭제하기" id="" accesskey="" class="btn_02">
                    </li>
                </ul>
                <!-- 내용2 끝 -->
                </form>
            </div>
			<!-- 폼끝 -->
            </section>
            <!--본문 내용 end-->
        </div>
    </div>
</div>
</section>
<!--본문 end-->




<!--푸터-->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
<!--푸터 end-->

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>



</body>
</html>
<script type="module" >
</script>
<script type="text/javascript">
$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(6).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(6).css({
	    backgroundColor: "#fff"
	});
});

//유형선택
$('#survey_select').on('change', function() {
  if(this.value == "survey_01") {
  } else {
  }
});
</script>
