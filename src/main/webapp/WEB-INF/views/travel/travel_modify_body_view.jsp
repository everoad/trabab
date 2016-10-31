<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
 		height:176px;
 	 	width:100%;
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
	    left: 70%;
    }
    #file {
    	z-index: 10;
     }
 	</style>
    <script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
   
</head>

<body>
<div class="wrapper">

 	<jsp:include page="../template/header.jsp"></jsp:include>

	<div class="breadcrumbs-v1" style="background: url(/trabab/resources/assets/img/photogal_img/writetravel.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
            <span>WRITE STORY</span>
            <h1>[ ${member_nickname }님의 여행기 수정하기 ]</h1>
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
				   		<input type="hidden" name="travel_step" id="step" value="<%=request.getParameter("travel_step") %>"/>
				    	<input type="hidden" name="travel_latitude" id="latitude" value="${travelBodyVo.travel_latitude }"/>
				    	<input type="hidden" name="travel_longitude" id="longitude" value="${travelBodyVo.travel_longitude }"/>
						<fieldset>
				        	<section>
			              	<!-- Begin Content -->
				           		<div>
					                  <!-- Basic Map -->
					                  <h2><%=request.getParameter("travel_step") %> 지점</h2>
					                  <div class="headline"><h3>여행 장소</h3></div>
					                  <input type="text" id="pac-input" value="${travelBodyVo.travel_address }">
						              <div id="map" class="map margin-bottom-10"></div>
						              <label class="input">
					                 	 <input type="hidden" id="address" value="${travelBodyVo.travel_location_name }">
					              	  </label>
					                  <!-- End Basic Map -->
				              	</div>
			              <!-- End Content -->
			           		</section>
						</fieldset>
				
						<!-- 후기 하단부분. -->
				      	 <fieldset>
				            <section>
				                <div class="headline"><h3>이미지</h3></div>
				                
				                <label for="file" class="input input-file">
				               		<div class="button"><input type="file" id="file" onchange="uploadImg1(this);" multiple>Browse</div>
				                </label>
				                
				                <div id="uploadimg_box">
				                	<c:forEach items="${travelBodyVo.travel_image_list }" var="to">
				                		<div id="uploadimg_container">
				                			<img src="/trabab/resources/uploadimg/${to.travel_image_name }" alt="" height="200px" id="uploadimg">
	            							<button id="delete_before_img" class="btn-u btn-u-default delete_before_img" data-name="${to.travel_image_name }">삭제</button>
				                		</div>
				                	</c:forEach>
				                </div>
				            </section>
				        
				            <section>
				                 <div class="headline"><h3>여행 내용</h3></div>
				                <label class="textarea">
				                    <textarea rows="10" id="content">${travelBodyVo.travel_content }</textarea>
				                </label>
				            </section>
				        </fieldset>
				        <footer align="right">
				        	<!-- 완전 완료 -->
				            <button type="submit" class="btn-u" id="complete">수정 완료</button>
				            <!-- 새시점 추가  :  플래그를 추가할 것인가 -->
				            <button type="submit" class="btn-u" id="complete_modify" data-toggle="modal" data-target="#modify_modal">완료 후 새 지점 수정</button>
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
<jsp:include page="../template/travel_modify_modal.jsp">
	<jsp:param name="travelTotalVo" value="${travelTotalVo}" />
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_lAcXGJIz-YvdOqtlfFC_cB2hC3lDIsc&libraries=places&callback=initAutocomplete"
        async defer></script> 


