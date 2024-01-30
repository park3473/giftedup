 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="kr"> <!--<![endif]-->
    <!-- start: HEAD -->
    <head>
      <%@ include file="../include/head.jsp" %> 
    <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
    </head>
    <!-- end: HEAD -->
    <body>
        <div
            id="app"><%-- 
            <!-- sidebar -->
          	<%@ include file="../include/menu.jsp" %> 
            <!-- / sidebar --> --%>
            <div
                class="app-content">
                <!-- start: TOP NAVBAR -->
				<%@ include file="../include/header.jsp" %> 

                <!-- end: TOP NAVBAR -->
                <div class="main-content">
                    <div
                        class="wrap-content container" id="container">
                        <!-- start: PAGE TITLE -->
                        <section id="page-title">
                            <div class="row">
                                <div class="col-sm-8">
                                    <h1 class="mainTitle">운영 감사 로그</h1>
                                </div>
                                <ol class="breadcrumb">
                                    <li>
                                        <span>HOME</span>
                                    </li>
                                    <li>
                                        <span>로그 관리</span>
                                    </li>                                    
                                    <li class="active">
                                        <span>운영 감사 로그</span>
                                    </li>
                                </ol>
                            </div>
                        </section>
                        <!-- end: PAGE TITLE -->
                        <div class="container-fluid container-fullw">
                            <div class="row">
                                <div class="col-md-12">
                                    <h5 class="over-title">
                                        <span class="text-bold">검색어</span>
                                    </h5>
                                    <div class="panel panel-white no-radius">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <p class="text-bold margin-top-25 margin-bottom-15">아이디</p>
                                                    <div class="form-group">
                                                        <input type="text" id="filter_col0" name="filter_col0" class="form-control" placeholder=""  value="${model.boforeDomain.MEMBER_ID}">
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <p class="text-bold margin-top-25 margin-bottom-15">생성일자</p>
                                                    <div class="input-group input-daterange datepicker">
                                                        <input type="text" class="form-control" id="filter_col1" name="filter_col1"  value="${model.boforeDomain.START_TM}">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <small>to</small>
                                                            </span>
                                                        </div>
                                                        <input type="text" class="form-control" id="filter_col2" name="filter_col2"  value="${model.boforeDomain.END_TM}">
														<div class="input-group-append">
															<!-- <button class="btn btn-primary"><i class="fa fa-search"></i> Search</button> -->
														</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- start: DYNAMIC TABLE -->
                        <div class="container-fluid container-fullw bg-white">
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-striped table-hover table-full-width" id="bootstrap-data-table">
					                    <thead>
					                      <tr>
					                      	<th>번호</th>
					                        <th>사용자 ID</th>
					                        <th>DEVICE</th>
					                        <th>URL</th>
					                        <th>METHOD</th>
					                        <th>PARAMETER</th>
					                        <th>IP</th>
					                        <th>생성날짜</th>
					                      </tr>
					                    </thead>
					                    <tbody>
					                     <c:forEach var="item" items="${model.list}" varStatus="status">
					                      <tr>
											<td>${status.index+1}</td>
					                        <td>${item.MEMBER_ID}</td>
					                        <td>${item.DEVICE}</td>
					                        <td>${item.URL}</td>
					                        <td>${item.METHOD}</td>
					                        <td>${fn:substring(item.PARAMETER,0,100)}<c:if test="${fn:length(item.PARAMETER) > 100}">...</c:if></td>
					                        <td>${item.IP}</td>
					                        <td>${fn:substring(item.CREATE_TM,0,19)}</td>
					                      </tr>
					                     </c:forEach>
					                    </tbody>
                                    </table>
                                    <!-- Button -->
                                    <p></p>
                                    <p class="float-right margin-right-15">
                                            </p>
                                    <!-- Button -->
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
            <!-- start: FOOTER -->
           <%@ include file="../include/footer.jsp" %>
           
            <!-- end: FOOTER -->
           <%@ include file="../include/footerJs.jsp" %> 
	</body>



<button type="button" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#smallmodal" id="smallmodelbtn" style="display: none;">Small</button>
<div class="modal fade" id="smallmodal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content" id="popup-content">
            
        </div>
    </div>
</div>

</html>


<script>

var selectid;
function deleteAccessClicked()
{
	var pram = "&page=" +dataTable.page() + "&search="+dataTable.search();
	var URL = "./delete.do?IDX="+selectid + pram;
	submit(URL, '');
	return false;
}
function insertAccessClicked()
{
	
	var pram = "page=" + dataTable.page() + "&search="+dataTable.search();
	
	var URL = './insert.do?'+pram;
	
	var formData = $("#updateform").serialize();

	submit(URL, formData);	
		
}

function submit(URL, formData)
{
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : formData,
		success: function(result)
		{
			if(result.indexOf("true") > -1)
			{
				alert('성공하였습니다.');
				$('.modal').click();
				window.location.reload();	
			}else
			{
				alert('실패 하였습니다.');
				$('.modal').click();
				
			}
		}
	});
}

