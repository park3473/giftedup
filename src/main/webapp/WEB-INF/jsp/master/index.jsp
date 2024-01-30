<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
  <head>
	<%@ include file="./include/head.jsp" %>
  </head>

  <body>
  	<%@ include file="./include/menu.jsp" %>
  <div id="right-panel" class="right-panel">
        <!-- Header-->
		<%@ include file="./include/header.jsp" %><!-- /header -->
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            

                        </ol>
                    </div>
                </div>
            </div>
        </div>

		<!-- content -->
        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Basic </strong>
                                    <small>기본버튼
                                        <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code> or <code>&lt;input&gt;</code>
                                    </small>
                                </div>
                                <div class="card-body">
                                    <a role="button" class="btn btn-primary" href="">Primary</a>
                                    <a role="button" class="btn btn-secondary" href="">Secondary</a>
                                    <a role="button" class="btn btn-success" href="">Success</a>
                                    <a role="button" class="btn btn-danger" href="">Danger</a>
                                    <a role="button" class="btn btn-warning" href="">Warning</a>
                                    <a role="button" class="btn btn-info" href="">Info</a>
                                    <a role="button" class="btn btn-link" href="">Link</a>
									<div class="code">
										<pre><code><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-primary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-secondary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Secondary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-success"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Success<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-danger"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Danger<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-warning"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Warning<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-info"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Info<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-link"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Outline Buttons </strong>
                                    <small>아웃라인 버튼
                                        <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code> or <code>&lt;input&gt;</code>
                                    </small>
                                </div>
                                <div class="card-body">
                                    <a role="button" class="btn btn-outline-primary" href="">Primary</a>
                                    <a role="button" class="btn btn-outline-secondary" href="">Secondary</a>
                                    <a role="button" class="btn btn-outline-success" href="">Success</a>
                                    <a role="button" class="btn btn-outline-danger" href="">Danger</a>
                                    <a role="button" class="btn btn-outline-warning" href="">Warning</a>
                                    <a role="button" class="btn btn-outline-info" href="">Info</a>
                                    <a role="button" class="btn btn-outline-link" href="">Link</a>
									<div class="code">
										<pre><code><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-outline-primary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-outline-secondary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Secondary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-outline-success"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Success<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-outline-danger"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Danger<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-outline-warning"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Warning<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-outline-info"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Info<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-outline-link"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
				</div><!-- / row -->

                <div class="row">
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Small Button </strong>
                                    <small>클래스에 btn-sm 추가
                                        <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code> or <code>&lt;input&gt;</code>
                                    </small>
                                </div>
                                <div class="card-body">
                                    <a role="button" class="btn btn-sm btn-primary" href="">Primary</a>
                                    <a role="button" class="btn btn-sm btn-secondary" href="">Secondary</a>
                                    <a role="button" class="btn btn-sm btn-success" href="">Success</a>
                                    <a role="button" class="btn btn-sm btn-danger" href="">Danger</a>
                                    <a role="button" class="btn btn-sm btn-warning" href="">Warning</a>
                                    <a role="button" class="btn btn-sm btn-info" href="">Info</a>
                                    <a role="button" class="btn btn-sm btn-link" href="">Link</a>
									<div class="code">
										<pre><code><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-sm btn-primary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-sm btn-secondary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Secondary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-sm btn-success"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Success<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-sm btn-danger"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Danger<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-sm btn-warning"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Warning<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-sm btn-info"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Info<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-sm btn-link"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Large Button </strong>
                                    <small>클래스에 btn-lg 추가
                                        <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code> or <code>&lt;input&gt;</code>
                                    </small>
                                </div>
                                <div class="card-body">
                                    <a role="button" class="btn btn-lg btn-primary" href="">Primary</a>
                                    <a role="button" class="btn btn-lg btn-secondary" href="">Secondary</a>
                                    <a role="button" class="btn btn-lg btn-success" href="">Success</a>
                                    <a role="button" class="btn btn-lg btn-danger" href="">Danger</a>
                                    <a role="button" class="btn btn-lg btn-warning" href="">Warning</a>
                                    <a role="button" class="btn btn-lg btn-info" href="">Info</a>
                                    <a role="button" class="btn btn-lg btn-link" href="">Link</a>
									<div class="code">
										<pre><code><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-primary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-secondary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Secondary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-success"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Success<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-danger"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Danger<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-warning"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Warning<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-info"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Info<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-lg btn-link"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
				</div><!-- / row -->

                <div class="row">
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Block Level Buttons </strong>
                                    <small>전체 사이즈 버튼, 클래스에 btn-block 추가
                                        <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code> or <code>&lt;input&gt;</code>
                                    </small>
                                </div>
                                <div class="card-body">
                                    <a role="button" class="btn btn-block btn-primary" href="">Primary</a>
                                    <a role="button" class="btn btn-block btn-secondary" href="">Secondary</a>
                                    <a role="button" class="btn btn-block btn-success" href="">Success</a>
                                    <a role="button" class="btn btn-block btn-danger" href="">Danger</a>
                                    <a role="button" class="btn btn-block btn-warning" href="">Warning</a>
                                    <a role="button" class="btn btn-block btn-info" href="">Info</a>
                                    <a role="button" class="btn btn-block btn-link" href="">Link</a>
									<div class="code">
										<pre><code><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-primary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-secondary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Secondary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-success"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Success<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-danger"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Danger<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-warning"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Warning<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-info"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Info<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-link"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Block Level Outline Buttons </strong>
                                    <small>전체 사이즈 아웃라인 버튼, 클래스에 btn-block 추가
                                        <code>&lt;a&gt;</code>, <code>&lt;button&gt;</code> or <code>&lt;input&gt;</code>
                                    </small>
                                </div>
                                <div class="card-body">
                                    <a role="button" class="btn btn-block btn-outline-primary" href="">Primary</a>
                                    <a role="button" class="btn btn-block btn-outline-secondary" href="">Secondary</a>
                                    <a role="button" class="btn btn-block btn-outline-success" href="">Success</a>
                                    <a role="button" class="btn btn-block btn-outline-danger" href="">Danger</a>
                                    <a role="button" class="btn btn-block btn-outline-warning" href="">Warning</a>
                                    <a role="button" class="btn btn-block btn-outline-info" href="">Info</a>
                                    <a role="button" class="btn btn-block btn-outline-link" href="">Link</a>
									<div class="code">
										<pre><code><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-outline-primary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Primary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-outline-secondary"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Secondary<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-outline-success"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Success<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-outline-danger"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Danger<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-outline-warning"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Warning<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-outline-info"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Info<span class="nt">&lt;/a&gt;</span><br><span class="nt">&lt;a</span> <span class="na">class=</span><span class="s">"btn btn-block btn-outline-link"</span> <span class="na">href=</span><span class="s">"링크URL"</span> <span class="na">role=</span><span class="s">"button"</span><span class="nt">&gt;</span>Link<span class="nt">&lt;/a&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
				</div><!-- / row -->

                <div class="row">
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Unorder List </strong>
                                    <small>가장 기본적인 순서 없는 목록</small>
                                </div>
                                <div class="card-body">
									<ul class="list">
										<li>List Sample 01</li>
										<li>List Sample 02</li>
										<li>List Sample 03</li>
										<li>List Sample 04</li>
										<li>List Sample 05</li>
									</ul>
									<div class="code">
										<pre><code><span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"list"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 01<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 02<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 03<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 04<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 05<span class="nt">&lt;/li&gt;</span>
