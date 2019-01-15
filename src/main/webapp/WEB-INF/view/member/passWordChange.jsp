<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	

<head>
<script type="text/javascript">
$(document).ready(function() {
	  $("#change").on("click",function(){
		  if($("#mem_new_pass").val() != $("#memPass").val() && $("#memPass").val() != "" && $("#mem_new_pass").val() != "" ){
		        alert("새비밀번호 와 재확인이 일치하지 않습니다.확인해주세요.");
		        event.preventDefault();
		  }else if($("#mem_pass").val() == ""){
		         alert("현재비밀번호가 입력되지않았습니다. 입력후 진행해주세요");
		         event.preventDefault();
	      }else if($("#mem_new_pass").val() == ""){
	         alert("새비밀번호가 입력되지않았습니다.");
	         event.preventDefault();
	      }else if($("#memPass").val() == ""){
		         alert("새비밀번호 재확인이 입력되지않았습니다.");
	      }else {
	         $("#frm").submit();
	      }
		  
	  });
	  
		var msgNo = '${msgNo}';
		var msgOk = '${msgOk}';
		if(msgNo != ""){
			alert(msgNo);
		}
		if(msgOk != ""){
			alert(msgOk);
		}


	});
</script>
<style type="text/css">
.btn {
    width: 70px;
    border: 1px solid #ffe1af;
    border-width: 1px;
    border-bottom: 4px solid #e8a93f;
    text-transform: uppercase;
    background-color: white;
}
 .admin-title{
	max-width: 85%;
    min-width: 700px;
    float: left;
    margin: 0 auto;
    margin-top: 50px;
 }
</style>
</head>

<body>
	<!-- <div class="container-fluid">
		<div class="" align="center" > -->
		<div class="admin-title" align="center" >
			<%-- left --%>
			<!-- <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> -->
			<form action="/mypage/passChange" method="post" id="frm">
				<div class="blog-header">
					<h3>비밀번호 변경</h3>
					<hr>
				</div>
				<div class="form-group">
					 <label><input type="hidden" class="form-control" id="mem_email" name="mem_email" value="${memberVo.mem_email}" /> </label></br>
					<label><input type="password" class="form-control" id="mem_pass" name="mem_pass" placeholder="현재 비밀번호 입력" /> </label> 
				</div>
				<div class="form-group">
					<label>
							<input type="password" class="form-control" id="mem_new_pass" name="mem_new_pass" placeholder="새 비밀번호 입력" /> 
							<input type="password" class="form-control" id="memPass" name="memPass" placeholder="새 비밀번호 재확인" /> 
					</label>
				</div>
				</br>
				
				<div class="col-sm-offset-2 col-sm-10">
	     			<button type="submit" class="btn btn-default" id="change">변경</button>
				</div>
				
				</form>
			</div>
		<!-- </div> -->
	<!-- </div> -->
</body>
</html>
