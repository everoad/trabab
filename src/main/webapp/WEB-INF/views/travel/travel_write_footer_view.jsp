<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
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
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="/trabab/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/trabab/resources/assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="/trabab/resources/assets/css/headers/header-default.css">
<link rel="stylesheet" href="/trabab/resources/assets/css/footers/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="/trabab/resources/assets/plugins/animate.css">
<link rel="stylesheet" href="/trabab/resources/assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="/trabab/resources/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet"
	href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
<link rel="stylesheet"
	href="/trabab/resources/assets/plugins/fancybox/source/jquery.fancybox.css">
<!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css">
    -->
<!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

<!-- CSS Customization -->
<link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
  <link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
<style type="text/css">

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 50%;
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input:focus {
	border-color: #4d90fe;
}

#uploadimg_box {
	height: 176px;
	width: 100%;
	border: 1px solid #999;
	overflow-x: auto;
	overflow-y: hidden;
	white-space: nowrap;
}

#uploadimg_container {
	width: 200px;
	height: 170px;
	position: relative;
	overflow: hidden;
	display: inline-block;
}

#uploadimg_container img {
	margin: 3px;
	height: 170px;
	position: relative;
}

#uploadimg_container button {
	position: absolute;
	top: 3px;
	left: 80%;
}

.hidden_file {
	display: none;
}
</style>
<script type="text/javascript"
		src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
	
<%
	if (session.getAttribute("isLogin") == null) {
		out.println("alert('로그인 후 사용해 주세요.');");
		out.println("location.href ='login_view.member?redirect=write_view.travel';");
	}
%>
	
</script>
</head>

<body>
	<div class="wrapper">

		<jsp:include page="../template/header.jsp"></jsp:include>

		<div class="breadcrumbs-v1" style="background: url(/trabab/resources/assets/img/photogal_img/writetravel.jpg) no-repeat;  background-size:cover; background-position: center center;">
			<div class="container">
				<span>TRAVEL STORY</span>
         		<h1>[ ${member_nickname }님의 여행기 기록하기 ]</h1>
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
						<form action="writeOk.travel" method="post" class="sky-form" enctype="multipart/form-data">
							<!-- 후기 하단부분. -->
							<fieldset>
								<section>
									<div class="headline">
										<h3>Epilogue</h3>
									</div>
									<label class="textarea"> <textarea rows="7" name="epilogue" id="epilogue"></textarea>
									</label>
								</section>
								<section>
									<label class="label">최대 5개까지 가능합니다.</label> <label
										class="input"> <input type="text" id="hashtag" name="travel_hashtag"
											placeholder="#">
									</label>
								</section>
							</fieldset>

							<footer>
								<!-- 완전 완료 -->
								<button type="submit" class="btn-u" id="complete">완료</button>
								<!-- 새시점 추가  :  플래그를 추가할 것인가 -->
								<button type="button" class="btn-u btn-u-default"
									onclick="window.history.back();">Back</button>
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
	
	<script type="text/javascript"
		src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>


	<!-- JS Customization -->
	<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>

	<!-- 이 아래로는 건들 필요 없음. -->
	<script type="text/javascript">
		//template 기본 js
		jQuery(document).ready(function() {
			App.init();
		});
		//End Template
	</script>

	<script type="text/javascript">
  	$('#complete').on('click', function(e) {
		 
  		if($('#epilogue').val() == '' || $('#hashtag').val() == '') {
  			alert("빈칸을 채워주세요");
  			e.preventDefault();
  			return;
  		}
		 $.ajax({
			url: './writeFooterOk.travel',
			type: 'post',
			data :  {
				travel_no : <%=request.getParameter("travel_no")%>,
				travel_epilogue : $('#epilogue').val(),
				travel_hashtag : $('#hashtag').val()
			},
			dataType: 'json',
			success: function(data) {
								
				//travel_no 받아서 전송해야 됨.
				location.href="content_view.travel?travel_no="+data['travel_no'];
			},
			error: function() {
				alert("실패");
			}
			
		})
		 e.preventDefault();
	 }); 
	
	</script>

	<script type="text/javascript">
		var size = 0;
		var tags = 0;
		$('#hashtag').on('keyup', function(e) {
			
			if($(this).val().length > size && tags == 5) {
				$(this).val($(this).val().substr(0, size));
			}
			
			var keycode = e.keyCode;
			if (keycode == 32) {
				
				var val = $(this).val().replace(/#/g, '');
				val = val.replace(/,/g, '');

				var tagArr = val.split(" ");
		
				var hashtag = "";
				for ( var index in tagArr) {
					if(tagArr[index] == '') {
						break;
					}
				
					if(index >= 0 && index < 4) {
						hashtag += "#" + tagArr[index] + ", ";
					} else {
						hashtag += "#" + tagArr[index];
						size = hashtag.length;
						tags = 5;
					}
				}
				$(this).val(hashtag);
			}
		});
	</script>

	<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
