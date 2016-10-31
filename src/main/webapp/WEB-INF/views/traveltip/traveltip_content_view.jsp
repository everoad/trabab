<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
	<link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
	<link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
    <!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css">
    -->
    <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- CSS Customization -->
	<style type="text/css">
	
		input.img_button1 {
			background: url(/trabab/resources/assets/img/traveltipimg/modify.PNG) no-repeat;
			border: none;
			width: 58px;
			height: 18px;
		}
		input.img_button2 {
			background: url(/trabab/resources/assets/img/traveltipimg/delete.PNG) no-repeat;
			border: none;
			width: 58px;
			height: 18px;
		}
	    
		input.img_button3 {
			background: url(/trabab/resources/assets/img/traveltipimg/write.PNG) no-repeat;
			border: none;
			width: 58px;
			height: 18px;
		}
	    
		.line1 {
			border-bottom:1px dotted grey;
		}
		#tip_content img {
			width: 100%;
		}
		fieldset {
			padding: 5px;
		}
		.comment-write{
			padding-left: 20px;
			padding-right: 20px;
		}
		pre {
			align:left;
			border: 1px solid rgba(255,255,255,0);
			background: white;
		}
		.bg-image-header {
		  width: 100%;
		  height: 350px;
		  padding-top: 30px;
		  position: relative;
		  
		}
			.sky-form{
			margin-bottom: 30px;
		}
		
		.bg-image-header:before {
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%; 
		  content: " ";
		  position: absolute;
		  background: rgba(255,255,255,0.7);
		}
		
		/*Background Dark Cover*/
		.bg-image-header-dark:before {
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%; 
		  content: " ";
		  position: absolute;
		  background: rgba(0,0,0,0.5);
		}
		
		.bg-image-header-dark h1,
		.bg-image-header-dark p {
		  color: #eee !important;
		}
		.post-shares, .news-v3{
			float: right;
			background-color: rgba(255,255,255, 0);
		}
		.asdf {
			margin-bottom: 20px;
		}
	</style>
	<!-- CSS Customization -->

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
	
	
		function init_comment(){
			$("#content").val("");
		}

		function get_comment(){
		
			$.getJSON('list_view.comment?board_no=${traveltipVo.traveltip_no}&comment_theme=traveltip', function( data ) {
			   
				var body = "";  
				$.each( data, function( key, val ) {
					var seq = val.comment_no;
					var content = val.comment_content;
					var wdate = val.comment_wdate;
					var writer = val.member_nickname;
					var profile_image = val.member_profile_image;
					var member_no = val.member_no;
					var my_member_no = <%=request.getSession().getAttribute("member_no")%>

					//member_profile_image 넣어야함.
		            body+='<div class="media media-v2">';
		            body+='   <a class="pull-left" href="#">';
		            body+='      <img class="media-object rounded-x" src="/trabab/resources/uploadimg/profile/'+profile_image+'" alt="">';
		            body+='   </a>';
		            body+='   <div class="media-body">';
		            body+='      <h4 class="media-heading">';
		            body+='         <strong><a href="#">'+writer+'</a></strong>';
		            body+='         <small>'+wdate+'</small>';
		            body+='      </h4>';
		            body+='      <pre>'+content+'</pre>';
		            if(my_member_no == member_no) {
		            	body+='      <button type="button" class="btn-u btn-u-default" style="float:right; padding-top:1px; padding-bottom:2px; padding-right:10px; padding-left:10px" onclick="comment_del('+seq+')">삭제</button>';
		            }
		            body+='   </div>';
		            body+='</div>';
				 });
				
				 $("#comment").html("");
				 $("#comment").html(body);
			
			});        
		}
	 
		$(document).ready(function() {
			get_comment();
			
			$('#write').on('click', function() {
		
				<%if(request.getSession().getAttribute("isLogin") == null) {%>
					alert('로그인 후 사용해 주세요.');
					location.href = 'login_view.member?redirect=content_view.traveltip${sUrl}${cUrl}&traveltip_no=${traveltipVo.traveltip_no}';
					return;
				<%}%>
				
				var content = $("#content").val();
						
				if(content=='') {
					alert('내용을 입력하세요.');
					$("#content").focus();
					return;
				}      
			 
				$.ajax({  
					url : 'writeOk.comment',  
					data : {
						board_no : '${traveltipVo.traveltip_no}',
						comment_theme: 'traveltip',
						comment_content : content
					},
					type : 'post',
					dataType : 'json', 
					success: function(data) { 
						if(data['result'] == 'success'){
							//alert("코멘트 쓰기가 완료되었습니다.");
							get_comment();
							init_comment();
							
						} else {
						   alert("코멘트 쓰기가 실패했습니다.");
						}
					},
					error : function(data) { 
						alert("코멘트 쓰기가 실패했습니다.");
					}
				});
			});
		});
	   
    	function comment_del(comment_no) {
		
			var con = confirm("삭제하시겠습니까?");
			if(con){
			
				$.ajax({  
					url : 'deleteOk.comment',  
					data : {
						board_no : '${traveltipVo.traveltip_no}',
						comment_no : comment_no,
						comment_theme: 'traveltip'
					},
					type : 'post',
					dataType : 'json', 
					success: function(data) {
						if(data['flag'] == 1){
							//alert("코멘트 삭제가 완료되었습니다.");
							get_comment();
							init_comment();
						}else{
							alert("코멘트 삭제가 실패했습니다.");
						}
					},
					error : function(data) { 
						alert("코멘트 삭제가 실패했습니다.");
					}
				});
			}
		   
		}
	</script>