<span class="nt">&lt;/ul&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Order List </strong>
                                    <small>가장 기본적인 순서 있는 목록</small>
                                </div>
                                <div class="card-body">
									<ol class="list">
										<li>List Sample 01</li>
										<li>List Sample 02</li>
										<li>List Sample 03</li>
										<li>List Sample 04</li>
										<li>List Sample 05</li>
									</ol>
									<div class="code">
										<pre><code><span class="nt">&lt;ol</span> <span class="na">class=</span><span class="s">"list"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 01<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 02<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 03<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 04<span class="nt">&lt;/li&gt;</span>
  <span class="nt">&lt;li</span><span class="nt">&gt;</span>List Sample 05<span class="nt">&lt;/li&gt;</span>
<span class="nt">&lt;/ol&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
				</div><!-- / row -->

                <div class="row">
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Basic Table </strong>
                                    <small>기본 테이블</small>
                                </div>
                                <div class="card-body">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">제목</th>
												<th scope="col">담당자</th>
												<th scope="col">완료일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>기본 테이블 양식입니다.</td>
												<td>홍길동</td>
												<td>0000-00-00</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>기본 테이블 양식입니다.</td>
												<td>이영희</td>
												<td>0000-00-00</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>기본 테이블 양식입니다.</td>
												<td>김철수</td>
												<td>0000-00-00</td>
											</tr>
										</tbody>
									</table>
									<div class="code">
										<pre><code><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;thead&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>#<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>제목<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>담당자<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>완료일<span class="nt">&lt;/th&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
  <span class="nt">&lt;/thead&gt;</span>
  <span class="nt">&lt;tbody&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"row"</span><span class="nt">&gt;</span>1<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>기본 테이블 양식입니다.<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>홍길동<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>0000-00-00<span class="nt">&lt;/td&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"row"</span><span class="nt">&gt;</span>1<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>기본 테이블 양식입니다.<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>이영희<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>0000-00-00<span class="nt">&lt;/td&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"row"</span><span class="nt">&gt;</span>1<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>기본 테이블 양식입니다.<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>김철수<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>0000-00-00<span class="nt">&lt;/td&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
  <span class="nt">&lt;/thead&gt;</span>
