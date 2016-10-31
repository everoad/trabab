<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB - 여행기 작성</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/headers/header-default.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/footers/footer-v1.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/animate.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/fancybox/source/jquery.fancybox.css">   
    <!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css">
    -->
    <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
    <script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">
    <%
	if(session.getAttribute("isLogin") == null) {
		out.println("alert('로그인 후 사용해 주세요.');");
		out.println("location.href ='login_view.member?redirect=write_header_view.travel';");
	}
	%>
    </script>
</head>

<body>
<div class="wrapper">

 	<jsp:include page="../template/header.jsp"></jsp:include>

	<div class="breadcrumbs-v1" style="background: url(/trabab/resources/assets/img/photogal_img/writetravel.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
            <span>WRITE STORY</span>
         <h1>[ ${member_nickname }님의 여행기 작성하기 ]</h1>
        </div>
    </div>

	<!-- Content -->
	<div class="bg-color-light">
		<!-- container가 묶고 있음 -->
        <div class="container content profile">
            <div class="row">
            
            	<!-- Left Sidebar -->
				<jsp:include page="../template/left_sidebar.jsp"></jsp:include>

				<div class="col-md-8">
				    <!-- General Unify Forms -->
				    <form action="" class="sky-form">
				        <fieldset>
				            <section>
				                <div class="headline"><h3>여행 제목</h3></div>
				                <label class="input">
				                    <input type="text" id="subject">
				                </label>
				            </section>
				
							<section>
								 <div class="headline"><h3>여행 일정</h3></div>
								 <div class="row">
								     <section class="col col-6">
								         <label class="input">
								             <i class="icon-append fa fa-calendar"></i>
								             <input type="text" name="start" id="start" placeholder="시작 날짜">
								         </label>
								     </section>
								     <section class="col col-6">
								         <label class="input">
								             <i class="icon-append fa fa-calendar"></i>
								             <input type="text" name="finish" id="finish" placeholder="끝나는 날짜">
								         </label>
								     </section>
								 </div>
							</section>
						</fieldset>
						<footer>
				            <!-- 새시점 추가  :  플래그를 추가할 것인가 -->
				            <button type="button" class="btn-u" id="complete_add">저장 후 새 지점 추가</button>
				            <!-- 취소 -->
				            <button type="button" class="btn-u btn-u-default" onclick="window.history.back();">Back</button>
				        </footer>
				    </form>				    
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
	
</div>
<!-- General Unify Forms -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>


<!-- JS Customization -->
<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>

<!-- ë¬ë ¥ -->
<script src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/js/plugins/datepicker.js"></script>




<!-- 이 아래로는 건들 필요 없음. -->
<script type="text/javascript">
	//template 기본 js
    jQuery(document).ready(function() {
        App.init();
        Datepicker.initDatepicker();
    }); 
    //End Template

    
    
	//ImageUpload
    var index;
    $('#complete_add').on('click', function(e) {
    	if($('#start').val() == '' || $('#finish').val() == '' || $('#subject').val() == ''){
    		alert('빈칸을 채워주세요');
			e.preventDefault();
    		return;
    	}
    	
		 $.ajax({
			url: './writeHeaderOk.travel',
			type: 'post',
			data :  {
				travel_subject : $('#subject').val(),
				travel_schedule_start :  $('#start').val(),
				travel_schedule_end : $('#finish').val()
			},
			dataType: 'json',
			success: function(data) {
				//travel_no 받아서 전송해야 됨.
				location.href="write_body_view.travel?travel_no="+data['travel_no'] + "&travel_step=" + (parseInt(data['travel_step']) + 1);
			},
			error: function() {
				alert("실패");
			}
			
		})
		 e.preventDefault();
	 });
		 
	 
	//End ImageUpload
</script>



<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
