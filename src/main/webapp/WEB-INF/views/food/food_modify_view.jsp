<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <title>TraBaB - 맛집 후기 작성</title>

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
    <link rel="stylesheet" href="/trabab/resources/assets/css/jquery.rateyo.min.css"/>
    
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
 	#uploadimg_box{
 		height:206px;
 	 	width:100%;
 	 	border: 1px solid gray;
 	 	overflow-x: auto;
 	 	overflow-y: hidden;
 	 	white-space:nowrap;
  	}
 	
 	 #uploadimg_container {
	     width: 200px;
	     height: 200px;
	     position: relative;
	     overflow: hidden;
	     display: inline-block;
    }

    #uploadimg_container img {
    	margin: 3px;
	    height: 200px;
	    position: relative;
    }
    #uploadimg_container button {
	    position: absolute;
	    top: 3px;
	    left: 70%;
    }
 	
 	.hidden_file{
 		display : none;
 	}
 	</style>
 	
    <script type="text/javascript">
    <%
	if(session.getAttribute("isLogin") == null) {
		out.println("alert('로그인 후 사용해 주세요.');");
		out.println("location.href ='login_view.member?redirect=write_view.food';");
	}
	%>
    </script>
</head>

<body>
<div class="wrapper">
	<jsp:include page="../template/header.jsp"></jsp:include>
	
    <!--=== Breadcrumbs ===-->
	
	<div class="breadcrumbs-v1"  style="background: url(/trabab/resources/assets/img/photogal_img/writetasty.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
            <span>TASTY STORY 작성</span>
            <h1>[ ${foodVo.member_nickname }님의 맛집 수정하기 ]</h1>
        </div>
    </div>

	<!-- Content -->
	<div class="bg-color-light">
		<!-- container가 묶고 있음 -->
        <div class="container content">
            <div class="row">
            
            	<!-- Left Sidebar -->
				<jsp:include page="../template/left_sidebar.jsp"></jsp:include>


				<div class="col-md-8">
				    <!-- General Unify Forms -->
				    <form action="writeOk.food" method="post" class="sky-form">
				       	<input type="hidden" name="latitude" id="latitude" value="${foodVo.food_latitude }"/>
				    	<input type="hidden" name="longitude" id="longitude" value="${foodVo.food_longitude }"/>
				    	<input type="hidden" name="food_image" id="food_image" value="${foodVo.food_image}" />
				       	<!-- 후기 상단 부분 -->
				        <fieldset>
				        	<section>
            					<h5 style="float:right">작성일: ${foodVo.food_wdate }</h5>
        					</section>
				            <section>
				                <div class="headline"><h3>제목</h3></div>
				                <label class="input">
				                    <input type="text" name="bdsubject" value="${foodVo.food_subject }">
				                </label>
				            </section>
				
							<section>
								 <div class="headline"><h3>일정</h3></div>
								 <div class="row">
								     <section class="col col-6">
								         <label class="input">
								             <i class="icon-append fa fa-calendar"></i>
								             <input type="text" name="bddate" id="date" placeholder="Date" value="${foodVo.food_schedule }">
								         </label>
								     </section>
								 </div>
							</section>
						</fieldset>
						
						<!-- 후기 지도 부분 -->
						<fieldset>
				        	<section>
			              	<!-- Begin Content -->
				           		<div>
					                  <!-- Basic Map -->
					                  <div class="headline"><h3>여행 장소</h3></div>
					                  <input type="text" id="pac-input" value="${foodVo.food_address }">
						              <div id="map" class="map margin-bottom-20"></div>
						              <label class="input">
					                 	 <input type="hidden" readonly id="address" name="bdaddress" value="${foodVo.food_location_name }">
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
				               		<div class="button" style="z-index:10"><input type="file" id="file" onchange="uploadImg1(this);"  multiple>Browse</div>
				                </label>
				                
				                <div id="uploadimg_box">
				                	<c:forEach items="${foodVo.food_image_list }" var="to">
				                		<div id="uploadimg_container">
				                			<img src="/trabab/resources/uploadimg/${to.food_image_name }" alt="" height="200px" id="uploadimg">
	            							<button id="delete_before_img" class="delete_before_img" data-name="${to.food_image_name }">삭제</button>
				                		</div>
				                	</c:forEach>
				                </div>
				            </section>
				            
				            <section>
				                 <div class="headline"><h3>맛집 후기</h3></div>
				                <label class="textarea">
				                    <textarea rows="10" name="bdcontent">${foodVo.food_content }</textarea>
				                </label>
				            </section>
				           
				            <section>
		                            <div class="headline"><h3>별점주기</h3></div>
		                            <div class="rating col-md-6">
		                                <input type="radio" name="tasty-rating" id="tasty5" value="5" ${(foodVo.food_lvtasty == "5") ? "checked" : "" }>
		                                <label for="tasty5"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="tasty-rating" id="tasty4" value="4" ${(foodVo.food_lvtasty == "4") ? "checked" : "" }>
		                                <label for="tasty4"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="tasty-rating" id="tasty3" value="3" ${(foodVo.food_lvtasty == "3") ? "checked" : "" }>
		                                <label for="tasty3"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="tasty-rating" id="tasty2" value="2" ${(foodVo.food_lvtasty == "2") ? "checked" : "" }>
		                                <label for="tasty2"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="tasty-rating" id="tasty1" value="1" ${(foodVo.food_lvtasty == "1") ? "checked" : "" }>
		                                <label for="tasty1"><i class="fa fa-star"></i></label>
										맛
		                            </div>
		                            
		                            <div class="rating col-md-6">
		                                <input type="radio" name="traffic-rating" id="traffic5" value="5" ${(foodVo.food_lvtraffic == "5") ? "checked" : "" }>
		                                <label for="traffic5"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="traffic-rating" id="traffic4" value="4" ${(foodVo.food_lvtraffic == "4") ? "checked" : "" }>
		                                <label for="traffic4"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="traffic-rating" id="traffic3" value="3" ${(foodVo.food_lvtraffic == "3") ? "checked" : "" }>
		                                <label for="traffic3"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="traffic-rating" id="traffic2" value="2" ${(foodVo.food_lvtraffic == "2") ? "checked" : "" }>
		                                <label for="traffic2"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="traffic-rating" id="traffic1" value="1" ${(foodVo.food_lvtraffic == "1") ? "checked" : "" }>
		                                <label for="traffic1"><i class="fa fa-star"></i></label>
										교통			
		                            </div>
		                            
		                            <div class="rating col-md-6">
		                                <input type="radio" name="service-rating" id="service5" value="5" ${(foodVo.food_lvservice == "5") ? "checked" : "" }>
		                                <label for="service5"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="service-rating" id="service4" value="4" ${(foodVo.food_lvservice == "4") ? "checked" : "" }>
		                                <label for="service4"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="service-rating" id="service3" value="3" ${(foodVo.food_lvservice == "3") ? "checked" : "" }>
		                                <label for="service3"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="service-rating" id="service2" value="2" ${(foodVo.food_lvservice == "2") ? "checked" : "" }>
		                                <label for="service2"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="service-rating" id="service1" value="1" ${(foodVo.food_lvservice == "1") ? "checked" : "" }>
		                                <label for="service1"><i class="fa fa-star"></i></label>
										서비스			
		                            </div>
		                            
		                            <div class="rating col-md-6">
		                                <input type="radio" name="price-rating" id="price5" value="5" ${(foodVo.food_lvprice == "5") ? "checked" : "" }>
		                                <label for="price5"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="price-rating" id="price4" value="4" ${(foodVo.food_lvprice == "4") ? "checked" : "" }>
		                                <label for="price4"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="price-rating" id="price3" value="3" ${(foodVo.food_lvprice == "3") ? "checked" : "" }>
		                                <label for="price3"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="price-rating" id="price2" value="2" ${(foodVo.food_lvprice == "2") ? "checked" : "" }>
		                                <label for="price2"><i class="fa fa-star"></i></label>
		                                <input type="radio" name="price-rating" id="price1" value="1" ${(foodVo.food_lvprice == "1") ? "checked" : "" }>
		                                <label for="price1"><i class="fa fa-star"></i></label>
										가성비			
		                            </div>
		                            
		                            <div class="rating col-md-6">
			                            <input type="radio" name="trophies-rating" id="trophies5" value="5" ${(foodVo.food_lvhonbab == "5") ? "checked" : "" }>
		                                <label for="trophies5"><i class="fa fa-trophy"></i></label>
		                                <input type="radio" name="trophies-rating" id="trophies4" value="4" ${(foodVo.food_lvhonbab == "4") ? "checked" : "" }>
		                                <label for="trophies4"><i class="fa fa-trophy"></i></label>
		                                <input type="radio" name="trophies-rating" id="trophies3" value="3" ${(foodVo.food_lvhonbab == "3") ? "checked" : "" }>
		                                <label for="trophies3"><i class="fa fa-trophy"></i></label>
		                                <input type="radio" name="trophies-rating" id="trophies2" value="2" ${(foodVo.food_lvhonbab == "2") ? "checked" : "" }>
		                                <label for="trophies2"><i class="fa fa-trophy"></i></label>
		                                <input type="radio" name="trophies-rating" id="trophies1" value="1" ${(foodVo.food_lvhonbab == "1") ? "checked" : "" }>
		                                <label for="trophies1"><i class="fa fa-trophy"></i></label>
										혼밥 레벨		
		                            </div>
	                       </section>
                        </fieldset>
				         
				        <fieldset> 
                            
                            <section>
				                <div class="headline"><h3>태그달기</h3></div>
				                <label class="input">
				                    <input type="text" name="hashtag" id="hashtag" value="${foodVo.food_hashtag }" placeholder="태그와 태그는 쉼표로 구분하며 최대 5개 까지 입력 가능합니다.">
				                </label>
				            </section>
                            
				        </fieldset>
				        
				        <footer>
				        	<div align="center">
				            <button type="submit" class="btn-u" style="padding-right:100px; padding-left:100px" id="complete">수정 완료</button>
							</div>
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
         jQuery('#uploadimg_box').append('<div id="uploadimg_container"><img src="'+e.target.result +'" alt="" height="200px" id="uploadimg">'
               +'<button id="delete_img" class="btn-u btn-u-default delete_img" data-index="'+index+'">삭제</button></div>');
         formdata.append('files['+index+']', file);
      }
      reader.readAsDataURL(file);
      index++;
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
       formdata.append('food_no', <%=request.getParameter("food_no")%>);
       formdata.append('food_image', $('#food_image').val());
       formdata.append('food_subject', $('[name=bdsubject]').val());
       formdata.append('food_content', $('[name=bdcontent]').val());
       formdata.append('food_schedule', $('#date').val());
       formdata.append('food_address', $('#pac-input').val());
       formdata.append('food_location_name', $('#address').val());
       formdata.append('food_latitude', $('[name=latitude]').val());
       formdata.append('food_longitude', $('[name=longitude]').val());
       formdata.append('food_lvtasty', $('[name=tasty-rating]:checked').val());
       formdata.append('food_lvtraffic', $('[name=traffic-rating]:checked').val());
       formdata.append('food_lvservice', $('[name=service-rating]:checked').val());
       formdata.append('food_lvprice', $('[name=price-rating]:checked').val());
       formdata.append('food_lvhonbab', $('[name=trophies-rating]:checked').val());
       formdata.append('food_hashtag', $('#hashtag').val());
       
       $.ajax({
            url: './modifyOk.food',
            type: 'post',
            data :  formdata,
            dataType: 'json',
            processData: false, 
             contentType: false, 
            success: function(data) {
				location.href="content_view.food?food_no="+data['food_no'];
            },
            error: function() {
               alert("글수정에 실패했습니다.");
            }
         })
       e.preventDefault();
    });
	//End ImageUpload