<!-- 이 아래로는 건들 필요 없음. -->
<script type="text/javascript">
	//template 기본 js
    jQuery(document).ready(function() {
        App.init();
        Datepicker.initDatepicker();
    }); 
    //End Template
	
	//ImageUpload
     var index = 0;
    var formdata = new FormData();
    
    function uploadImg1(input) {
    	
    	if (input.files && input.files[0]) {
    		
    		for(var i = 0; i < input.files.length; i++){
    			uploadImg2(input.files[i]);
    		}
    		
    		input.files.clear;
    		
    	}
    }
    
	function uploadImg2(file) {
	
		var reader = new FileReader();
		
		reader.onload = function (e) {
			jQuery('#uploadimg_box').append('<div id="uploadimg_container"><img src="'+e.target.result +'" alt="" id="uploadimg">'
					+'<button class="btn-u btn-u-default delete_img" id="delete_img" data-index="'+index+'">삭제</button></div>');
			formdata.append('files['+index+']', file);
	
			index++;
		}
		reader.readAsDataURL(file);
	}
	
	 $(document).on('click', '#delete_img', function() {
		var target = $(this).attr('data-index');
	 	$(this).parent().remove();
	 	formdata.delete('files['+target+']');
	 });
	 
	 $(document).on('click', '#delete_before_img', function() {
	        //이미지 이름
	    	var target_name = $(this).attr('data-name');
	        console.log("target_name : " + target_name);
	        //브라우저 상 이미지 삭제.
	        $(this).parent().remove();
			//지우는 이미지 이름.
	        formdata.append('delete_imgs', target_name);
			
			console.log(formdata.getAll('delete_imgs'));
	 });
	 
	 $('#complete').on('click', function(e) {
		 formdata.append('travel_no', <%=request.getParameter("travel_no")%>);
		 formdata.append('travel_step', $('#step').val());
		 formdata.append('travel_latitude', $('#latitude').val());
		 formdata.append('travel_longitude', $('#longitude').val());
		 formdata.append('travel_subject', $('#subject').val());
		 formdata.append('travel_schedule_start', $('#start').val());
		 formdata.append('travel_schedule_end', $('#finish').val());
		 formdata.append('travel_location', $('#address').val());
		 formdata.append('travel_address', $('#pac-input').val());
		 formdata.append('travel_content', $('#content').val());
		 
		 $.ajax({
			url: './modifyBodyOk.travel',
			type: 'post',
			data :  formdata,
			dataType: 'json',
			processData: false, 
	        contentType: false,
			success: function(data) {
				location.href='content_view.travel?travel_no=<%=request.getParameter("travel_no")%>';
			},
			error: function() {
				alert("실패");
			}
				
		 })
		 e.preventDefault();
	 });
	 
	 $('#complete_modify').on('click', function(e) {
		 formdata.append('travel_no', <%=request.getParameter("travel_no")%>);
		 formdata.append('travel_step', $('#step').val());
		 formdata.append('travel_latitude', $('#latitude').val());
		 formdata.append('travel_longitude', $('#longitude').val());
		 formdata.append('travel_subject', $('#subject').val());
		 formdata.append('travel_schedule_start', $('#start').val());
		 formdata.append('travel_schedule_end', $('#finish').val());
		 formdata.append('travel_location', $('#address').val());
		 formdata.append('travel_address', $('#pac-input').val());
		 formdata.append('travel_content', $('#content').val());
		 
		 $.ajax({
			url: './modifyBodyOk.travel',
			type: 'post',
			data :  formdata,
			dataType: 'json',
			processData: false, 
	        contentType: false,
			success: function(data) {
				//alert("sdfsfsdfsdfsdfsdfsfsdfds");			
			},
			error: function() {
				alert("실패");
			}
				
		 })
		 e.preventDefault();
	 });
	 
	//End ImageUpload
</script>

<script>
	//google map api
	function initAutocomplete() {
		
		var map = new google.maps.Map(document.getElementById('map'), {
			center: {lat: 36.2530726, lng: 127.9910263},
			zoom: 7,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		});
		
		var input = document.getElementById('pac-input');
		var searchBox = new google.maps.places.SearchBox(input);
		map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
		
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});
		
		var markers = [];

		searchBox.addListener('places_changed', function() {
			var places = searchBox.getPlaces();
			
			if (places.length == 0) {
				return;
			}
			
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];
			
			var bounds = new google.maps.LatLngBounds();
			places.forEach(function(place) {
			 	
				//중요기능 -> 일정기능?
				// $('body').append('<img src="'+place.photos[0].getUrl({'maxWidth': 200, 'maxHeight': 200})+'" alt="" />'); 
				
				$('#latitude').val(place.geometry.location.lat());
				$('#longitude').val(place.geometry.location.lng());
				$('#address').val(place.name);
				
				var icon = {
				    url: place.icon,
				    size: new google.maps.Size(71, 71),
				    origin: new google.maps.Point(0, 0),
				    anchor: new google.maps.Point(17, 34),
				    scaledSize: new google.maps.Size(25, 25)
				 };
				
				
				markers.push(new google.maps.Marker({
					map: map,
					icon: icon,
					title: place.name,
					position: place.geometry.location
				}));
				
				if (place.geometry.viewport) {
				   bounds.union(place.geometry.viewport);
				} else {
				   bounds.extend(place.geometry.location);
				}
			});
			map.fitBounds(bounds);
		});
		// [END region_getplaces]
	}
	//END google map api
</script>

<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
