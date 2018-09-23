<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대표건설</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.comrespond/1.4.2respond.min.js"></script>
    <![endif]-->
<style>

.main-footer {
    position:absolute;
    bottom:0;
    width:100%;
    height:50px;   
    background:#ccc;

}
</style>
</head>

<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.js"></script>
<body >
	<div class="wrapper">

				<h1 align="center"><img
						src="${pageContext.request.contextPath}/resources/images/logo.jpg" /></h1>
				<c:if test="${user!=null}">
					<span class="badge">${user.name}접속 중</span> &nbsp;&nbsp;<a
						href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
				</c:if>
	</div>

	<aside class="main-sidebar">
		<section class="sidebar">
			<ul class="nav nav-tabs">
				<c:if test="${user==null}">
					<li role="presentation" class="active"><a
						href="${pageContext.request.contextPath}/user/login">로그인</a></li>
					<li role="presentation" class="active"><a
						href="${pageContext.request.contextPath}/user/register">회원가입</a></li>
				</c:if>
				<c:if test="${user!=null}">
					<li role="presentation" class="active"><a
						href="${pageContext.request.contextPath}/">메인페이지</a></li>
					<c:if test="${user.grade=='관리자'}">	
					<li role="presentation" class="active"><a
						href="${pageContext.request.contextPath}/user/management">회원관리</a></li>
					</c:if>
				</c:if>
			</ul>
		</section>
	</aside>
	<div>