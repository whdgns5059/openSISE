<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- 전체 contents div -->
<div class="contents">
	<!-- logo -->
		<div class="logo" >
			<img src="/img/snail.png"  />
			<img src="/img/openSise.png"  alt="오픈시세" title="오픈시세!" />
			
		<!-- button -->
		<form action="/login/login" method="post">
		<div class="button">
			<input id="buttons" type="submit" class="btn btn-outline-primary"
			value="OpenSise Login" />
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
							console.log(res);
							
							var userID = res.id;						//유저의 카카오톡 고유 id
							var userEmail = res.kaccount_email;			//유저의 이메일
							var userNickName = res.properties.nickname;	//유저가 등록한 별명
							
							console.log(userID);
							console.log(userEmail);
							console.log(userNickName);
						},
						fail: function(error) {
							alert(JSON.stringify(error));
						}
					});


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
