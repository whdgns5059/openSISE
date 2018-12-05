<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
.logo{
	margin: 150px 0 50px 250px;
	padding: 20px 400px 20px 500px;
	width: 1303px;
}
.button{
	margin : 100px 0 20px 100px;
	width:300px ;
	height:200px ;
}	

#buttons{
	margin : 0 0 20px 0;
	width:220px ;
}	


</style>
</head>
<body>
<!-- 전체 contents div -->
<div class="row" style="height: 850px !important">
	<!-- logo -->
		<div class="logo" >
			<img src="/img/snail.png"  />
			<img src="/img/openSise.png"  alt="오픈시세" title="오픈시세!" />
			
		<!-- button -->
		<form action="/board/login" method="post">
		<div class="button">
			<input id="buttons" type="submit" class="btn btn-outline-primary"
			value="OpenSisy Login" />
			<a id="kakao-login-btn"></a>
		<script type='text/javascript'>
			//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('d2593e4538f34f3286be7900f8ec3e47');
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					alert(JSON.stringify(authObj));
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
			//]]>
		</script>
		
			
		</div>
		</form>
		</div>
		
</div>
</body>
</html>