</head>

<body bgcolor='#ffffff' topmargin='5' rightmargin='0' leftmargin='5' bottommargin='10'>
<div class="wrapper">

	<jsp:include page="../template/header.jsp"></jsp:include>

	<div class="bg-image-header bg-image-header-dark parallaxBg1" style="background: url(/trabab/resources/assets/img/photogal_img/traveltip.jpg) no-repeat fixed; background-position: center;   background-size: 100%;">
        <div class="container content">
            <div class="headline-center-v2 margin-bottom-10">
            	<br />
                <h1>${traveltipVo.traveltip_subject }</h1>
				<p>${traveltipVo.traveltip_category_name }</p>
                <span class="bordered-icon"><i class="fa fa-th-large"></i></span>
				<p>by ${traveltipVo.member_nickname } / ${traveltipVo.traveltip_wdate }</p>
				<div class="news-v3 margin-bottom-0">
		        	<ul class="post-shares">
	                    <li>
	                        <a href="#">
	                            <i class="rounded-x icon-speech"></i>
	                            <span id="comment_count1">${traveltipVo.traveltip_comment_cnt }</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="rounded-x icon-like"></i>
	                            <span id="like_count1">${traveltipVo.traveltip_hit }</span>
	                        </a>
	                    </li>
	                </ul>
                </div>
			 </div><!--/Headline Center V2-->   
        </div><!--/container-->
    </div>
    
	<!-- Content -->
	<div class="bg-color-light">
		<!-- container가 묶고 있음 -->
        <div class="container content profile">
            <div class="row">
            
            	<!-- Left Sidebar -->
				<jsp:include page="../template/left_sidebar.jsp"></jsp:include>
				<fieldset>
					<div class="col-md-10">
						<div  class="sky-form">
							<fieldset>
								<div>
									${traveltipVo.traveltip_content }
								</div>
								<div align="right" class="asdf">
									<c:if test="${!empty member_no && member_no eq traveltipVo.member_no }">
										<a href='./modify_view.traveltip?${sUrl}${cUrl}&traveltip_no=${traveltipVo.traveltip_no}' class="btn-u btn-u-default btn-u-sm">수정</a>
										<a href='./deleteOk.traveltip?${sUrl}${cUrl}&traveltip_no=${traveltipVo.traveltip_no}' class="btn-u btn-u-default btn-u-sm">삭제</a>
									</c:if>
									<a href='./write_view.traveltip${sUrl}${cUrl}&traveltip_no=${traveltipVo.traveltip_no}' class="btn-u btn-u-default btn-u-sm">글쓰기</a>
							   		<a href='./list_view.traveltip${sUrl}${cUrl}&traveltip_no=${traveltipVo.traveltip_no}' class="btn-u btn-u-default btn-u-sm">목록으로</a>
								</div>
							</fieldset>
						</div>
					
						<div class="sky-form">
		                    <div class="panel panel-profile">
		                        <div class="panel-heading overflow-h">
		                            <h2 class="panel-title heading-sm pull-left"><i class="fa fa-comments"></i>코멘트를 입력해주세요</h2>
		                        </div>
		                        <div class="comment-write">
			                        <label class="textarea">
			                         	<textarea rows="3" cols="" id="content"></textarea>
			                        </label>
			                        <div align="right">
			                        	<button id="write" class="btn-u">완료</button>
	                        		</div>
	                      		</div>
		                        <div class="panel-body" id="comment">
			                    </div>
		    			    </div>
						</div>
					</div>
				</fieldset>
				<!-- <div class="col-md-1"></div> -->
			</div>
		</div>
	</div>	

	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
</html>