</script>

<script>
	//google map api
	function initAutocomplete() {
		var init_loc = {lat: parseFloat($('#latitude').val()), lng: parseFloat($('#longitude').val())};
		var map = new google.maps.Map(document.getElementById('map'), {
			center: init_loc,
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		});
		
		var marker = new google.maps.Marker({
		    position: init_loc,
		    map: map
		});
		
		// Create the search box and link it to the UI element.
		var input = document.getElementById('pac-input');
		var searchBox = new google.maps.places.SearchBox(input);
		map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
		
		// Bias the SearchBox results towards current map's viewport.
		map.addListener('bounds_changed', function() {
			searchBox.setBounds(map.getBounds());
		});
		
		var markers = [];
		// [START region_getplaces]
		// Listen for the event fired when the user selects a prediction and retrieve
		// more details for that place.
		
		searchBox.addListener('places_changed', function() {
			var places = searchBox.getPlaces();
			
			if (places.length == 0) {
				return;
			}
			
			// Clear out the old markers.
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			markers = [];
			
			// For each place, get the icon, name and location.
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
				
				 // Create a marker for each place.
				markers.push(new google.maps.Marker({
					map: map,
					icon: icon,
					title: place.name,
					position: place.geometry.location
				}));
				
				if (place.geometry.viewport) {
				   // Only geocodes have viewport.
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

<!-- 해쉬태그 -->

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
               if(tagArr[index] == ''){
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