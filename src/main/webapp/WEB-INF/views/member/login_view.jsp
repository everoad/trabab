<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>TraBaB - 로그인</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

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

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/page_log_reg_v2.css">    

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    <style type="text/css">
    	#alert{
    		text-align: center;
    		color: tomato;
    	}
    </style>
   	<script type="text/javascript">
	
   	<%
		if (session.getAttribute("isLogin") != null) {
			
			out.println("location.replace('" + request.getParameter("redirect") +"');");
		}
	%>
   	
   	</script>
</head> 

<body>

<!--=== Content Part ===-->    
<div class="container">
    <!--Reg Block-->
	<form action="login_view.member?redirect=<%=request.getParameter("redirect")%>" method="post">
		<input type="hidden" name="go" value="go"/>
		<div class="reg-block">
	        <div class="reg-block-header">
	            <h2>로그인</h2>
	           
	            <ul class="social-icons text-center">
	                <!-- <li><a class="rounded-x social_facebook" data-original-title="Facebook" href="#"></a></li>
	                <li><a class="rounded-x social_twitter" data-original-title="Twitter" href="#"></a></li>
	                <li><a class="rounded-x social_googleplus" data-original-title="Google Plus" href="#"></a></li>
	                <li><a class="rounded-x social_linkedin" data-original-title="Linkedin" href="#"></a></li> -->
	            </ul>
	            <p>계정이 없으시다면 <a class="color-green" href="join_view.member?redirect=<%=request.getParameter("redirect")%>">회원가입 하기</a>를 클릭해주세요.         
	        </div>
		        <div class="input-group margin-bottom-20">
		            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
		            <input type="text" class="form-control" placeholder="이메일 주소" name="member_email">
		        </div>
		        <div class="input-group margin-bottom-20">
		            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
		            <input type="password" class="form-control" placeholder="비밀번호" name="member_password">
		        </div>
	            <div id="alert"></div>
		        <hr>
		
		        <div class="checkbox">
		            <label>
		                <input type="checkbox"> 
		                <p>로그인 기억하기</p>
		            </label>            
		        </div>
	        <div class="row">
	            <div class="col-md-10 col-md-offset-1">
	                <button type="submit" class="btn-u btn-block">로그인</button>
	            </div>
	        </div>
	        	
	    </div>
   </form>                
    <!--End Reg Block-->
</div><!--/container-->
<!--=== End Content Part ===-->

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
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>
<script type="text/javascript">
    $.backstretch([
      "/trabab/resources/assets/img/bg/19.jpg",
      "/trabab/resources/assets/img/bg/18.jpg",
      ], {
        fade: 1000,
        duration: 7000
    });
</script>
	
	
<script type="text/javascript">
	
 <%
	if (request.getAttribute("message") != null) {
	
		out.println("$('#alert').html('"+request.getAttribute("message")+"')");
	
	}
%>
</script>
	
<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html> 