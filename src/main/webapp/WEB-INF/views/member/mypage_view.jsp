<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB - 마이페이지</title>

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
	<link rel="stylesheet" href="/trabab/resources/assets/plugins/brand-buttons/brand-buttons.css">
    <link rel="stylesheet" href="/trabab/resources/assets/plugins/brand-buttons/brand-buttons-inversed.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyADgNj6TzvR1SXpF4CdtkuM4NaaaM9zQmk" type="text/javascript"></script>
 -->
    <!-- CSS Customization -->
    <link rel="stylesheet" href="/trabab/resources/assets/css/custom.css">
    <link rel="stylesheet" href="/trabab/resources/assets/css/pages/profile.css">
    <script type="text/javascript">
    <%
	if(session.getAttribute("isLogin") == null) {
		out.println("alert('로그인 후 사용해 주세요.');");
		out.println("location.href ='login_view.member?redirect=mypage_view.member';");
	}
	%>
    </script>
	<style type="text/css">
		.pre{
			border:1px solid rgba(255,255,255,0);
		}
		.post-shares, .news-v3{
			float: right;
			background-color: rgba(255,255,255, 0);
		}
		.post-shares p {
			font-size: 14px;
			color: white;
		}
		.breadcrumbs-v1{
			height:400px;
		}
	
	</style>
</head>

<body>
<div class="wrapper">
	<jsp:include page="../template/header.jsp"></jsp:include>
	
	<div class="breadcrumbs-v1" style="background: url(/trabab/resources/assets/img/photogal_img/mypage.jpeg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container content">
            <span>MY PAGE</span>
            <h1>내 정보 보기</h1>
           		<div class="news-v3 margin-bottom-0">
		        	<ul class="post-shares">
	                    <li>
	                        <a href="javascript:;" data-container="body" data-toggle="popover" data-placement="bottom" id="follower_btn">
	                            <i class="rounded-x icon-speech"></i>
	                            <span id="follow_count" >${memberVo.member_follower_cnt}</span>
	                        </a>
	                        <p>팔로워</p>
	                    </li>
	                   
	                    <li>
	                        <a href="javascript:;" data-container="body" data-toggle="popover" data-placement="bottom" id="following_btn">
	                            <i class="rounded-x icon-user-following"></i>
	                            <span id="following_count">${memberVo.member_following_cnt}</span>
	                        </a>
	                        <p>팔로잉</p>
	                    </li>
	                </ul>
                </div>
        </div>
    </div>
	<!-- Content -->
	<div class="bg-color-light">
		<!-- container가 묶고 있음 -->
        <div class="container content profile">
            <div class="row">
            
            	<!-- Left Sidebar -->
				<jsp:include page="../template/left_sidebar.jsp"></jsp:include>
				
				<!-- Content -->
				<div class="col-md-8">
					<div class="sky-form">
				
						<fieldset>
						 <!-- Begin Service Block -->
					        <div class="row margin-bottom-40">
				                <div class="headline"><h3>여행지도</h3></div>
								<div id="map" style="width:100%;height:400px;margin-top:20px;"></div>
								<div class="headline"><h2 class="heading-sm" id="headerbtn" >작성한 일정</h2></div>
				                <div class="row brand-page margin-bottom-40">
				                    <div class="col-sm-6 col-md-3">
				                      <button class="btn btn-block btn-appnet" id="MyPlan">
										작성한 일정
				                      </button>
				                    </div>
				                    <div class="col-sm-6 col-md-3">
				                      <button class="btn btn-block btn-blogger" id="LikeBoard">
										좋아요
				                      </button>
				                    </div>
				                    <div class="col-sm-6 col-md-3">
				                      <button class="btn btn-block btn-bitbucket" id="TempBoard">
				                      	임시저장
				                      </button>
				                    </div>
				                    <div class="col-sm-6 col-md-3">
				                      <button class="btn btn-block btn-dribbble" id="MyWrite">
				                      	내가쓴글
				                      </button>
				                    </div>            
				                </div>
			                </div>

			                <div class='container content-sm'>
								<div id="listout">
								</div>
					        </div>      
						</fieldset>
					</div>	
				</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	
    <div id="pag1" class="text-center">
        <ul class="pagination">
            <li><button class="back btn-u" onclick="DownPage();">«</button></li>
            <li><button class="next btn-u" onclick="UpPage();">»</button></li>
            <!-- <li><a id="next" >»</a></li> -->
        </ul>                                                            
    </div>
    
</div>
	
	<!-- footer -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!-- General Unify Forms -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/trabab/resources/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/smoothScroll.js"></script>