<span class="nt">&lt;/table&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
					
					<div class="col-xs-12 col-lg-6">
						<div class="card">
                                <div class="card-header">
                                    <strong>Stripped Table </strong>
                                    <small>행 음영이 있는 테이블</small>
                                </div>
                                <div class="card-body">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">제목</th>
												<th scope="col">담당자</th>
												<th scope="col">완료일</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>기본 테이블 양식입니다.</td>
												<td>홍길동</td>
												<td>0000-00-00</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>기본 테이블 양식입니다.</td>
												<td>이영희</td>
												<td>0000-00-00</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>기본 테이블 양식입니다.</td>
												<td>김철수</td>
												<td>0000-00-00</td>
											</tr>
										</tbody>
									</table>
									<div class="code">
										<pre><code><span class="nt">&lt;table</span> <span class="na">class=</span><span class="s">"table table-striped"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;thead&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>#<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>제목<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>담당자<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"col"</span><span class="nt">&gt;</span>완료일<span class="nt">&lt;/th&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
  <span class="nt">&lt;/thead&gt;</span>
  <span class="nt">&lt;tbody&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"row"</span><span class="nt">&gt;</span>1<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>기본 테이블 양식입니다.<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>홍길동<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>0000-00-00<span class="nt">&lt;/td&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"row"</span><span class="nt">&gt;</span>1<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>기본 테이블 양식입니다.<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>이영희<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>0000-00-00<span class="nt">&lt;/td&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
    <span class="nt">&lt;tr&gt;</span>
      <span class="nt">&lt;th</span> <span class="na">scope=</span><span class="s">"row"</span><span class="nt">&gt;</span>1<span class="nt">&lt;/th&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>기본 테이블 양식입니다.<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>김철수<span class="nt">&lt;/td&gt;</span>
      <span class="nt">&lt;td</span><span class="nt">&gt;</span>0000-00-00<span class="nt">&lt;/td&gt;</span>
    <span class="nt">&lt;/tr&gt;</span>
  <span class="nt">&lt;/thead&gt;</span>
<span class="nt">&lt;/table&gt;</span></code></pre>
									</div>
                             </div>
                        </div><!-- /# card -->
					</div>
				</div><!-- / row -->

				<div class="row">
					<div class="col-lg-12" style="margin-bottom: 20px; text-align: center;">
						<img src="${pageContext.request.contextPath}/resources/images/partdb_ad.jpg" alt="partdb"></a>
					</div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

    <!-- Right Panel -->
  
  
  <%@ include file="./include/footer.jsp" %>
  </body>
  
</html>
  <%@ include file="./include/footerjs.jsp" %>
<!--  Chart js -->
