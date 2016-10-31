<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB - 여행 일정 작성</title>

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
  	
	.delete_plan{
		position : relative;
		float: right;
	}

 	
 	</style>
    <script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">
    <%
	if(session.getAttribute("isLogin") == null) {
		out.println("alert('로그인 후 사용해 주세요.');");
		out.println("location.href ='login_view.member?redirect=write_view.plan';");
	}
	%>

    </script>
</head>

<body>
<div class="wrapper">

 	<jsp:include page="../template/header.jsp"></jsp:include>


	<div class="breadcrumbs-v1"  style="background: url(/trabab/resources/assets/img/photogal_img/writeplan.jpg) no-repeat fixed; background-size: 100%">
        <div class="container">
            <span>WRITE STORY</span>
             <h1>[ ${member_nickname }님의 여행 일정 작성하기 ]</h1>
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
				<div class="col-md-9">
				<form action="writeOk.plan" class="sky-form" method="post">
					<!-- 후기 상단 부분 -->
			        <fieldset>
			            <section>
			                <div class="headline"><h3>여행 제목</h3></div>
			                <label class="input">
			                    <input type="text" name="plan_subject">
			                </label>
			            </section>
			
						<section>
							 <div class="headline"><h3>여행 일정</h3></div>
							 <div class="row">
							     <section class="col col-6">
							         <label class="input">
							             <i class="icon-append fa fa-calendar"></i>
							             <input type="text" name="plan_schedule_start" id="start" placeholder="시작 날짜">
							         </label>
							     </section>
							     <section class="col col-6">
							         <label class="input">
							             <i class="icon-append fa fa-calendar"></i>
							             <input type="text" name="plan_schedule_end" id="finish" placeholder="끝나는 날짜">
							         </label>
							     </section>
							 </div>
						</section>
					</fieldset>
										
	                <!-- Accordion v1 -->                
	                <div class="panel-group acc-v1" id="accordion-1">
	                    <div class="panel panel-default" id="panel-0">
	                        <div class="panel-heading" onclick="reloadMap(0)">
	                            <!-- <h4 class="panel-title"> -->
	                           
	                           	<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-1" href="#collapse-0">
	                               	일정 1
	                            </a>
	                        
	                            <!-- </h4> -->
	                        </div>
	                        
	                        <div id="collapse-0" class="panel-collapse collapse in">
	                            <div class="panel-body">
	                                <div class="row">
	                                <!-- 작성 시작 -->
								    	<input type="hidden" name="planBodyVoList[0].plan_latitude" id="latitude-0"/>
								    	<input type="hidden" name="planBodyVoList[0].plan_longitude" id="longitude-0"/>
																			<!-- 후기 지도 부분 -->
										<fieldset>
								        	<section>
							              	<!-- Begin Content -->
								           		
								                  <!-- Basic Map -->
								                  <button class="delete_plan btn-u" id="delete" onclick="deletePlan(0)">삭제</button>
								                  <div class="headline"><h3>여행 장소</h3></div>
								                  <input type="text" id="pac-input" class="pac-input-0" name="planBodyVoList[0].plan_address">
									              <div id="map" class="map margin-bottom-10 map-0"></div>
								                  <input type="hidden" id="address-0" name="planBodyVoList[0].plan_location_name">
								                  <!-- End Basic Map -->
								            
							              <!-- End Content -->
							           		</section>
										</fieldset>
																				
										<!-- 후기 하단부분. -->
								      	<fieldset>
								            <section>
									            <div class="row">
												    <section class="col col-6">
							  					        <label class="input">
				                                            <i class="icon-append fa fa-calendar"></i>
				                                            <input type="text" name="planBodyVoList[0].plan_schedule" id="date-0"  placeholder="여행 날짜 선택">
				                                        </label>
			                                        </section>
                                    			</div>
                                    			     
								                <div class="headline"><h3>비 용</h3></div>
								                <label class="textarea">
								                    <textarea rows="2"  name="planBodyVoList[0].plan_price"></textarea>
								                </label>
								        
								                <div class="headline"><h3>교 통</h3></div>
								                <label class="textarea">
								                    <textarea rows="2"  name="planBodyVoList[0].plan_traffic"></textarea>
								                </label>
						                
						                	    <div class="headline"><h3>숙박 & 식사</h3></div>
								                <label class="textarea" >
								                    <textarea rows="2"  name="planBodyVoList[0].plan_lodge_meal"></textarea>
								                </label>
							            
							                    <div class="headline"><h3>메 모</h3></div>
								                <label class="textarea">
								                    <textarea rows="2"  name="planBodyVoList[0].plan_memo"></textarea>
								                </label>
								                
								            </section>
								        </fieldset>
								        
					    
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                   	                    
	                </div>
					<!-- END Accordion -->
					<section>
						<button id="plusbtn" class="btn-u btn-u-lg btn-block">추가</button>
						<input type="submit" value="완료" class="btn-u  btn-u-orange btn-u-lg col-md-6"/>
						<button type="button" class="btn-u btn-u-default btn-u-lg col-md-6" onclick="window.history.back();">Back</button>
					</section>
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