<!-- JS Customization -->
<script type="text/javascript" src="/trabab/resources/assets/js/custom.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="/trabab/resources/assets/js/app.js"></script>

<!-- 달력 -->
<script src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/js/plugins/datepicker.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyADgNj6TzvR1SXpF4CdtkuM4NaaaM9zQmk" type="text/javascript"></script>


<script type="text/javascript">
    jQuery(document).ready(function() {   	 
    	App.init();
        Datepicker.initDatepicker();
        Start(PageNumber, SelectBoard);
        getAllMarker();
    }); 

/* 사진 upload */
    var index = 0;    
    function readURL1(input) {    	
    	if (input.files && input.files[0]) {    		
    		for(var i = 0; i < input.files.length; i++){
    			readURL2(input.files.item(i));
    		}    		
    	}
   	}
    function readURL2(file) {	
		var reader = new FileReader();		
		reader.onload = function (e) {
			index++;
			jQuery('#uploadimg_box').append('<div id="uploadimg_container"><img src="'+e.target.result +'" alt="" height="200px" id="uploadimg">'
					+'<button id="delete_img">삭제</button>'
					+'<input type="file" name="file" id="hidden_file'+index+'" class="hidden_file"></div>');
			//아..어렵다...
			console.log($('#hidden_file'+index)[0].files[0]);
			$('#hidden_file'+index)[0].files[0] = file;
			console.log($('#hidden_file'+index)[0].files[0].name);
		}
		reader.readAsDataURL(file);
	}
	 $(document).on('click', '#delete_img', function() {
	 	$(this).parent().remove();
     });
</script>

