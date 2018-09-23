<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<style>
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}

.myform{
	margin:0 auto;
	width:400px;
	padding:14px;
}

#stylized{
	border:solid 2px #b7ddf2;
	background:#ebf4fb;
}
#stylized h1 {
	font-size:16px;
	font-weight:bold;
	margin-bottom:8px;
	font-family:nanumgothic,dotum;

}
#stylized p{
	font-size:11px;
	color:#666666;
	margin-bottom:20px;
	border-bottom:solid 1px #b7ddf2;
	padding-bottom:10px;
	font-family:dotum;
}
#stylized label{
	display:block;
	font-weight:bold;
	text-align:right;
	width:140px;
	float:left;
	font-family:tahoma;
}
#stylized .small{
	color:#666666;
	display:block;
	font-size:11px;
	font-weight:normal;
	text-align:right;
	width:140px;
	font-family:dotum;
	letter-spacing:-1px;
}
#stylized input, select{
float:left;
font-size:12px;
padding:4px 2px;
border:solid 1px #aacfe4;
width:200px;
margin:2px 0 20px 10px;
}
#stylized button{
clear:both;
margin-left:150px;
width:125px;
height:31px;
text-align:center;
line-height:31px;
background-color:#000;
color:#FFFFFF;
font-size:11px;
font-weight:bold;
font-family:tahoma;
}


</style>

<section class="content" >
<div id="stylized" class="myform">
<form id="form" name="form" method="post" autocomplete="off">
<h1>작업 등록</h1>

<label>대분류
<span class="small">필수 입력</span>
</label>
<input type="text" name="job_level_b" id="job_level_b" required="required" placeholder="대분류를 입력하세요" />

<label>중분류
<span class="small">필수 입력</span>
</label>
<input type="text" name="job_level_m" id="job_level_m" required="required" placeholder="중분류를 입력하세요" />

<label>소분류
<span class="small">생략 가능</span>
</label>
<input type="text" name="job_level_s" id="job_level_s"  placeholder="소분류를 입력하세요" />

<label>비고
<span class="small">생략 가능</span>
</label>
<input type="text" name="remark" id="remark"  placeholder="비고를 입력하세요" />

<button type="button" id="save">작업등록</button>
<div class="spacer"></div>

</form>
</div>


</section>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<div id="dialog-confirm" title="회원가입" style="display:none">
  <p id="data"><span class="ui-icon ui-icon-person" style="float:left; margin:12px 12px 20px 0;"></span></p>
</div>
<script>
	document.getElementById("save").addEventListener("click", function(e){
		var msg = "<span class='ui-icon ui-icon-person' style='float:left; margin:12px 12px 20px 0;'></span>"
		var level_b = document.getElementById("job_level_b");
		var level_m = document.getElementById("job_level_m");
		var level_s = document.getElementById("job_level_s");
		var remark = document.getElementById("remark");
		
		var data = document.getElementById("data")
		
		$.ajax({
			url:"getjob_assignment",
			data:{"job_level_b":level_b.value,"job_level_m":level_m.value,"job_level_s":level_s.value },
			success:function(r){
				if(r.result == "true"){
					data.innerHTML = msg + "대분류:" + level_b.value +"<br/>중분류:" +   level_m.value + 
					"<br/>소분류:" + level_s.value + "<br/>비고:" +remark.value + "<br/>삽입하고자 하는 데이터가 맞으면 추가를 누르세요 "
					$("#dialog-confirm" ).dialog({
					      resizable: false,
					      height: "auto",
					      width: 400,
					      modal: true,
					      buttons: {
					        "취소": function() {
					          $( this ).dialog( "close" );
					        },
					        "추가": function() {
					        	  document.getElementById("form").submit();
						          $( this ).dialog( "close" );
						        }
					      }
					    });
				}else{
					data.innerHTML = msg +  "이미 존재하는 데이터입니다. <br/> 다시 입력하세요!!"
					$("#dialog-confirm" ).dialog({
					      resizable: false,
					      height: "auto",
					      width: 400,
					      modal: true,
					      buttons: {
					        "닫기": function() {
					          $( this ).dialog( "close" );
					        }
					      }
					    });
				}
			}
		});
		
		
	})
</script>
<%@include file="../include/footer.jsp"%>
			