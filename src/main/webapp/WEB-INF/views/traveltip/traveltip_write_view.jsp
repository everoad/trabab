<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>    
<html>
<head>
<title>TraBaB - 여행 팁 게시판</title>
	<!-- Meta -->
	<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta name="description" content="">
   <meta name="author" content="">
	<link rel='stylesheet' type='text/css' href='/trabab/resources/assets/img/traveltipimg/common.css'>

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
   <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css">    
   <link rel="stylesheet" href="/trabab/resources/assets/plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css">

   <!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css">
   -->
   <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

   <!-- CSS Customization -->
   <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
   <link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
   
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery.parallax.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/counter/waypoints.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/counter/jquery.counterup.min.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
	<!-- JS Page Level -->           
	<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/js/plugins/owl-carousel.js"></script>
	<script type="text/javascript">
	    jQuery(document).ready(function() {
	        App.init();
	        App.initCounter();
	        App.initParallaxBg();
	        OwlCarousel.initOwlCarousel();
	    });
	</script>
	<script type="text/javascript">
	<%if(session.getAttribute("isLogin") == null) {%>
	      alert('로그인 후 사용해 주세요.');
	      location.href ='login_view.member?redirect=write_view.traveltip${sUrl}${cUrl}';
		<%if(request.getAttribute("message") != null) {%>
			alert('${message }');
		<%}
		}
	%>
	
	</script> 
	<style type="text/css">
		@media all {
			.custom_table{
				width: 775px;	
			}
		}
		.form-inline {
			margin-bottom: 3px;
		}
	</style>
</head>

<body>
<div class="wrapper">
	<jsp:include page="../template/header.jsp"></jsp:include>
	<div class="breadcrumbs-v1"  style="background: url(/trabab/resources/assets/img/photogal_img/traveltip.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
            <span>TRAVEL TIP</span>
            <h1>여행 팁 게시판</h1>
        </div>
    </div>
	<!-- Content -->
	<div class="bg-color-white">
		<!-- container가 묶고 있음 -->
        <div class="container content profile">
            <div class="row">
            	<!-- Left Sidebar -->
				<jsp:include page="../template/left_sidebar.jsp"></jsp:include>

				<div class="custom_table col-md-8">
					<form action='writeOk.traveltip' class="sky-form" method='post' name='wfrm' onSubmit='return ChkForm()'>
						<div class=' form-inline'>
							<div class="form-group-sm">
								<select name='traveltip_category_no' id="select" class="form-control" style="width:18%;">
								   <option selected='selected' value='카테고리 선택' class="form">카테고리 선택</option>
								   <option value='1'>혼자여행 짐 싸기</option>
								   <option value='2'>혼자 쉬기 좋은 숙소</option>
								   <option value='3'>현재 여행지 날씨</option>
								   <option value='4'>교통수단, 경로 추천</option>
								   <option value='5'>여행지 할인 정보</option>
								   <option value='6'>지역 축제 즐겨요</option>
								   <option value='7'> 이런 일 조심하세요</option>
								   <option value='8'>Must Buy Item</option>
								   <option value='9'>기타</option>
								</select>
								<input type='text' name='traveltip_subject' id="title" placeholder="제목.."  class="form-control" style="width:81.5%;">
							</div>
						</div>
						<textarea name="traveltip_content" id="content" rows="10" style="width:610; height:300; display:none" class='form'></textarea>
						<!-- <textarea name='content' style='width:620;height:300' class='form'></textarea> -->
						<div align="right">
							<button class="btn-u btn-u-default btn-u-sm" id="back">취소</button>
							<input type='submit' value="완료" class="btn-u btn-u-sm">
						</div>
					</form>
				
			</div>
		</div>
	</div>	
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="/trabab/resources/assets/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "/trabab/resources/assets/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            //bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false, 
        }
	});
</script>
<script type="text/javascript">
	function ChkForm() { // 글을 쓸 때 필수적으로 입력해야 할 값이 있는데, 입력 안 했을 경우 경고 문구 출력하도록 함수 만들기

	
		if(document.wfrm.traveltip_category_no.value.trim()=="카테고리 선택"){ 
			alert('카테고리를 입력하셔야 합니다.');
			return false;
		}
		
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"  ].exec("UPDATE_CONTENTS_FIELD", []);
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("ir1").value를 이용해서 처리한다.
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	$('#back').on('click', function(e) {
		location.href=history.back();
		e.preventDefault();
	})
</script>
</body>
</html>
		