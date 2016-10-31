<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
		String flag = (String) request.getAttribute("flag");
		if(flag != null) {
		    out.println("<script type='text/javascript'>");
			if(!flag.equals("1")) {
				out.println("alert('죄송합니다. 서버상의 문제로 가입에 실패했습니다.');");
			} else { 
				 out.println("alert('회원가입에 성공했습니다')");
				 out.println("location.href='login_view.member?redirect="+ request.getParameter("redirect")+"'");
			}
			out.println("</script>");
			
		}
%>


<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>TraBaB - 회원가입</title>



	<!-- Google -->
	<meta name="google-signin-scope" content="profile email">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://apis.google.com/js/api:client.js"></script>
	<!-- Naver -->	
	<script type="text/javascript" src="/trabab/resources/assets/js/naverLogin_implicit-1.0.2.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>



    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<!-- JS Global Compulsory -->           
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
	<!-- JS Implementing Plugins -->           
	<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/backstretch/jquery.backstretch.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
	<!-- JS Page Level -->           
	<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>
	
	<script src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/js/plugins/datepicker.js"></script>
	
	
    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/style.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/animate.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    
    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/page_log_reg_v2.css">    

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    
    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/headers/header-default.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/footers/footer-v1.css">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">	
	<style type="text/css">
		.note{
			height: 20px;
			text-align: center;
		}
	</style>
	<script type="text/javascript">
	    var nickname_check = false;
	    var email_check = false;
	    var pwd_check = false;
	    jQuery(document).ready(function() {
	       
	    	App.init();
	        Datepicker.initDatepicker();
	        $.backstretch([
			    "/trabab/resources/assets/img/bg/19.jpg",
			    "/trabab/resources/assets/img/bg/18.jpg",
			    ],
			    {
			         fade: 1000,
			         duration: 7000
				}
			);
	        $('#member_nickname').blur(function(){
	            $.ajax({
		           	url:'./check_nickname.member',
		           	type: 'post',
		           	data: {
		           		member_nickname : $('#member_nickname').val()
		           	},
		           	dataType: 'json',
		           	success: function(data) {
		   	             if (data['flag'] == 0) {
		   	            	$('#idchk').html("사용 할 수 있는 ID 입니다").css('color', 'blue');
		   	            	nickname_check = true;
		   	            } else {
		   	            	$('#idchk').html("사용 할 수 없는 ID 입니다").css('color', 'red');
		   	            	nickname_check = false;
		   	            }	
		           	},
		           	error: function(data) {
		           		alert("fail");
		           	}
	           })
	       });
	   	
		   	$('#member_email').blur(function(){
	            $.ajax({
		           	url:'check_email.member',
		           	type: 'post',
		           	data: {
		           		member_email : $('#member_email').val()
		           	},
		           	dataType: 'json',
		           	success: function(data) {
		   	             if (data['flag'] == 0) {
		   	            	$('#emailchk').html("사용 할 수 있는 EMAIL 입니다").css('color', 'blue');
		   	            	email_check = true;
		   	            } else {
		   	            	$('#emailchk').html("사용 할 수 없는 EMAIL 입니다").css('color', 'red');
		   	            	email_check = false;
		   	            }	
		           	},
		           	error: function(data) {
		           		alert("fail");
		           	}
	           })
	       });
		   	
			
	    });
	    
	    function passchk(){
			var pass = document.form.member_password.value;
			var pass2 = document.form.passwordok.value;
			if (pass2.length == 0 || pass2 == null) {
				$('#passchk').html("비밀번호를 입력하세요.").css('color', 'red');
				pwd_check = false;
			} else if (pass != pass2) {
				$('#passchk').html("비밀번호가 다릅니다.").css('color', 'red');
				pwd_check = false;
			} else {   
				$('#passchk').html("비밀번호가 동일합니다.").css('color', 'blue');
				pwd_check = true;
			}
			return;
		}

		function passchk2(){
			var pass = document.form.member_password.value;
			var pass2 = document.form.passwordok.value;
			if (pass.length == 0 || pass == null) {
				$('#passchk').html("비밀번호를 입력하세요.").css('color', 'red');
				pwd_check = false;
			} else if (pass != pass2) {
				$('#passchk').html("비밀번호가 다릅니다.").css('color', 'red');
				pwd_check = false;
			} else {   
				$('#passchk').html("비밀번호가 동일합니다.").css('color', 'blue');
				pwd_check = true;
			}
			return;
		}
		
		function regChk(){
			var agree = document.getElementsByName("check");
			if(!nickname_check) {
				alert("새로운 닉네임을 적어주세요.");
				return;
			}
			if(!email_check) {
				alert("이미 가입된 이메일입니다.");
				return;
			}
			
			if(agree[0].checked == false) {
				alert('체크란에 체크를 해주세요.');
				return;
			}
			
			if(!pwd_check) {
				alert('비밀번호를 확인해 주세요..');
				return;
			}
			document.form.submit();
		}
		

		//외부 사이트 연동
		
		//GOOGLE	    
		var googleUser = {};
		var startApp = function() {
			gapi.load('auth2', function(){
			    // Retrieve the singleton for the GoogleAuth library and set up the client.
				auth2 = gapi.auth2.init({
				client_id: '548646685476-66rnba8f83nh9ru9dpss5av3lbgvs9lf.apps.googleusercontent.com',
				cookiepolicy: 'single_host_origin',
				  // Request scopes in addition to 'profile' and 'email'
				  //scope: 'additional_scope'
				});
				attachSignin(document.getElementById('customBtn'));
			});
		};
		
		function attachSignin(element) {
			console.log(element.id);
			auth2.attachClickHandler(element, {},
				function(googleUser) {
					document.getElementById('name').innerText = "Signed in: " + googleUser.getBasicProfile().getName();
				},
				function(error) {
					alert(JSON.stringify(error, undefined, 2));
				}
			);
		}
			
		startApp();		//google start  
		  
		 //Facebook
		window.fbAsyncInit = function() {
			FB.init({
				appId      : '906228626175885', // 앱 ID
				status     : true,          // 로그인 상태를 확인
				cookie     : true,          // 쿠키허용
				xfbml      : true           // parse XFBML
			});
			
			FB.getLoginStatus(function(response) {
				if (response.status === 'connected') {
					FB.api('/me', function(user) {
						if (user) {
							var image = document.getElementById('image');
							image.src = 'http://graph.facebook.com/' + user.id + '/picture';
							var name = document.getElementById('name');
							name.innerHTML = user.name
							var id = document.getElementById('id');
							id.innerHTML = user.id
						}
					});    
				} else if (response.status === 'not_authorized') {
				
				} else {
				    
				}
			});
			
			FB.Event.subscribe('auth.login', function(response) {
			    document.location.reload();
			});
		};
	     // Load the SDK Asynchronously
		(function(d){
			var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
			if (d.getElementById(id)) {return;}
			js = d.createElement('script'); js.id = id; js.async = true;
			js.src = "//connect.facebook.net/ko_KR/all.js";
			ref.parentNode.insertBefore(js, ref);
		 }(document));
    </script>	
