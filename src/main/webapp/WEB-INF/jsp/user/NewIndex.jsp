 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <!DOCTYPE html>
 <html lang="ko">
 <style>
     .swal2-container {
         z-index: 9999 !important;
     }

     .swal2-styled.swal2-confirm {
         height: auto !important;
     }

 </style>

 <head>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" type="text/css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newIndex.css" type="text/css">
     <link rel="preconnect" href="https://fonts.gstatic.com">
     <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <%@ include file="./include/head.jsp" %>
 </head>


 <body>

     <!-- 본문 -->
     <section id="info_index" class="info_index_wrap">
         <div class="info_index_area">
             <div class="info_index_con">
                 <div class="info_index_bg">
                     <div class="info_index_size">
                         <div class="info_title_box">
                             <div class="info_title_ob">
                                 <span><img src="${pageContext.request.contextPath}/resources/img/logo_on.png" alt="로고"></span>
                             </div>
                         </div>
                         <div class="info_list_con">
                             <ul class="info_list_box">
                                 <li class="info_list_ob info_list_ob_01">
                                     <a href="${pageContext.request.contextPath}/index.do">
                                         <span><img src="${pageContext.request.contextPath}/resources/img/info_icon_01.png" alt="홈페이지"></span>
                                         <h2>
                                             영재키움프로젝트<br>
                                             <span>홈페이지</span>
                                         </h2>
                                         <p>바로가기</p>
                                     </a>
                                 </li>
                                 <li class="info_list_ob info_list_ob_02">
                                     <a href="${pageContext.request.contextPath}/user/member_re/check.do">
                                         <span><img src="${pageContext.request.contextPath}/resources/img/info_icon_02.png" alt="신입생선발소개"></span>
                                         <h2>
                                             영재키움프로젝트<br>
                                             <span>신규 참가자 지원</span>
                                         </h2>
                                         <p>바로가기</p>
                                     </a>
                                 </li>
                                 <li class="info_list_ob info_list_ob_03">
                                     <a href="${pageContext.request.contextPath}/user/member_re/new_inquiry.do">
                                         <span><img src="${pageContext.request.contextPath}/resources/img/info_icon_03.png" alt="선발지원서조회"></span>
                                         <h2>
                                             영재키움프로젝트<br>
                                             <span>선발 지원서 조회</span>
                                         </h2>
                                         <p>바로가기</p>
                                     </a>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
         <!--인포푸터-->
         <footer id="info_footer" class="info_footer_wrap">
             <div class="info_footer_area">
                 <div class="info_footer_con">
                    <div class="info_txt_box">
                        <div class="info_ft_lt">
                            <h2>대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트 과학영재교육연구원(34051)</h2>
                            <p>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</p>
                        </div>
                        <div class="info_ft_gt">
                            <p>TEL : 042-350-6227</p>
                            <p>FAX : 042-350-6224</p>
                            <p>EMAIL : giftedup@kaist.ac.kr</p>
                        </div>
                    </div>
                 </div>
             </div>
         </footer>
         <!--인포푸터 end-->
     </section>
     <!--본문 end-->




 </body>
 <script type="text/javascript">
     function wrap_insert() {
         Swal.fire({
             text: "지원 후 지원조회는 지원하고 24시간 이후에 가능합니다.",
             icon: 'success',
             showCancelButton: false,
             confirmButtonColor: '#3085d6',
             confirmButtonText: 'Yes!'
         }).then((result) => {
             if (result.isConfirmed) {
                 location.href = "http://geu.myds.me/LimeSurvey/index.php?r=survey/index&sid=526688&newtest=Y&lang=ko"
             }
         })
     }

 </script>

 </html>
