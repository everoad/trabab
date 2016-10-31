<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB - 여행기</title>

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
 <!--    <link rel="stylesheet" href="/trabab/resources/assets/plugins/fancybox/source/jquery.fancybox.css">   --> 
    <!-- <link rel="stylesheet" href="/trabab/resources/assets/css/pages/z_feature_google_map.css">
    -->
    <!--[if lt IE 9]><link rel="stylesheet" href="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
    <!-- 슬라이드 -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/slide/fotorama.css">
    
    <style>
	.bg-image-header {
	 
	  width: 100%;
	  height: 400px;
	  padding-top: 30px;
	  position: relative;
	  
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
	
	.bg-image-header-dark h1 {
		font-size: 3em;	
	}
	.post-shares, .news-v3{
		float: right;
		background-color: rgba(255,255,255, 0);
	}

	#map{
		width: 100%;
		height: 300px;
	}
	.sky-form{
		margin-bottom: 30px;
	}
	.fotorama{
		background: black;
		border: 1px solid gray;
		margin-bottom: 40px;
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
	
	</style>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
</head>

<body>
<div class="wrapper">

 	<!--=== Header ===-->    
    <jsp:include page="../template/header.jsp"></jsp:include>

 
    <div class="bg-image-header bg-image-header-dark parallaxBg1" style="background: url(/trabab/resources/uploadimg/${travelTotalVo.travel_image}) no-repeat fixed; background-position: center;   background-size: 100%;">
        <div class="container content">
            <div class="headline-center-v2 margin-bottom-10">
            	<br />
                <h1>${travelTotalVo.travel_subject }</h1>
                <span class="bordered-icon"><i class="fa fa-th-large"></i></span>
				<p>by ${travelTotalVo.member_nickname } / ${travelTotalVo.travel_wdate }</p>
				<p>
				<c:forEach items="${travelTotalVo.travel_hashtag_list}" var="tag">
					<a href="list_view.travel?skey=${tag }&stype=hashtag">#${tag},</a>
				</c:forEach>
				</p>
				<div class="news-v3 margin-bottom-0">
		        	<ul class="post-shares">
	                    <li>
	                        <a href="#">
	                            <i class="rounded-x icon-speech"></i>
	                            <span id="comment_count1">${travelTotalVo.travel_comment_cnt }</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <i class="rounded-x icon-like"></i>
	                            <span id="like_count1">${travelTotalVo.travel_like_cnt }</span>
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
            	<jsp:include page="../template/left_sidebar.jsp"></jsp:include>
				<div class="col-md-8">
					<div class="sky-form">
						<img class="img-responsive" src="http://maps.googleapis.com/maps/api/staticmap?maptype=roadmap${markers}${path}&size=600x300&scale=2&key=AIzaSyCRFCfTV41SXWUpY8PfqyOnxPQKLyncTGk" alt=""/>
					</div>
				    <!-- General Unify Forms -->
				    <c:forEach items="${travelTotalVo.travel_body_list}" var="dto" varStatus="status">
					    <div class="sky-form">
					      	 <fieldset>
					            <section>
		  				            <div class="testimonials-v6">
				                        <div class="testimonials-info">
				                            <div class="testimonials-desc">
				                                <h3>${status.count} 지점. ${dto.travel_location_name }</h3>
												<h5 align="right"></h5>
				                            </div>
				                        </div>
						          	</div>
						          	<br />
					             	<pre style="background-color:white; font-family:'Open Sans', Arial, sans-serif">${dto.travel_content }</pre>
					            </section>
	
					            <section>
					            	<div class="fotorama" data-ratio="800/400" data-max-width="100%" data-nav="thumbs" data-width="100%" data-loop="true" data-fit="contain" data-allowfullscreen="true">
									    <c:forEach items="${dto.travel_image_list}" var="image">
									  	  <img src="/trabab/resources/uploadimg/${image.travel_image_name}">
										</c:forEach>
									</div>
					            </section>
					            <c:if test="${travelTotalVo.member_no == member_no}">
					            <section>
					            	<div align="right">
					            		 <a href="javascript:;" data-toggle="modal" data-target="#modify_modal"><b>수정하기</b></a>&nbsp;&nbsp;&nbsp;<a href="deleteOk.travel?travel_no=<%=request.getParameter("travel_no") %>"><b>삭제하기</b></a>
					            	</div>
					            </section>
					            </c:if>
	                        </fieldset>
					       
					    </div>
				    </c:forEach>
				    
				     <div class="sky-form">
				      	 <fieldset>
				            <section>
	  				            <div class="testimonials-v6">
			                        <div class="testimonials-info">
			                            <div class="testimonials-desc">
			                                <h3>기타사항</h3>
			                            </div>
			                        </div>
					          	</div>
					          	<br />
				             	<p>
									${travelTotalVo.travel_epilogue }				             	
				             	</p>
				            </section>
                        </fieldset>
                        <fieldset align="right">
                            <c:if test="${travelTotalVo.member_no != member_no}">
	                        	<i class="icon-custom icon-line icon-sm rounded-x icon-user-follow" id="following_btn" data-check=""></i>
	                        	 팔로우하기
	                        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	</c:if>
                        	<i class="icon-custom icon-line icon-sm rounded-x fa fa-thumbs-up" id="like_btn" data-check=""></i>
                        	 좋아요(<span id="like_count2">${travelTotalVo.travel_like_cnt }</span>)
                        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	<i class="icon-custom icon-line icon-sm icon-bg-u rounded-x icon-speech"></i>
                        	 댓글수(<span id="comment_count2">${travelTotalVo.travel_comment_cnt }</span>)
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
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<jsp:include page="../template/travel_modify_modal.jsp">
	<jsp:param name="travelTotalVo" value="${travelTotalVo }" />
</jsp:include>
	
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

<!-- 맵 -->

<script type="text/javascript" src="/trabab/resources/assets/js/slide/fotorama.js"></script>
<script type="text/javascript">
	
</script>
<!-- 이 아래로는 건들 필요 없음. -->
<script type="text/javascript">
	//template 기본 js
    jQuery(document).ready(function() {
        App.init();
        Datepicker.initDatepicker();
    }); 
    //End Template
</script>

<script type="text/javascript">
	checkLike();
	
	$('#like_btn').on('click', function() {
		<%
		if(request.getSession().getAttribute("isLogin") == null) {
			out.println("alert('로그인 후 사용해 주세요.');");
			out.println("location.href = 'login_view.member?redirect=content_view.food?food_no="+request.getParameter("travel_no")+"'");
			out.println("return;");
		}
		%>
		var target = $(this);
		//좋아요 안누른 상태
		if($(this).attr('data-check') == 'false'){
			increaseLikeCount(target);
		
		//좋아요 누른 상태
		} else {
			console.log("아놔");
			decreaseLikeCount(target);
		}
	});
	
	//페이지 열리면서 좋아요 상태 확인
	function checkLike() {
		$.ajax({
			url: 'travel_like_check.travel',
			type: 'post',
			data: {
				travel_no : <%=request.getParameter("travel_no") %>
			},
			dataType: 'json',
			success: function(data) {
				if(data['flag'] == "0") {
					checkIcon($('#like_btn'), false);
				} else {
					checkIcon($('#like_btn'), true);
				}
			},
			error: function() {
			
				alert("실패~");
			
			}
		})
	}
	
	function increaseLikeCount(target) {
		$.ajax({
			url: 'travel_like_increase.travel',
			type: 'post',
			data: {
				travel_no : <%=request.getParameter("travel_no") %>
			},
			dataType: 'json',
			success: function(data) {
				$('#like_count1').html(data['travel_like_cnt']);
				$('#like_count2').html(data['travel_like_cnt']);
				checkIcon(target, true);
			}
		});
	}
	
	function decreaseLikeCount(target) {
		$.ajax({
			url: 'travel_like_decrease.travel',
			type: 'post',
			data: {
				travel_no : <%=request.getParameter("travel_no") %>
			},
			dataType: 'json',
			success: function(data) {
				$('#like_count1').html(data['travel_like_cnt']);
				$('#like_count2').html(data['travel_like_cnt']);
				checkIcon(target, false);
			}
		});
	}
	
	function checkIcon(target, boolean) {
		if(boolean == true) {
			target.removeClass("icon-bg-grey");
			target.addClass(" icon-bg-u");
			target.attr('data-check', "true");
		} else {
			target.removeClass("icon-bg-u");
			target.addClass("icon-bg-grey");
			target.attr('data-check', "false");
		}
	}
</script>

<script type="text/javascript">
	

	function init_comment(){
		$("#content").val("");
	}

	function get_comment(){
	
		$.getJSON( "list_view.comment?board_no=<%=request.getParameter("travel_no")%>&comment_theme=travel", function( data ) {
		   
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
 

	get_comment();
	
	$('#write').on('click', function() {
		<%
		if(request.getSession().getAttribute("isLogin") == null) {
			out.println("alert('로그인 후 사용해 주세요.');");
			out.println("location.href = 'login_view.member?redirect=content_view.travel?travel_no="+request.getParameter("travel_no")+"'");
			out.println("return;");
		}
		%>
		
		var content = $("#content").val();
				
		if(content=='') {
			alert('내용을 입력하세요.');
			$("#content").focus();
			return;
		}      
	 
		$.ajax({  
			url : 'writeOk.comment',  
			data : {
				board_no : <%=request.getParameter("travel_no")%>,
				comment_theme: 'travel',
				comment_content : content
			},
			type : 'post',
			dataType : 'json', 
			success: function(data) { 
				if(data['result'] == 'success'){
					//alert("코멘트 쓰기가 완료되었습니다.");
					get_comment();
					init_comment();
					$('#comment_count1').html(data['travel_comment_cnt']);
					$('#comment_count2').html(data['travel_comment_cnt']);
				} else {
				   alert("코멘트 쓰기가 실패했습니다.");
				}
			},
			error : function(data) { 
				alert("코멘트 쓰기가 실패했습니다.");
			}
		});
	});
	
   
   	function comment_del(comment_no) {
	
		var con = confirm("삭제하시겠습니까?");
		if(con){
		
			$.ajax({  
				url : 'deleteOk.comment',  
				data : {
					board_no : <%=request.getParameter("travel_no")%>,
					comment_no : comment_no,
					comment_theme: 'travel'
				},
				type : 'post',
				dataType : 'json', 
				success: function(data) {
					if(data['flag'] == 1){
						//alert("코멘트 삭제가 완료되었습니다.");
						get_comment();
						init_comment();
						$('#comment_count2').html(data['travel_comment_cnt']);
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
<script type="text/javascript">
	checkFollowing();
	function checkFollowing() {
		$.ajax({
			url : 'check_following.member',
			data : {
				flw_member_no : '${travelTotalVo.member_no}'
			},
			type: 'post',
			dataType: 'json',
			success: function(data) {
				if(data['flag'] == "0") {
					checkIcon($('#following_btn'), false);
				} else {
					checkIcon($('#following_btn'), true);
				}
			},
			error: function() {
				alert("팔로잉 체크 실패");
			}
		})
	}
	
	$('#following_btn').on('click', function(e) {
		<%
		if(request.getSession().getAttribute("isLogin") == null) {
			out.println("alert('로그인 후 사용해 주세요.');");
			out.println("location.href = 'login_view.member?redirect=content_view.travel?travel_no="+request.getParameter("travel_no")+"'");
			out.println("return;");
		}
		%>
		
		var target = $(this);
		//좋아요 안누른 상태
		if($(this).attr('data-check') == 'false') {
			addFollowing(target);
		
		//좋아요 누른 상태
		} else {
			console.log("아놔");
			deleteFollowing(target);
		}
	})
	
	function addFollowing(target) {
		$.ajax({
			url: 'add_following.member',
			type: 'post',
			data : {
				flw_member_no : '${travelTotalVo.member_no}'
			},
			success : function(data) {
				checkIcon(target, true);
			},
			error: function() {
				alert("팔로잉 추가 실패")
			}
		})
	}
	
	function deleteFollowing(target) {
		$.ajax({
			url: 'delete_following.member',
			type: 'post',
			data : {
				flw_member_no : '${travelTotalVo.member_no}'
			},
			success : function(data) {
				checkIcon(target, false);
			},
			error: function() {
				alert("팔로잉 제거 실패");
			}
		})
	}

</script>
	

<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
