<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<meta charset="UTF-8">


				<header class="navbar navbar-expand-lg navbar-light navbar-static-top">
                    <!-- start: NAVBAR HEADER -->
                    <div class="navbar-header">
                        <a href="#" class="sidebar-mobile-toggler float-left d-lg-none" class="btn btn-navbar sidebar-toggle" data-toggle-class="app-slide-off" data-toggle-target="#app" data-toggle-click-outside="#sidebar">
                            <i class="ti-align-justify"></i>
                        </a>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard/list.do">
                            <img src="${pageContext.request.contextPath}/resources/admin/assets/images/logo.png" alt="ClipTwo"/>
                        </a>
                        <a href="#" class="sidebar-toggler float-right d-none d-lg-block d-xl-block" data-toggle-class="app-sidebar-closed" data-toggle-target="#app">
                            <i class="ti-align-justify"></i>
                        </a>
                    </div>
                    <!-- end: NAVBAR HEADER -->
                    <div class="container-navbar-right">
                        <ul
                            class="navbar-right">
                            <!-- start: USER OPTIONS DROPDOWN -->
                            <li class="dropdown current-user d-none d-md-block d-lg-block d-xl-block">
                                <a href class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="${pageContext.request.contextPath}/resources/admin/assets/images/media-user.png" alt="Peter">
                                    <span class="username">${ssion_name}</span>
                                </a>
                            </li>
                            <!-- end: USER OPTIONS DROPDOWN -->
                        </ul>
                    </div>