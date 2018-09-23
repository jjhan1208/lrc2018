<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
p, h1, form, button {
	border: 0;
	margin: 0;
	padding: 0;
}

.spacer {
	clear: both;
	height: 1px;
}

.myform {
	margin: 0 auto;
	width: 400px;
	padding: 14px;
}

#stylized {
	border: solid 2px #b7ddf2;
	background: #ebf4fb;
}

#stylized h1 {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 8px;
	font-family: nanumgothic, dotum;
}

#stylized p {
	font-size: 11px;
	color: #666666;
	margin-bottom: 20px;
	border-bottom: solid 1px #b7ddf2;
	padding-bottom: 10px;
	font-family: dotum;
}

#stylized label {
	display: block;
	font-weight: bold;
	text-align: right;
	width: 140px;
	float: left;
	font-family: tahoma;
}

#stylized .small {
	color: #666666;
	display: block;
	font-size: 11px;
	font-weight: normal;
	text-align: right;
	width: 140px;
	font-family: dotum;
	letter-spacing: -1px;
}

#stylized input, select {
	float: left;
	font-size: 12px;
	padding: 4px 2px;
	border: solid 1px #aacfe4;
	width: 200px;
	margin: 2px 0 20px 10px;
}

#stylized button {
	clear: both;
	margin-left: 150px;
	width: 125px;
	height: 31px;
	text-align: center;
	line-height: 31px;
	background-color: #000;
	color: #FFFFFF;
	font-size: 11px;
	font-weight: bold;
	font-family: tahoma;
}
</style>

<section class="content">
	<div id="stylized" class="myform">
		<form id="form" name="form" method="post" autocomplete="off">
			<h1>회원가입</h1>
			<div id="errormsg" class="text-center"></div>
			<label>아이디 <span class="small">아이디 입력</span></label> 
			<input type="text" name="id" id="id" required="required" /> 
			<label>비밀번호<span class="small">패스워드 6자 이상</span></label> 
			<input type="password" name="pw" id="pw" required="required" /> 
			<label>비밀번호확인 <span class="small">패스워드 6자 이상</span></label> 
			<input type="password" id="pwcheck" required="required" /> 
			<label>이름<span class="small">이름입력</span></label> 
			<input type="text" name="name" id="name" required="required" /> 
			<label>이메일<span class="small">이메일 입력</span></label> 
			<input type="email" name="email" id="email" required="required" />
			<label>전화번호<span class="small">휴대폰 번호(-빼고 입력)</span></label> 
			<input type="text" name="phone" id="phone" maxlength="11" pattern="^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$" required="required" /> 
			<label>권한 <span class="small">권한선택</span></label> 
			<select name="grade">
				<option value="일반사원">일반사원</option>
				<option value="사외이사">사외이사</option>
			</select>

			<button type="submit">회원가입</button>
			<div class="spacer"></div>
		</form>
	</div>
</section>

<script>
	var idcheck = false;
	var ids = document.getElementById("id")
	var errormsg = document.getElementById("errormsg");

	document.getElementById("id").addEventListener("blur", function() {
		$.ajax({
			url : "idcheck",
			data : {
				"id" : ids.value
			},
			dataType : "json",
			success : function(data) {
				if (data.result == "true") {
					errormsg.innerHTML = "<h5>사용 가능한 아이디입니다.</h5>";
					errormsg.style.color = "blue"
					idcheck = true;
				} else {
					errormsg.innerHTML = "<h5>이미 사용 중인 아이디입니다.</h5>";
					errormsg.style.color = "red"
					idcheck = false;
				}
			}
		});
	});
	document.getElementById("form").addEventListener("submit", function(e) {
		var event = e || window.event;
		if (idcheck == false) {
			errormsg.innerHTML = "<h5>아이디를 다시 확인하세요</h5>";
			errormsg.style.color = "red"
			event.preventDefault();
		}
		var pw1 = document.getElementById("pw").value;
		var pw2 = document.getElementById("pwcheck").value;
		if (pw1.length < 6) {
			errormsg.innerHTML = "<h5>비밀번호는 6자 이상입니다.</h5>";
			errormsg.style.color = "red"
			event.preventDefault();
		}
		if (pw1 != pw2) {
			errormsg.innerHTML = "<h5>2개의 비밀번호가 다릅니다.</h5>";
			errormsg.style.color = "red"
			event.preventDefault();
		}
	});
</script>


<%@include file="../include/footer.jsp"%>