<!-- 게시글 -->
<script type="text/javascript">

	$('#MyPlan').on('click', function(){
		SelectBoard=1;
		Start(PageNumber, SelectBoard);
		$('#headerbtn').html('작성한 일정');
	});
	
	$('#LikeBoard').on('click', function(){
		SelectBoard=2;
		Start(PageNumber, SelectBoard);
		$('#headerbtn').html('좋아요');
	});
	
	$('#TempBoard').on('click',function(){
		SelectBoard=3;
		Start(PageNumber, SelectBoard);
		$('#headerbtn').html("임시저장");
	});
	
	$('#MyWrite').on('click',function(){
		SelectBoard=4;
		Start(PageNumber, SelectBoard);
		$('#headerbtn').html("내가쓴글");
	});
	
	function DownPage(){
		PageNumber--;
		Start(PageNumber,SelectBoard);
	}
	
	function UpPage(){
		PageNumber++;
		Start(PageNumber,SelectBoard);
	}
	
	var PageNumber = 1;
	var SelectBoard = 1;
	
	function Start(PageNumber,SelectBoard){
		$.ajax({
			url: './mypage_list.member',
			type:'post',
			data: {
				cpage: PageNumber,
				board_type: SelectBoard
			},
			dataType:'json',
			success: function(data) {
				 var str="";
					 
				for(var key in data) {
					console.log('key : ' + key);
					str += "<div class='row'>";
					str += "<div class='col-sm-7 sm-margin-bottom-40'>";
					str += "<div class='funny-boxes funny-boxes-top-red'>";
					str += "<div class='row'>";
					str += "<div class='col-md-4 funny-boxes-img easy-block-v1'>";
					
					if((data[key].board_theme) == "food") {						
						str += "<img class='img-responsive' src='/trabab/resources/uploadimg/"+data[key].board_image+"' alt='' style='height:120px' align='center'>";
						str += '<div class="easy-block-v1-badge rgba-purple">맛집</div>';
					}else if((data[key].board_theme) == "travel") {
						str += "<img class='img-responsive' src='/trabab/resources/uploadimg/"+data[key].board_image+"' alt='' style='height:120px' align='center'>";
						str += '<div class="easy-block-v1-badge rgba-purple">여행기</div>';
					
					}else if((data[key].board_theme) == "traveltip") {
						str += "<img class='img-responsive' src='/trabab/resources/assets/img/photogal_img/traveltip.jpg' alt='' style='height:120px' align='center'>";
						str += '<div class="easy-block-v1-badge rgba-purple">여행팁</div>';
					
					}else {
						str += '<img class="img-responsive" src="http://maps.googleapis.com/maps/api/staticmap?maptype=roadmap${markers}${path}&size=400x200&scale=2&key=AIzaSyCRFCfTV41SXWUpY8PfqyOnxPQKLyncTGk" alt=""  style="height:120px" align="center"/>';
						//str += "<img class='img-responsive' src='/trabab/resources/assets/img/main/img12.jpg' alt='' style='height:120px' align='center'>";
						str += '<div class="easy-block-v1-badge rgba-purple">일정</div>';
					}
					
					str += "<ul class='list-unstyled'>";
					
					if((data[key].board_theme) == "travel") {						
						str += "<li><i class='fa-fw fa fa-calendar-o'></i> "+data[key].board_etc1+" ~ "+data[key].board_etc2+"</li>";
					}else if((data[key].board_theme) == "plan") {
						str += "<li><i class='fa-fw fa fa-calendar-o'></i> "+data[key].board_etc1+" ~ "+data[key].board_etc2+"</li>";
					}else if((data[key].board_theme) == "food") {
						str += "<li><i class='fa-fw fa fa-calendar-o'></i> "+data[key].board_etc2+"</li>";
					}else {
						str += "<li><i class='fa-fw fa fa-calendar-o'></i> "+data[key].board_wdate+"</li>";
					}
					
					if((data[key].board_theme) == "traveltip") {
						str += "<li><i class='fa-fw fa fa-clipboard'></i>"+data[key].board_etc1+"</li>";	
					}else{
						str += "<li><i class='fa-fw fa fa-map-marker'></i>"+data[key].board_etc3+"</li>";						
					};
					str += "</ul>";
					str += "</div>";
					str += "<div class='col-md-8'>";
					str += "<h2><a href='./content_view."+data[key].board_theme+"?"+data[key].board_theme+"_no="+data[key].board_no+"'>"+data[key].board_subject+"</a></h2>";		
					
					if((data[key].board_theme) == "plan") {
						str += "<p><strong>[숙박 & 식사]</strong></p>";
						
					}else if((data[key].board_theme) == "food") {
						str += "<ul class='list-unstyled funny-boxes-rating'>";
						str += "<li><i class='fa fa-star" + ((data[key].board_etc1) == '0' ? "-o" : "") + "'></i></li>";
						str += "<li><i class='fa fa-star" + ((data[key].board_etc1) <= '1' ? "-o" : "") + "'></i></li>";
						str += "<li><i class='fa fa-star" + ((data[key].board_etc1) <= '2' ? "-o" : "") + "'></i></li>";
						str += "<li><i class='fa fa-star" + ((data[key].board_etc1) <= '3' ? "-o" : "") + "'></i></li>";
						str += "<li><i class='fa fa-star" + ((data[key].board_etc1) <= '4' ? "-o" : "") + "'></i></li>";
						str += "</ul>";
					}
					data[key].board_content = data[key].board_content.replace(/<[(img)][^>]*>/gi,"");
					str += "<div style=\"width:100%; height:100px; overflow:hidden;text-overflow:ellipsis;white-space:nowrap;\">";
					str += "<pre class='pre'>"+data[key].board_content+"</pre>";
					str += "</div>";
					str += "</div>";
					str += "</div>";
					str += "</div>";
					str += "</div>";
					str += "</div>";			
				}
				$('#listout').html(str);
			},
			error: function(){
				alert("서버에러");
			}
		});
	}
	$.ajax({
		url: 'get_follower_list.member',
		type: 'post',
		dataType: 'json',
		success: function(data) {
			var content = '<table class="table" style="width:100px;text-align:center;"><thead><tr><td>닉네임</td></tr></thead>';
			for(var index in data) {
				console.log(data[index]['member_nickname']);
				content += '<tbody><tr><td>' + data[index]['member_nickname'] + '</td></tr></tbody>';
			}
			content += '</table>';
			$('#follower_btn').popover({
				html: true,
				trigger: 'focus',
			
				content : content,
			});
		}
	})
	
	$.ajax({
		url: 'get_following_list.member',
		type: 'post',
		dataType: 'json',
		success: function(data) {
			var content = '<table class="table" style="width:100px;text-align:center;"><thead><tr><td>닉네임</td></tr></thead>';
			for(var index in data) {
				console.log(data[index]['member_nickname']);
				content += '<tbody><tr><td>' + data[index]['member_nickname'] + '</td></tr></tbody>';
			}
			content += '</table>';
			$('#following_btn').popover({
				html: true,
				trigger: 'focus',
				
				content : content,
			});
		
		}
	})

	
	/*////////////////////////////////////////////////// 마커 이미지, 문장, 경도위도 파트///////////////////////////////////////////////////////////////  */
	var contentArray = [];
	var iConArray = [];
	var markers = [];
	var iterator = 0;
	var map;
	var geocoder;
	var markerArray = [];
	console.log("진입확인1");
	function getAllMarker(){
		$.ajax({
			url: './mypage_map.member',
			type:'post',
			data: {
				
			},
			dataType:'json',
			success: function(data){
				for(var key in data) {
				console.log("진입확인2");
				contentArray[key] = key+"번마크";// marker icon 배열
				iConArray[key] = "http://maps.google.com/mapfiles/ms/micons/red-pushpin.png";// 마커 이미지 수정
				markerArray.push(new google.maps.LatLng(parseFloat(data[key].board_latitude), parseFloat(data[key].board_longitude)));
				}
				initialize();
				viewMarker();
				google.maps.event.trigger(map, 'resize'); 
			},
			error: function(){
				alert("서버에러");
			}
		});
	}
	
	
	function initialize() {
		geocoder = new google.maps.Geocoder();
		var mapOptions = {
			zoom: 6,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			center: new google.maps.LatLng(36.526075065327035,127.92623105000007)
		};

		map = new google.maps.Map(document.getElementById('map'),mapOptions);

 		var populationOptions = {
			strokeColor: '#000000',
			strokeOpacity: 0.8,
			strokeWeight: 2,
			fillColor: '#808080',
			fillOpacity: 0.5,
			map: map,
			center: new google.maps.LatLng(37.5172363,127.04732480000007) ,
			radius: $("#radius").val()*1000
		};
		cityCircle = new google.maps.Circle(populationOptions); 
	}	

	// 주소 검색
 	function showAddress() {
		var address = $("#address").val();
		geocoder.geocode({ 'address': address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map: map,
					position: results[0].geometry.location,
					draggable: true
				});
				google.maps.event.addListener(marker, "dragend", function(event) {
					var point = marker.getPosition();
					$("#latitude").val(point.lat());
					$("#longitude").val(point.lng());
	
					var populationOptions = {
						strokeColor: '#000000',
						strokeOpacity: 0.8,
						strokeWeight: 2,
						fillColor: '#808080',
						fillOpacity: 0.5,
						map: map,
						center: new google.maps.LatLng($("#latitude").val(),$("#longitude").val()) ,
						radius: $("#radius").val()*1000
					};
					if (cityCircle) {
						cityCircle.setMap(null);
					}
					cityCircle = new google.maps.Circle(populationOptions);
				});
	
				var lat = results[0].geometry.location.lat();
				var lng = results[0].geometry.location.lng();
	
				$("#latitude").val(lat);
				$("#longitude").val(lng);
	
				var populationOptions = {
					strokeColor: '#000000',
					strokeOpacity: 0.8,
					strokeWeight: 2,
					fillColor: '#808080',
					fillOpacity: 0.5,
					map: map,
					center: new google.maps.LatLng(lat,lng) ,
					radius: $("#radius").val()*1000
				};
				if (cityCircle) {
					cityCircle.setMap(null);
				}
				cityCircle = new google.maps.Circle(populationOptions);
	
			} else {
				alert('Geocode was not successful for the following reason: ' + status);
			}
		});
	} 

		// 드롭 마커 보기
 	function viewMarker() {
		for (var i = 0; i < markerArray.length; i++) {
			setTimeout(function() {
				addMarker();
			}, i * 300);
		}
		/* var marker = new google.maps.Marker({
			position : new google.maps.LatLng(37.5172363,130.04732480000007),
			map : map,
			draggable : true
		});

		google.maps.event.addListener(marker, "dragend", function(event) {
			var point = marker.getPosition();
			$("#latitude").val(point.lat());
			$("#longitude").val(point.lng());

			var populationOptions = {
				strokeColor : '#000000',
				strokeOpacity : 0.8,
				strokeWeight : 2,
				fillColor : '#808080',
				fillOpacity : 0.5,
				map : map,
				center : new google.maps.LatLng($("#latitude").val(), $("#longitude").val()),
				radius : $("#radius").val() * 1000
			};
			if (cityCircle) {
				cityCircle.setMap(null);
			}
			cityCircle = new google.maps.Circle(populationOptions);
		});
 */	} 

	// 마커 추가
	function addMarker() {
		console.log(markerArray[0]);
		var marker = new google.maps.Marker({
			position : markerArray[iterator],
			map : map,
			draggable : false,
			icon : iConArray[iterator],
			animation : google.maps.Animation.DROP
		});
		markers.push(marker);

		var infowindow = new google.maps.InfoWindow({
			content : contentArray[iterator]
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
		iterator++;
	}

	// 중심 이동
	function fnLocation(lat, lng) {
		myLocation = new google.maps.LatLng(lat, lng);
		map.setCenter(myLocation);
	}

	//google.maps.event.addDomListener(window, 'load', initialize);
	
</script>
</body>
</html>
