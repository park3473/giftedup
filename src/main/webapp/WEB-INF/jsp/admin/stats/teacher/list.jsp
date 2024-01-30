 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../../include/head.jsp" %> 
</head>

<body>
    <!--헤더-->
	<%@ include file="../../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문 end-->
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
                                <span>교사 통계</span>
                            </div>
                            <div class="stats_main">
                                <div class="stats_main_left">
                                    <div class="member_02_wrap">
                                        <form class="stats_main_left_select">
                                            <select id="selectBox">
                                                <option value="./list.do" selected>시도별</option>
                                                <!-- <option value="./schoolType.do">학교급</option> -->
                                                <option value="./sex.do">성별</option>
                                                <!-- <option value="./school_group.do">학년별</option> -->
                                            </select>
                                        </form>
                                    </div>
                                    <div class="stats_main_left_cart">
                                        <div id="piechart" style="width: 100%; height: 500px;"></div>
                                    </div>
                                </div>
                                <div class="stats_main_right">
                                    <div class="table_wrap">
                                        <table id="table">
                                            <tr>
                                                <th>순번</th>
                                                <th>도시명</th>
                                                <th>회원수(명)</th>
                                                <th>비율(%)</th>
                                            </tr>
                                            <c:forEach var="item" items="${model.list}" varStatus="status">
									         <tr>
                                                <td class="td_01">${status.index+1 }</td>
                                                <td class="td_02">${item.ADDRESS_LOCAL}</td>
                                                <td class="td_03">${item.CNT}</td>
                                                <td class="td_04">${fn:substring(item.PER,0,3)}%</td>
                                            </tr>
									        	</c:forEach>
									        	
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="adm_btn_wrap">
                                <ul>
                                    <li class="register">
                                        <a href="javascript:excelDown()">엑셀출력</a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </section>

                </div>
            </div>
        </div>
    </section>
    <!--푸터-->
    <footer>
	<%@ include file="../../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/starts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/jquery.datetimepicker.full.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery.table2excel.js" type="text/javascript"></script>
</body></html>


<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
        	['시도', '학생 수'],
        	<c:forEach var="item" items="${model.list}" varStatus="status">
        	['${item.ADDRESS_LOCAL}',     ${item.CNT}],
        	</c:forEach>
        ]);

        var options = {
//          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    
    $("#selectBox").change(function(){
    	    var val =  $(this).val();
    	    location.href = val;
    	    console.log(val);
    })


    	
	function excelDown()
	{
    	 $("#table").table2excel({
             name: "Excel table",
             filename: "excel table",
             fileext: ".xls",
             exclude_img: true,
             exclude_links: true,
             exclude_inputs: true
         });
	}
	


</script>