<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
    <title>TraBaB - 여행 친구 찾기</title>

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
	#autocomplete {
		position: absolute;
		top: 0px;
		left: 0px;
		width: 99%;
	}

	#map {
		height : 700px;
	}
	</style>
	<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript">

	<%
		if (session.getAttribute("isLogin") == null) {
			// 로그인 아되어있을 시 강제로 보내버림.
			out.println("alert('로그인 후 사용해 주세요.');");
			out.println("location.href ='login_view.member?redirect=together_view.together';");
		} else {
			// 로그인 되어있는 상태라면 그냥 진행.
			System.out.println(session.getAttribute("isLogin")); // true
			System.out.println(session.getAttribute("mbemail"));
		}
	%>
	</script>
	
</head>

<body>
<div class="wrapper">

 	<jsp:include page="../template/header.jsp"></jsp:include>

	<div class="breadcrumbs-v1" style="background: url(/trabab/resources/assets/img/photogal_img/together.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
            <span>TRAVEL TIP</span>
            <h1>여행 친구 찾기 - 여행 같이 가요!</h1>
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
				    <form action="#" class="sky-form">
				    	<input type="hidden" name="latitude" id="latitude"/>
				    	<input type="hidden" name="longitude" id="longitude"/>
						
						<!-- 후기 지도 부분 -->
						<fieldset>
				        	<section>
			              	<!-- Begin Content -->
				           		<div>
					                  <!-- Basic Map -->
					                  <div class="headline"><h3>함께 여행할 다른 여행자들을 찾아보세요 </h3></div>
					                  <!-- <input type="text" id="pac-input"> -->
						              <div id="map" class="map margin-bottom-50"></div>
					                  <!-- End Basic Map -->
				              	</div>
			              <!-- End Content -->
			           		</section>
						</fieldset>
						
						<fieldset>
				            <section>
				         
				                <div class="headline"><h4>여행 제목</h4></div>
				                <label class="input">
				                    <input type="text" id="gtsubject">
				                </label>
				            </section>
				            
				            <!-- 장소검색 부분이 들어가야함.. -->
							<section>
								<div class="headline"><h4>여행 장소 </h4></div>
								<label class="input"> 
									<input type="text" id="autocomplete" onfocus="geolocate()" placeholder="장소를 검색하세요.">
								</label>
							</section>

							<section>
								 <div class="headline"><h4>여행 일정</h4></div>
								 <div class="row">
								     <section class="col col-6">
								         <label class="input">
								             <i class="icon-append fa fa-calendar"></i>
								             <input type="text" name="start" id="start"  placeholder="시작하는 날짜">
								         </label>
								     </section>
								     <section class="col col-6">
								         <label class="input">
								             <i class="icon-append fa fa-calendar"></i>
								             <input type="text" name="finish" id="finish"  placeholder="끝나는 날짜">
								         </label>
								     </section>
								 </div>
							</section>
							
							<section>
				                <div class="headline"><h4>한줄 내용</h4></div>
				                <label class="input">
				                    <input id="gtcontent" type="text">
				                </label>
				            </section>
				           	<div><br /><h4> <b>게시물 등록 시 사용자의 이메일이 노출됩니다.</b></h4></div>
						</fieldset>
						
						<footer>
				            <button type="button" id="write_button" class="btn-u">게시물 등록</button>&nbsp;
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

<!-- 맵 -->
<script src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyCvf8EbTmo_Qg0QfGidlU5WD_f_0hhhudo&libraries=places&callback=initAutocomplete"
        async defer></script> 


<!-- 이 아래로는 건들 필요 없음. -->
<script type="text/javascript">
	//template 기본 js
    jQuery(document).ready(function() {
        App.init();
        Datepicker.initDatepicker();
    }); 
   