<!-- 달력 -->
<script src="/trabab/resources/assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/trabab/resources/assets/js/plugins/datepicker.js"></script>

<!-- 맵 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvf8EbTmo_Qg0QfGidlU5WD_f_0hhhudo&libraries=places&callback=initAutocomplete"
        async defer></script> 



<script type="text/javascript">
    $(function() {
    	App.init();
		Datepicker.initDatepicker();
		Datepicker.reloadDatePicker(0);
    }); 
</script>

<script>
	var plus = 1;
	$('#plusbtn').on('click', function(e) {
		
		e.preventDefault();
				
		var size = $('.panel').size();
		
		if(size == 10)
			return;

		$('#accordion-1').append('<div class="panel panel-default"  id="panel-'+plus+'"><div class="panel-heading" onclick="reloadMap('+plus+')">'
                +'<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-1" href="#collapse-'+plus+'">'
                +'일정 ' + (size + 1) + '</a></div><div id="collapse-'+plus+'" class="panel-collapse collapse">'
                +'<div class="panel-body"><div class="row">'
                +'<input type="hidden" name="planBodyVoList['+plus+'].plan_latitude" id="latitude-'+plus+'"/><input type="hidden" name="planBodyVoList['+plus+'].plan_longitude" id="longitude-'+plus+'"/>'
                +'<fieldset><section><div><button class="delete_plan btn-u" id="delete" onclick="deletePlan('+plus+')">삭제</button>'
                +'<div class="headline"><h3>여행 장소</h3></div><input type="text" id="pac-input" class="pac-input-'+plus+'" name="planBodyVoList['+plus+'].plan_address">'
                +'<div id="map" class="map margin-bottom-10 map-'+plus+'"></div><input type="hidden" id="address-'+plus+'" name="planBodyVoList['+plus+'].plan_location_name">'
                +'</div></section></fieldset>'
                +'<fieldset><section><div class="row"><section class="col col-6">'
				+'<label class="input"><i class="icon-append fa fa-calendar"></i><input type="text" name="planBodyVoList['+plus+'].plan_schedule" id="date-'+plus+'" placeholder="여행 날짜 선택"></label></section></div>'
                +'<div class="headline"><h3>비 용</h3></div>'
        		+'<label class="textarea"><textarea rows="2"  name="planBodyVoList['+plus+'].plan_price"></textarea></label><div class="headline"><h3>교 통</h3></div>'
        		+'<label class="textarea"><textarea rows="2"  name="planBodyVoList['+plus+'].plan_traffic"></textarea></label>'
        		+'<div class="headline"><h3>숙박 & 식사</h3></div><label class="textarea" ><textarea rows="2"  name="planBodyVoList['+plus+'].plan_lodge_meal"></textarea>'
        		+'</label><div class="headline"><h3>메 모</h3></div><label class="textarea">'
        		+'<textarea rows="2"  name="planBodyVoList['+plus+'].plan_memo"></textarea></label></section></fieldset>'
                +'</div></div></div></div>');

		Datepicker.reloadDatePicker(plus);
		initAutocomplete(plus);
		plus++;
	});

	
	var mapArr = [];
	
	function initAutocomplete(plus) {

		if(plus == null)
			plus = 0;

		mapArr.push(new google.maps.Map($('.map-' + plus)[0], {
			center: {lat: 36.2530726, lng: 127.9910263},
			zoom: 7,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
		}));

		var input = $('.pac-input-' + plus)[0];
		var searchBox = new google.maps.places.SearchBox(input);
		mapArr[plus].controls[google.maps.ControlPosition.TOP_LEFT].push(input);
		
		mapArr[plus].addListener('bounds_changed', function() {
			searchBox.setBounds(mapArr[plus].getBounds());
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
				//$('body').append('<img src="'+place.photos[0].getUrl({'maxWidth': 200, 'maxHeight': 200})+'" alt="" />'); 
				
				$('#latitude-' + plus).val(place.geometry.location.lat());
				$('#longitude-' + plus).val(place.geometry.location.lng());
				$('#address-' + plus).val(place.name);
				
				var icon = {
				    url: place.icon,
				    size: new google.maps.Size(71, 71),
				    origin: new google.maps.Point(0, 0),
				    anchor: new google.maps.Point(17, 34),
				    scaledSize: new google.maps.Size(25, 25)
				 };
				
				markers.push(new google.maps.Marker({
					map: mapArr[plus],
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

			mapArr[plus].fitBounds(bounds);
		});
	}

	function reloadMap(plus) {

		setTimeout(function() {
			google.maps.event.trigger(mapArr[plus], 'resize');
		}, 0);
		
	}
	
	function deletePlan(plus) {
		$('#panel-' + plus).remove();
		
		delete mapArr[plus];
		
		$('.accordion-toggle').each(function(index) {
			$(this).html('일정 ' + (index + 1));
		});
	}
	
	
	
	
</script>

<!--[if lt IE 9]>
    <script src="/trabab/resources/assets/plugins/respond.js"></script>
    <script src="/trabab/resources/assets/plugins/html5shiv.js"></script>
    <script src="/trabab/resources/assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
