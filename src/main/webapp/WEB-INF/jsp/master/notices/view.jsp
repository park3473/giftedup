<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
  <head>
	<%@ include file="../include/head.jsp" %>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- menu -->
		<%@ include file="../include/menu.jsp" %>
		<!-- menu -->
        <!-- top navigation -->
		<%@ include file="../include/top.jsp" %>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>아이템 관리</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  
                </div>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_content">

                    <form class="form-horizontal form-label-left" novalidate>

                      <span class="section">상세페이지</span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">게시판 명<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <label class="control-label">${model.TITLE}</label>
    				    </div>
                      </div>
					   <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">내용<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">${model.MEMO}</label>
    				    </div>
                       </div>

					   <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">게시판종류<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<label class="control-label">
                        		
                        		
								<c:forEach var="item" items="${model.NOTICES_TYPE_LIST}" varStatus="status">
									<c:choose>
									<c:when test="${model.TYPE == item.TITLE }">
										${item.NAME}
									</c:when>
									<c:otherwise>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							
							</label>
    				    </div>
                       </div>
					   <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">사용여부<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.USE_KEY == '0' }">
									  사용안함
								</c:when>
								<c:otherwise>
									   사용
								</c:otherwise>
							</c:choose></label>
    				    </div>
                       </div>                       
					   <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">게시판 쓰기 권한<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label">
							<c:choose>
								<c:when test="${model.WRITE_LEVEL == '11' }">
									  비회원
								</c:when>
								<c:when test="${model.WRITE_LEVEL == '10' }">
									  등록회원
								</c:when>
								<c:otherwise>
								<c:forEach var="item" items="${model.CONFIGLEVELLIST}" varStatus="status">
									<c:choose>
									<c:when test="${model.WRITE_LEVEL == item.TITLE }">
										${item.NAME}
									</c:when>
									<c:otherwise>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								</c:otherwise>
							</c:choose>
							</label>
    				    </div>
                       </div>
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">게시판 읽기 권한<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.READ_LEVEL == '11' }">
									  비회원
								</c:when>
								<c:when test="${model.READ_LEVEL == '10' }">
									  등록회원
								</c:when>
								<c:otherwise>
								<c:forEach var="item" items="${model.CONFIGLEVELLIST}" varStatus="status">
									<c:choose>
									<c:when test="${model.READ_LEVEL == item.TITLE }">
										${item.NAME}
									</c:when>
									<c:otherwise>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								
								</c:otherwise>
							</c:choose>
							</label>
    				    </div>
                       </div>
                                          
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">자동 글쓰기 방지<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_CAPTCHA == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>
    				    </div>
                       </div>
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">비밀글<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_SECRET_WRITING == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>							
    				    </div>
                       </div>
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">파일업로드<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_FILEUPLOAD == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>							
    				    </div>
                       </div>
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">공지사항<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_FIRSTTURN == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>						
    				    </div>
                       </div>
                       
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">답글<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_REPLY == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>							
    				    </div>
                       </div>
                       
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">댓글<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_COMMENT == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>							
    				    </div>
                       </div>
                       
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">파일 업로드 사이즈<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							 ${model.CHECK_FILEUPLOADFILESIZE}
    				    </div>
                       </div>
                       
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">링크<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_LINK == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>
    				    </div>
                       </div> 
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">예약접수 사용<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<label class="control-label"><c:choose>
								<c:when test="${model.CHECK_RECEPTION == '1' }">
									  사용
								</c:when>
								<c:otherwise>
									   사용안함
								</c:otherwise>
							</c:choose></label>
    				    </div>
                       </div>                        
                       
                       
                                                                                                                                                                                       
                       
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">파일 업로드 숫자<span class="required">*</span>   </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							 <label class="control-label">${model.CHECK_FILEUPLOADCOUNT}</label>
    				    </div>
                       </div>
                                              
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                        <div class="pull-left">
                          <button class="btn btn-primary" type="button" onClick="location.href='./list.do?search=${model.search}&page=${model.page}'">이전</button>
                        </div>
                        <div class="pull-right">
                          <button class="btn btn-success" type="button" onClick="location.href='./update.do?idx=${model.IDX}&page=${model.page}&search=${model.search}'">수정</button>
                        </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

      </div>
    </div>
    
        <%@ include file="../include/footer.jsp" %>
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Custom Theme Scripts -->
    
  </body>
</html>	


