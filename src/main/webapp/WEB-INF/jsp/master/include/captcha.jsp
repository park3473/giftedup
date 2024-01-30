<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="box captcha">
     <div class="loading"></div>
     <!-- // .loading -->

     <label for="captcha">자동 방지 코드</label>
     <input type="text" id="captcha" name="captcha" autocomplete="off" required />
     <img src="${pageContext.request.contextPath}/captcha.do" id="captchaImg" alt="캡차 이미지" title="클릭시 새로고침" />
</div>
        
<script>
    var $captchaLoader = $("#writeForm .box.captcha .loading");
    var $captchaImg = $("#writeForm .box.captcha img");
 
    
    // captcha 새로고침
    $("#captchaImg").click(function() {
        $captchaLoader.show();
        $(this).attr("src", "${pageContext.request.contextPath}/captcha.do?ran=" + Math.random());
        $captchaLoader.fadeOut(500);
    });
</script>