<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

  			 <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">엑셀 업로드</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" >
            
             
               		<form action="./insert.do?page=${model.page}&search=${model.search}" modelAttribute="AdminMemberVo" method="post" name="updateform" id="updateform" class="form-horizontal form-label-left" enctype="multipart/form-data">
             	   <table id="bootstrap-data-table" class="table table-striped table-bordered">
  					  <input type="hidden" NAME="csrf" value="${CSRF_TOKEN}" />
                      <!-- hidden -->
						<tr class="table-active">
							<td>필드</td>
							<td>데이터</td>
						</tr>
						<tr>
							<td>엑셀 파일</td>
							<td>
								<input type="file" NAME="file" ID="file" value="" class="form-control"/>
							</td>
						</tr>
						</table>
					</form>
            
 			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-green" onClick="excelAccessClicked();">추가</button>
            </div>
 
          
             