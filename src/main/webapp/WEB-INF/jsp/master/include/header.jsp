<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	


   <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right" style="width:100%;margin: 9px 20px 0 0; width: 30px;">
                        <!--a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/resources/images/admin.png" alt="User Avatar">
                        </a-->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fa fa-user" style="font-size: 35px;"></i>
                        </a>
                        <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="${pageContext.request.contextPath}/master/member/view.do"><i class="fa fa- user"></i>My info</a>
                                <a class="nav-link" href="${pageContext.request.contextPath}/master/member/logout.do"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>

                    <div class="language-select dropdown" id="language-select">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown"  id="language" aria-haspopup="true" aria-expanded="true">
                       		<i class="flag-icon flag-icon-${ssion_langage}"></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="language" >
                        
                            <c:forEach var="item" items="${seion_langageList}" varStatus="status">
                            <div class="dropdown-item">
                                <span onclick="location.href='${pageContext.request.contextPath}/master/member/langageAccess.do?langage=${item.TITLE}'" class="flag-icon flag-icon-${item.TITLE}"></span>
                            </div>
                            </c:forEach>

                            
                        </div>
                    </div>

                </div>
            </div>

        </header>
        
        