</head> 
    
<body >

<!--=== Content Part ===-->    
<div class="container">
    <!--Reg Block-->
    
    <div class="reg-block" >

        <div class="reg-block-header">
            <h2>회원가입</h2>
            
            <!-- 외부 사이트 회원가입 연동 -->
            <ul class="social-icons text-center">
                <li><a class="rounded-x social_googleplus" id="customBtn"  data-original-title="google" href="#" ></a></li>
                <li><a class="rounded-x social_twitter" id="naver_id_login" data-original-title="Naver"  href="#"></a></li>
                <li><a class="rounded-x social_facebook" onclick="FB.login();" data-original-title="Facebook"  href="#"></a></li>
            </ul>
            <p>이미 가입하셨다면 <a class="color-green" href="login_view.member?redirect=<%=request.getParameter("redirect")%>">로그인 하기</a> 를 클릭해주세요. 
        </div>

        <div class="sky-form">
            <!-- NICKNAME -->
			<form action="joinOk.member?redirect=<%=request.getParameter("redirect")%>" name="form" method="post" > 
	            <div >
	                <label class="input">
	                   <i class="icon-append fa fa-user"></i>
	                   <input type="text" name="member_nickname" id="member_nickname" placeholder="닉네임" >                  
	                </label>       
	                 <div class="note" id="idchk"></div>       
	            </div>  
	        
	        	<!-- PASSWORD -->
	            <div>
	               <label class="input">
	                 <i class="icon-append fa fa-lock"></i>
	                 <input type="password" name="member_password" placeholder="비밀번호" onblur="passchk2()">
	               </label>          
	        	</div>
	        	
	        	<!-- PASSWORDOK -->
	        	<div>
	               <label class="input">
	                 <i class="icon-append fa fa-key"></i>
	                 <input  type="password" name="passwordok" placeholder="비밀번호 확인" onblur="passchk()">
	               </label>   
	               <div class="note" id="passchk"></div>          
	        	</div>    
	        	
	        	<!-- EMAIL -->
				<div>
	               <label class="input">
	                 <i class="icon-append fa fa-envelope"></i>
	                 <input type="text" name="member_email" id="member_email" placeholder="이메일 주소">
	               </label> 
	               <div class="note" id="emailchk"></div>                  
	        	</div>
	        	
	        	<!-- DATE -->
	        	<div>
	               <label class="input">
	               <i class="icon-append fa fa-calendar"></i>
	               <input type="text" name="member_birthday" id="member_birthday" placeholder="생년월일">
	               </label>
	            </div>
	          
	          <!-- GENDER -->  
				<div>
				   <label class="select">
				      <select name="member_gender">
				        <option value="" selected disabled>성별</option>
				        <option value="Male">남자</option>
				        <option value="Female">여자</option>
				      </select>
				   </label>
				</div>
			</form>   
		</div>
        <hr>

		<!-- CHECKBOX -->
		<div class="checkbox">            
            <label>
                <input type="checkbox" name="check"> 
               <a target="_blank" href="./terms.do">약관에 동의합니다.</a>
            </label>
        </div>

        <!-- BUTTON -->                        
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <input type="button" class="btn-u btn-block" onclick="regChk()"  value="회원가입"/>             
            </div>
        </div>
    </div>    <!--End Reg Block-->
  </div>     <!--/container-->    
<!--=== End Content Part ===-->

<!-- 네이버 스크립트 -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("5vMePyNDF75gIJlfLVQW", "http://localhost:8080/register/*.do#");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 1,0);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();


//네이버아디디로로그인 Callback페이지 처리 Script
// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		//alert(naver_id_login.getProfileData('email'));
		//alert(naver_id_login.getProfileData('nickname'));
		//alert(naver_id_login.getProfileData('age'));
	}
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
// 네이버 사용자 프로필 조회
</script>
<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

  
</body>

</html> 