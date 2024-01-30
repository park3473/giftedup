<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-migrate-3.0.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/slider.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/printThis.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>



<!--부트스트랩 js-->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>

<script>
    function content_print() {
        /*
        var initBody = document.body.innerHTML;
        window.onbeforeprint = function(){
        document.body.innerHTML = document.getElementById('new_sub').innerHTML;
        }
        window.onafterprint = function(){
        document.body.innerHTML = initBody;
        }*/
        window.print();
    }

    $('input[type="text"]').keydown(function() {
        if (event.keyCode === 13) {
            event.preventDefault();
        };
    });

    function fileDown(url) {
        //window.open('about:blank').location.href = url;
        window.open('about:blank').location.href = '${pageContext.request.contextPath}/fileDown.do?PATH=' + url;


    }

    function btnAlert() {
        alert("동의하지 않을경우 이용이 불가능합니다.");
        return;
    }
</script>