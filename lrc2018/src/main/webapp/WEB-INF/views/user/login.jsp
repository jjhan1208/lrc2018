<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}
</style>

	<c:if test="${insert != null }">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
	    $("#dialog-confirm" ).dialog({
	      resizable: false,
	      height: "auto",
	      width: 400,
	      modal: true,
	      buttons: {
	        "닫기": function() {
	          $( this ).dialog( "close" );
	        },
	      }
	    });
	  } );
	</script>
</c:if>
<div id="dialog-confirm" title="회원가입" style="display:none">
  <p><span class="ui-icon ui-icon-person" style="float:left; margin:12px 12px 20px 0;"></span>
  회원가입에 성공하셨습니다.이제 로그인하고 사용하시면 됩니다.</p>
</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post">
						<legend>로그인</legend>
						<div style='color: red'>${msg}</div>
						<div class="form-group">
							<label for="username-email">아이디</label> <input type="text"
								name="id" id="id" required="required"
								placeholder="아이디를 입력하세요" class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								name="pw" id="pw" placeholder="비밀번호를 입력하세요" class="form-control" 
								required="required"/>
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-primary btn-login-submit btn-block m-t-md"
								value="로그인" />
							
							<input type="button"
								class="btn btn-primary btn-login-submit btn-block m-t-md"
								value="가입여부확인" />
							<input type="button"
								class="btn btn-primary btn-login-submit btn-block m-t-md"
								value="비밀번호찾기" />
							
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

<%@include file="../include/footer.jsp"%>
			