<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="js/jquery-3.3.1.min.js"></script>
<!-- Custom styles for this template -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
 div {
 border : 1px solid red;
 }
</style>

</head>
<body>
<!-- navbar시작 -->
	<nav class="navbar navbar-expand-lg" style="margin-bottom: 0px !important">
	<!-- openSISE아이콘 -->
		<a class="navbar-brand" href="#">
			<img alt=""
			src="logo/openSise_logo.png" width="50">
		</a>
	<!-- nav items -->
		<div class="collapse navbar-collapse" id="navbarColor01" >
			<ul class="navbar-nav mr-auto" style="height: 50px !important;" >
				<li class="nav-item active">
					<a class="nav-link" href="#"></a>	
				</li>
				
				
			</ul>
	<!-- 오른쪽 상단 배치// 예: 로그인, 회원가입등 -->
			<div class="form-inline my-2 my-lg-0" >
				<ul class="navbar-nav mr-auto" style="height: 50px !important;" >
					<li class="nav-item"><a class="nav-link" href="#"></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
<!-- navbar끝 -->

	<!-- 모바일에서 컬럼들이 하나는 꽉찬너비로, 다른 하나는 절반너비로 쌓이게 합니다 -->
	<!-- 전체 contents div -->
	<div class="row" style="height:600px !important">
	<!-- left contents -->
		<div class="col-xs-12 col-md-8" style="padding-right: 0 !important">
	
			<!-- map -->
			<div class="jumbotron" style="width: 1030px; height:100%;" id="map" >
				
			</div>
		</div>
	<!-- right contents -->	
		<div class="col-xs-6 col-md-4" style="padding-left: 0 !important">
			
		</div>
	</div>

<!-- footer -->
	<footer class="footer">
		<div class="container" style="height: 70px !important;">
			<div style="height: 50px; width: 400px; float: right; margin-top: 8px;"></div>
		</div>
	</footer>
</body>
</html>