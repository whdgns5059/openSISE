<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
.logo{
	margin: 100px 0 50px 200px;
	padding: 20px 400px 20px 150px;
	width: 250px;
}
.button{
	margin : 80px 0 20px 17px;
	width:200px ;
	height:200px ;
}	

#buttons{
	margin : 0 0 20px 0;
	width:220px ;
}	


</style>
<!-- 전체 contents div -->
<div class="contents"style="text-align: center ">
	<!-- logo -->
		<div class="logo" >
			<img src="/img/snail.png"  />
			<img src="/img/openSise.png"  alt="오픈시세" title="오픈시세!" />
			
		<!-- button -->
		<form action="/login/login" method="post">
		<div class="button">
			<input id="buttons" type="submit" class="btn btn-outline-primary" value="OpenSise Login" />
			<a id="kakao-login-btn"></a>
		<script type='text/javascript'>
			//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('d2593e4538f34f3286be7900f8ec3e47');
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					// 로그인 성공시, API를 호출합니다.
					Kakao.API.request({
						url: '/v1/user/me',
						success: function(res) {
							alert(res.properties.nickname+'님 로그인되었습니다.');
							location.href="/login/kakao?mem_nm="+res.properties.nickname;
						},
						fail: function
						(error) {
							alert(JSON.stringify(error));
						}
					});
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
			function ktout(){
				Kakao.Auth.logout(function(){
					setTimout(function(){
						location.href="/login/kakao"
					},1000); // 로그아웃 처리되는 타임을 임시적으로 설정 (1초)
				});
			}
			//]]>
		</script>
		</div>
		</form>
		</div>
		
</div>
