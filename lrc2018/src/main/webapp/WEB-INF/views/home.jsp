<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<style>
.addQuestion {
	width: 100%;
	color: #333333;
	height: 180px;
	margin: 0 auto;
	overflow: hidden;
	padding: 10px 0;
	align-items: center;
	justify-content: space-around;
	display: flex;
	float: none;
}

.addQuestion1 {
	width: 100%;
	color: #333333;
	height: 60px;
	margin: 0 auto;
	overflow: hidden;
	padding: 10px 0;
	align-items: center;
	justify-content: space-around;
	display: flex;
	float: none;
}

div.box.ex {
	overflow: auto;
	height: 240px;
}

div, .content{
	overflow: auto;
}
</style>

<c:if test="${user==null}">
	<c:redirect url="user/login"></c:redirect>
</c:if>

<section class="content">
	<div class="box addQuestion1">
		<div class="col-sm-8 form-group-lg">
			<input type="hidden" name="num" id="num" /> 
			구역&nbsp;<select id="selectspace" style="width: 100px"></select>&nbsp;&nbsp;&nbsp;
			대분류&nbsp;<select id="separ_1" style="width: 100px"></select>&nbsp;&nbsp;&nbsp;
			<input type="button" id="reloadbtn" class="btn btn-primary" value="전체보기" />
			
		</div>
	</div>

	<div class="box">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-striped table-inverse">
				<tr class="success">
					<th>구역</th>
					<th>대분류</th>
					<th>중분류</th>
					<th>비고</th>
				</tr>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>

	<div class="box ex">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-striped table-inverse" id="datatable">
				<c:forEach var="job" items="${list}">
					<tr>
						<td>${job.space}</td>
						<td>${job.job_separ_1}</td>
						<td>${job.job_separ_2}</td>
						<td>${job.remark }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>

	<c:if test="${user!=null && user.grade=='관리자'}">
		<div class="addQuestion">
			<div class="col-sm-8 form-group-lg">
				<form id="insertform" action="job/insertjob" method="post">
					<table class="table">
						<tr>
							<td colspan="4" class="text-center">
								<h5 id="errormsg"></h5>
						</tr>
						<tr class="warning">
							<td>구역</td>
							<td>대분류</td>
							<td>중분류</td>
							<td>비고</td>
						</tr>
						<tr>
							<td><input type="text" id="space" name="space"
								required="required" /></td>
							<td><input type="text" id="job_separ_1" name="job_separ_1"
								required="required" /></td>
							<td><input type="text" id="job_separ_2" name="job_separ_2" /></td>
							<td><input type="text" id="remark" name="remark" /></td>
						</tr>
						<tr>
							<td colspan="4" class="text-center">
							<input type="button" id="insertbtn" class="btn btn-primary" value="작업 추가" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</c:if>
</section>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	document.getElementById("reloadbtn").addEventListener("click", function(){
		location.href="./";
	});	
	
	<c:if test="${user!=null && user.grade=='관리자'}">
	var insertspace = document.getElementById("space")
	var job_separ_1 = document.getElementById("job_separ_1")
	var job_separ_2 = document.getElementById("job_separ_2")
	var remark = document.getElementById("remark")

	var check = false;

	document.getElementById("insertbtn").addEventListener("click",function() {
			if (insertspace.value.length == 0 || job_separ_1.value.length == 0) {
					document.getElementById("errormsg").innerHTML = "구역이나 대분류는 필수입력입니다."
					document.getElementById("errormsg").style.color = "red"
					return;
			}
			$.ajax({
					url : "job/getjob_assignment",
					dataType : "json",
					data : {
						"space" : insertspace.value,
						"job_separ_1" : job_separ_1.value,
						"job_separ_2" : job_separ_2.value
					},
					success : function(data) {
						if (data.result == "true")
								document.getElementById("insertform").submit();
						else {
								document.getElementById("errormsg").innerHTML = "이미 존재하는 데이터입니다."
								document.getElementById("errormsg").style.color = "red"
							}
						}
					});

	})
	</c:if>

	var space = document.getElementById("selectspace")
	var separ_1 = document.getElementById("separ_1")
	var separ_2 = document.getElementById("separ_2")
	
	<c:forEach var="temp" items="${space}">
	var objOption = document.createElement("option");
	objOption.text = '${temp}';
	objOption.value = '${temp}';
	space.options.add(objOption);
	</c:forEach>

	var selectspace = function() {
		var val = space.options[space.selectedIndex].value;
		$.ajax({
			url : "job/getjob_separ_1",
			data : {
				"space" : val
			},
			success : function(data) {
				separ_1.innerHTML = "";
				var datatable = document.getElementById("datatable");
				datatable.innerHTML = "";
				var output ="";
				$.each(data, function(index, item) {
					var objOption = document.createElement("option");
					objOption.text = item.job_separ_1;
					objOption.value = item.job_separ_1;
					separ_1.options.add(objOption);
					
					output += "<tr>";
					output += "<td>" + item.space + "</td>";
					output += "<td>" + item.job_separ_1 +  "</td>";
					output += "<td>" + item.job_separ_2 + "</td>";
					output += "<td>" + item.remark + "</td>";
					output += "</tr>";
					
				});
				datatable.innerHTML = output;

			}
		});
	}
	
	var val = space.options[space.selectedIndex].value;
	$.ajax({
		url : "job/getjob_separ_1",
		data : {
			"space" : val
		},
		success : function(data) {
			separ_1.innerHTML = "";
			$.each(data, function(index, item) {
				var objOption = document.createElement("option");
				objOption.text = item.job_separ_1;
				objOption.value = item.job_separ_1;
				separ_1.options.add(objOption);
			});
		}
	});
	
	space.addEventListener("change", selectspace)
	
	separ_1.addEventListener("change", function(){
		var val1 = space.options[space.selectedIndex].value;
		var val2 = separ_1.options[separ_1.selectedIndex].value;
		$.ajax({
			url : "job/changejob_separ_1",
			data : {
				"space" : val1,
				"job_separ_1" : val2
			},
			success : function(data) {
				var datatable = document.getElementById("datatable");
				datatable.innerHTML = "";
				var output ="";
				$.each(data, function(index, item) {					
					output += "<tr>";
					output += "<td>" + item.space + "</td>";
					output += "<td>" + item.job_separ_1 +  "</td>";
					output += "<td>" + item.job_separ_2 + "</td>";
					output += "<td>" + item.remark + "</td>";
					output += "</tr>";
				});
				datatable.innerHTML = output;

			}
		});
	});

	
</script>



<%@include file="include/footer.jsp"%>
