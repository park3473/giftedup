<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.treeview.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/screen.css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script src="//cdn.ckeditor.com/4.6.2/full/ckeditor.js"></script>

	
	
<script language="JavaScript">

//현재 페이지
//$('#bootstrap-data-table').DataTable().page()

//다음페이지
//$('#bootstrap-data-table').DataTable().page( 'next' ).draw( 'page' );

//페이지이동
//$('#bootstrap-data-table').DataTable().page( 1 ).draw( false );

//검색어
//$('#bootstrap-data-table').DataTable().search( 'a' ).draw();


	var selectidx = '';
	function deleteAccessClicked()
	{

		
		
		var pram = "&page=" +dataTable.page() + "&search="+dataTable.search();
		
		var URL = "./delete.do?idx="+selectidx + parm;
		$.ajax({
            url: URL,
            type: 'GET',
            success: function(result)
            {
            	alert('게시판이 삭제 되었습니다.')
            	$('.modal').click();
            	window.location.reload();
            }
	    }); 
		
		//location.href = url;
		return false;
	}
	function insertAccessClicked()
	{
		var pram = "page=" + dataTable.page() + "&search="+dataTable.search();
		
		var URL = './insertAccess.do?'+pram;
		var formData = $("#updateform").serialize();
		 
		
		
		
		
		document.updateform.submit();
	}
	
	function updateAccessClicked(menuidx, memberid)
	{
		if($('#CHECK_SECRET_WRITING').val() == 1)
		{
			if($('#TYPE').val() != 0)
			{
				alert("비밀글은 일반 게시판에서만 사용이 가능합니다.");
				return;
			}
		}
		
		if ($("#TITLE").val() == "") 
		{
			alert("메뉴 명을 입력 하여 주세요");
			return;
		}
		
		var pram = "page=" + $('#bootstrap-data-table').DataTable().page() + "&search="+$('#bootstrap-data-table').DataTable().search();
		
		var URL = './updateAccess.do?'+pram
		var formData = $("#updateform").serialize();
		 
		$("#updateform").attr("action", URL);

		
		document.updateform.submit();
	}
	
	function updateClick(idx)
	{
		selectidx = idx;
		var URL = './update.do?idx='+idx;
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
	
	
	
</script>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
  <head>
	
	<%@ include file="../include/head.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css">
	
  </head>

  <body>
  	<%@ include file="../include/menu.jsp" %>
  
  <!-- /#right-panel -->
  <div id="right-panel" class="right-panel">

        <!-- Header-->
		<%@ include file="../include/header.jsp" %><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>홈페이지권한</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                             <li><a href="#">권한관리</a></li>
                            <li><a href="#">게시판 관리</a></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

		<div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">리스트</strong>
                        </div>
                        <div class="card-body" id="table-content">
							 <table id="bootstrap-data-table" class="table table-striped table-bordered">
		                    <thead>
		                      <tr>
		                        <th>TITLE</th>
		                        <th>MEMO</th>
		                        <th>TYPE</th>
		                        <th>비고</th>
		                        
		                      </tr>
		                    </thead>
		                    <tbody>

		                     <c:forEach var="item" items="${model.List}" varStatus="status">
		                      <tr id="table_tr_${item.IDX}">
		                        <td>${item.TITLE}</td>
		                        <td>${item.MEMO}</td>
		                        <td>
		                        <c:forEach var="item2" items="${model.NOTICES_TYPE}" varStatus="status">
									<c:choose>
									<c:when test="${item.TYPE == item2.TITLE }">
										${item2.NAME}
									</c:when>
									<c:otherwise>
									</c:otherwise>
									</c:choose>
								</c:forEach>
		                        </td>
		                        
		                        <td> 								
								<button class="btn btn-success btn-sm" onClick="updateClick('${item.IDX}')" value="수정">수정</button>
								<!--input class="btn btn-outline-success" onClick="updateClick('${item.IDX}')" value="수정"--></td>
		                      </tr>
		                     </c:forEach>
		                    </tbody>
		                  </table>
						  <div class="col-sm-12 col-md-12 right" style="margin-top:20px;">
							<button type="submit" class="btn btn-primary btn-sm right"  onClick="insertClick('${item.ID}')" value="추가">추가</button>
						  </div>
		                  <!--input class="btn btn-outline-success" onClick="insertClick('${item.ID}')" value="추가"-->
                        </div>
                    </div>
                </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->
    <!-- Right Panel -->
        <script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	    
		<script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/jszip.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/pdfmake.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/vfs_fonts.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.html5.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.print.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/data-table/datatables-init.js"></script>
	    
	   

  </body>
</html>

<button type="button" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#smallmodal" id="smallmodelbtn" style="display: none;">Small</button>
<div class="modal fade" id="smallmodal" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" id="popup-content">
            
        </div>
    </div>
</div>

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
			clearInterval(repeat);

		}, 1 );
		
	}
</script>