function updateAccessClicked(menuidx, memberid)
{
	var pram = "&page=" +dataTable.page() + "&search="+dataTable.search();
	
	var URL = './update.do?'+pram
	var formData = $("#updateform").serialize();
	 console.log(formData);
	$("#updateform").attr("action", URL);

	submit(URL, formData);
	
}

function updateClick(id)
{
	selectid = id;
	var URL = id+'/update.do?';
	$.ajax({
        url: URL,
        type: 'GET',
        success: function(result)
        {
            $("#popup-content").html(result)
            $("#smallmodelbtn").click();
          
        }
    }); 
}

function insertClick(userid)
{
	var URL = './insert.do';
	$.ajax({
        url: URL,
        type: 'GET',
        success: function(result)
        {
            $("#popup-content").html(result)
            $("#smallmodelbtn").click();
          
        }
    }); 
	
}

$("#bootstrap-data-table tr").click(function(){     
    console.log($(this).data("id"));
    if($(this).data("role") == 'button')
    {
    	updateClick($(this).data("id"));
    }	    
});

</script>

<script type="text/javascript">

	var dataTable;
	window.onload  = function() {
   
		var repeat = setInterval( function () {
			var xpage = '${model.page}';
			if(xpage == '')
			{
				xpage = '0';
			}

			$('#bootstrap-data-table').DataTable().search( '${model.search}' ).draw();
			$('#bootstrap-data-table').DataTable().page(Number(xpage)).draw(false);
			dataTable = $('#bootstrap-data-table').DataTable();
			
			dataTable.columns(0).order('desc').draw();

			clearInterval(repeat);

		}, 1 );
		
	}
	
	
	$('#filter_col0').change(function(){
		var URL = './list.do?';
		URL = URL + "MEMBER_ID="+$('#filter_col0').val();
		URL = URL + "&START_TM="+$('#filter_col1').val();
		URL = URL + "&END_TM="+$('#filter_col2').val();
		location.href = URL;

        //filterColumn (1, $('#filter_col0').val());
        
    });
	
	
	$('#filter_col1').change(function(){
		var URL = './list.do?';
		URL = URL + "MEMBER_ID="+$('#filter_col0').val();
		URL = URL + "&START_TM="+$('#filter_col1').val();
		URL = URL + "&END_TM="+$('#filter_col2').val();
		location.href = URL;
			
		 //$('#bootstrap-data-table').DataTable().draw();
    });
	$('#filter_col2').change(function(){
		var URL = './list.do?';
		URL = URL + "MEMBER_ID="+$('#filter_col0').val();
		URL = URL + "&START_TM="+$('#filter_col1').val();
		URL = URL + "&END_TM="+$('#filter_col2').val();
		location.href = URL;
		// $('#bootstrap-data-table').DataTable().draw();
    });
	
	
	$.fn.dataTable.ext.search.push(
		    function( settings, data, dataIndex ) {
		    	var start =  $('#filter_col1').val();
		    	var end =  $('#filter_col2').val();
		    	
			    start = start.replace(/-/gi, '');
		    	start = start.replace(/:/gi, '');
		    	start = start.replace(/ /gi, '')
			    	
		    	end = end.replace(/-/gi, '');
		    	end = end.replace(/:/gi, '');
		    	end = end.replace(/ /gi, '')
			    	
		    	var datax = data[7].replace(/-/gi, '').substring(0,9 );
		    	datax = datax.replace(/:/gi, '');
		    	datax = datax.replace(/ /gi, '');

		        var age = parseFloat( datax ) || 0; // use data for the age column
		        
		        //console.log('start : ' + start);
			    //console.log('end : ' + end);
		        //console.log('data[6]  : ' + age );
		        
			    if(start == '' && end == '')
		    	{
		    		//console.log('push true');
		    		return true;
		    	}
			    
			    if(start == '' && end != '')
		    	{
			    	if ( age <= end ) 
			        {
			            return true;
			        }
		    	}
			    
			    if(start != '' && end == '')
		    	{
			    	if ( age >= start  ) 
			        {
			            return true;
			        }
		    	}
			    
		        if ( ( isNaN( start ) && isNaN( end ) ) ||
		             ( isNaN( start ) && age <= end ) ||
		             ( start <= age   && isNaN( end ) ) ||
		             ( start <= age   && age <= end ) )
		        {
		            return true;
		        }
		        return false;
		    }
		);
	
	function filterColumn (i, value) {
         console.log(value);
         $('#bootstrap-data-table').DataTable().column( i ).search(
             value, true, true
             ).draw();
     }
	
</script>
<script src="${pageContext.request.contextPath}/resources/admin/assets/js/form-elements.min.js"></script>
    <script>
    jQuery(document).ready(function() {
        FormElements.init()
    })
</script>