</script>
<script type="text/javascript">	
	var markers = [];
	var map;
	var placeSearch, autocomplete;

	var center = {
		lat : 36.2530726,
		lng : 127.9910263
	};

	function get_geolocation() {
		$.getJSON("list_view.together", function ( data ) {	
			drop(data);
		});
	}
	
	function initAutocomplete() { // 구글 지도 생성
		
		map = new google.maps.Map(document.getElementById('map'), {
			center : center,
			zoom : 7,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});
		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById('autocomplete')), {
			types : [ 'geocode' ]
		});
		autocomplete.addListener('place_changed', fillInAddress);
	}
	
	function fillInAddress() {
		var place = autocomplete.getPlace();
	}

	function geolocate() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var geolocation = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
				var circle = new google.maps.Circle({
					center : geolocation,
					radius : position.coords.accuracy
				});
				autocomplete.setBounds(circle.getBounds());
			});
		}
	}

	function drop(neighborhoods) {
		clearMarkers();
		for (var i = 0; i < neighborhoods.length; i++) {
			addMarkerWithInfowindow(neighborhoods[i]);
		}
	}

	function addMarkerWithInfowindow(position) {
		var contentString =
				'<div class="comment">'
				+ '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'
				+'<img class="rounded-x" alt="" width=250px; height=260px; src="/trabab/resources/uploadimg/profile/'+position.member_profile_image+'">'
				+ '<div class="overflow-h">'
				+ '<strong> ID : '+position.member_nickname+' <small class="pull-rigdht"> </small></strong><br/>'	//각각의 좌표를 뿌려준다.
				+ '<strong> Email : '+position.member_email+'  <small class="pull-rigdht"> </small></strong><br/>'
				+ '<strong> 여행제목 : '+position.together_subject+'<small class="pull-rigdht"> </small></strong><br/>'
				+ '<strong> 목적지 : '+position.together_address+'  <small class="pull-rigdht"> </small></strong><br/>'
				+ '<strong> 여행날짜 : '+position.together_schedule_start+' ~ '+position.together_schedule_end+' <small class="pull-rigdht"> </small></strong><br/>'
				+ '<strong> 한줄내용 : '+ position.together_content +' <small class="pull-rigdht"> </small></strong>'
				+ '<ul class="list-inline comment-list">'
				+ '</ul></div></div>';

		var infowindow = new google.maps.InfoWindow({
			content : contentString
		});
		
		var markerPosition = {
				lat: parseFloat(position.together_latitude),
				lng: parseFloat(position.together_longitude)
		};
		
		var marker = new google.maps.Marker({
			position : markerPosition,
			map : map,
			animation : google.maps.Animation.DROP ,
			title : '같이가요 InfoWindow'
		});
		
		markers.push(marker);
		
		google.maps.event.addListener(marker, 'click', toggleBounce);

		marker.addListener('click', function() {
			infowindow.open(map, marker);
		}); 

		function toggleBounce() {
			marker.setAnimation(google.maps.Animation.BOUNCE);
			window.setTimeout(function() {
				marker.setAnimation(null);
			}, 3600);
		}
	}


	function clearMarkers() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
			console.log(markers[i]);
		}
		markers = [];
	}

	jQuery(document).ready(function() {
		get_geolocation();
		
		$('#write_button').on('click', function() {
			var subject = $("#gtsubject").val();
			var place = $("#autocomplete").val();
			var lat = autocomplete.getPlace().geometry.location.lat();
			var lng = autocomplete.getPlace().geometry.location.lng();
			var startday = $("#start").val();
			var endday = $("#finish").val();
			var content = $("#gtcontent").val();
;
			$.ajax({
				url : 'writeOk.together',
				data : {
					together_subject : subject,
					together_address : place,
					together_latitude : lat,
					together_longitude : lng,
					together_schedule_start : startday,
					together_schedule_end : endday,
					together_content : content,
				},
				type : 'post',
				dataType : 'json',
				success : function(data) {
					alert("등록완료!");
					$("#gtsubject").val("");
					$("#autocomplete").val("");
					$("#start").val("");
					$("#finish").val("");
					$("#gtcontent").val("");
					clearMarkers();
					get_geolocation();
				},
				error : function(data) {
					console.log(data);
					alert("데이터 기록 실패!!");
				}
			});
		});
	});
</script>
    

</body>
</html>
