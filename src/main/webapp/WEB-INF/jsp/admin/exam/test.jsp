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

	.select_li{width:100%}


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
                <ul id="eaxm_ul">
                    <li class="box_01">
                    <input type="text" name="" value="" class="input_100" placeholder="설문제목입력" id="examTitle">
                    <textarea name="" rows="3" class="input_100" placeholder="설문조사 설명입력" id="examContent"></textarea>
                    </li>
                    <li>
                    <input type="button" id="examSave" value="설문저장" id="" accesskey="" class="btn_01">
                    <input type="button" value="설문시작" id="" accesskey="" class="btn_02">
                    </li>
                </ul>
                <!-- 내용1끝 -->

                <!-- 내용2 -->
                <ul id="question_ul_0" class="question">
                    <li class="box_01">
                    <input type="hidden" name="type" value="1" id="" class="input_70 questionType">
                    <input type="text" name="" value="" id="" class="input_70 questionText" placeholder="질문내용">
                    <select id="survey_select" class="input_30 survey_select">
                    <option value="survey_01">객관식</option>
                    <option value="survey_02">체크박스</option>
                    <option value="survey_03">답변형</option>
                    </select>
                    <ul class="select_box">
                    	<li class="select_li">
							<input type="text" class="input_70 answerText" placeholder="답변"> <input type="button" value="삭제" class="btn_03">
						</li>
					</ul>
                    <input type="button" value="추가하기" id="" accesskey="" class="input_70 btn_04 select_plus">

                    </li>
                    <li>
                    <input type="button" value="추가하기" id="" accesskey="" class="btn_01 question_plus">
                    <input type="button" value="삭제하기" id="" accesskey="" class="btn_02 question_delete">
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

$(document).ready(function() {
    // 답변 유형 변경 이벤트 핸들러
    $(document).on('change', '.survey_select', function() {
	    var type = $(this).val(); // 선택된 답변 유형
	    var selectBox = $(this).closest('li.box_01').find('.select_box');
	    var selectType = $(this).closest('li.box_01').find('input[name=type]');
	    selectBox.empty(); // 기존의 답변 입력 필드를 초기화합니다.
		console.log(type);
	    switch (type) {
	        case 'survey_01': // 객관식
	            selectBox.append('<li class="select_li"><input type="text" class="input_70 answerText" placeholder="답변"> <input type="button" value="삭제" class="btn_03"></li>');
	        	selectType.val('1');
	            $(this).siblings('.select_plus').show();
	            break;
	        case 'survey_02': // 체크박스
	            selectBox.append('<li class="select_li"><input type="text" class="input_70 answerText" placeholder="답변"> <input type="button" value="삭제" class="btn_03"></li>');
	            selectType.val('2');
	            $(this).siblings('.select_plus').show();
	            break;
	        case 'survey_03': // 답변형
	            selectBox.append('<li class="select_li"><input type="text" class="input_70" placeholder="답변형" readonly="readonly"></li>');
	            selectType.val('3');
	            $(this).siblings('.select_plus').hide();
	            break;
	        default:
	            $(this).siblings('.select_plus').hide();
	    }
	});

    // 답변 추가 기능
    $(document).on('click', '.select_plus', function(event) {
	    event.preventDefault();
	    var $questionContainer = $(this).closest('li.box_01');
	    var $selectBox = $questionContainer.find('.select_box');
	    var type = $questionContainer.find('input[name="type"]').val(); // 현재 질문의 유형 가져오기
	
	    // type 값에 따라 적절한 답변 필드 추가
	    if (type === '1') { // 객관식
	        $selectBox.append('<li class="select_li"><input type="text" class="input_70 answerText" placeholder="답변"> <input type="button" value="삭제" class="btn_03"></li>');
	    } else if (type === '2') { // 체크박스
	        $selectBox.append('<li class="select_li"><input type="text" class="input_70 answerText" placeholder="답변"> <input type="button" value="삭제" class="btn_03"></li>');
	    } else if (type === '3') { // 답변형
	        $selectBox.append('<li class="select_li"><input type="text" class="input_70" placeholder="답변형" readonly="readonly" ></li>');
	    }
	});

    // 답변 삭제 기능
    $(document).on('click', '.btn_03', function() {
        //$(this).prev('input').remove(); // 인접한 답변 필드 삭제
        $(this).closest('li.select_li').remove();
        $(this).remove(); // 삭제 버튼 자체도 삭제
    });

    // 질문 추가 기능
    $(document).on('click', '.question_plus', function(event) {
        event.preventDefault();
        var newQuestionIndex = $('.survey_wrap').children('ul').length; // 현재 질문의 개수를 기반으로 새 인덱스를 생성합니다.
        // 새로운 질문 섹션을 추가합니다. 여기서는 간단한 예시로 하나의 질문 필드만 추가합니다.
        $('.survey_wrap').append(`
            <ul id="question_ul_`+newQuestionIndex+`" class="new_question question">
                <li class="box_01">
                <input type="hidden" name="type" value="1" id="" class="input_70 questionType">
                <input type="text" name="" value="" class="input_70 questionText" placeholder="질문내용">
                <select class="input_30 survey_select">
                    <option value="survey_01">객관식</option>
                    <option value="survey_02">체크박스</option>
                    <option value="survey_03">답변형</option>
                </select>
                <ul class="select_box">
                <li class="select_li">
                	<input type="text" class="input_70 answerText" placeholder="답변"> <input type="button" value="삭제" class="btn_03">
				</li>
				</ul>
	            <input type="button" value="추가하기" id="" accesskey="" class="input_70 btn_04 select_plus">
                </li>
                <li>
                <input type="button" value="질문 추가" class="btn_01 question_plus">
                <input type="button" value="삭제하기" class="btn_02 question_delete">
                </li>
            </ul>
        `);
    });

    // 질문 삭제 기능
    $(document).on('click', '.question_delete', function() {
        $(this).closest('ul').remove(); // 해당 질문 섹션 삭제
    });
    
    $('#examSave').click(function() {
        // 1. 입력 검사
        var title = $('#examTitle').val(); // 설문 제목
        var description = $('#examContent').val(); // 설문 설명
        if (!title || !description) {
            alert('설문 제목과 설명을 입력해주세요.');
            return;
        }

        // 각 질문의 빈공간 확인
        var questionsValid = true;
        $('.question').each(function() {
            var questionText = $(this).find('.questionText').val(); // 질문 내용
            if (!questionText) {
                questionsValid = false;
                return false; // 반복 중지
            }
            // 답변형을 제외한 답변의 빈공간 확인
            if ($(this).find('.questionType').val() !== 'survey_03') {
                $(this).find('.answerText').each(function() {
                    if (!$(this).val()) {
                        questionsValid = false;
                        return false; // 반복 중지
                    }
                });
            }
        });

        if (!questionsValid) {
            alert('모든 질문과 답변을 입력해주세요.');
            return;
        }

        var surveyData = {
            title: title,
            description: description,
            questions: []
        };

        // 각 질문 및 답변 수집
        $('.question').each(function() {
            var questionText = $(this).find('.questionText').val();
            var questionType = $(this).find('.questionType').val();
            var answers = [];

            $(this).find('.answerText').each(function() {
                answers.push($(this).val());
            });

            surveyData.questions.push({
                title: questionText,
                type: questionType,
                answers: answers
            });
        });
        
        console.log(surveyData)
        
        
    });
    
});





</script>

