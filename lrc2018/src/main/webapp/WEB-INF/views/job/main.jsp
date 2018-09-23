<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section class="content">
	<h3>${jobmsg}</h3>
	<div class="box">
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<table class="table table-striped table-inverse">
	<tr class="success">
		<th class="text-center">대분류</th>
		<th class="text-center">중분류</th>
		<th class="text-center">소분류</th>
		<th class="text-center">비고</th>
	</tr>	
<c:forEach var="job" items="${list}">
<tr>
		<td>${job.job_level_b }</td>
		<td>${job.job_level_m }</td>
		<td>${job.job_level_s }</td>
		<td>${job.remark }</td>
	</tr>	
</c:forEach>
</table>
		<c:if test="${user!=null && user.grade=='관리자'}">
			<input type="button"  class="btn btn-primary" value="추가" id="insert" />
		</c:if>
	</div>
	<div class="col-md-3"></div>
	</div>
</section>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	document.getElementById("insert").addEventListener("click", function(){
		location.href = "insertjob";
	})
</script>


<%@include file="../include/footer.jsp"%>
