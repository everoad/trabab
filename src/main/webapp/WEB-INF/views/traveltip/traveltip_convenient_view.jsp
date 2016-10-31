<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>TraBaB - 편의시설 찾기</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Web Fonts -->
    <!-- <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin"> -->

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
   width: 100%;
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

#img_div {
   text-align: right;
   margin-bottom: 5px;
}

 #autocomplete {
        position: absolute;
        top: 0px;
        left: 0px;
        width: 99%;
      }

#uploadimg_box {
   height: 206px;
   width: 100%;
   border: 1px solid gray;
   overflow-x: auto;
   overflow-y: hidden;
   white-space: nowrap;
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
   left: 80%;
}

/* #img_cancel button {
   margin-left: 10px;
} */

.hidden_file {
   display: none;
}

html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

#floating-panel {
   position: absolute;
   top: 10px;
   left: 25%;
   z-index: 5;
   background-color: #fff;
   padding: 5px;
   border: 1px solid #999;
   text-align: center;
   font-family: 'Roboto', 'sans-serif';
   line-height: 30px;
   padding-left: 10px;
}

#floating-panel {
   margin-left: -52px;
}

/* #map {
   height : 700px;
} */

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
   
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:15px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:relative;top:0;left:0;bottom:0;width:100%; height:300px; margin:10px 0 30px 10px;padding:5px;overflow-y:scroll;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap2 { position:relative;top:0;left:0;bottom:0;width:100%; height:100%; margin:0px 0 0px 0px; padding:5px;overflow-y:scroll;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:15px;border-radius: 10px;}

#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
/* #information_menu {height:300px;} */
#placesList li {list-style: none; }
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList2 .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}

#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;} 
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:45px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
   

</style>

<!-- 맵 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9bfd550c23d350b1064d8a9bc8212257&libraries=services"></script>
<script type="text/javascript" src="/trabab/resources/assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">

      <%if (session.getAttribute("isLogin") == null) {
            out.println("alert('로그인 후 사용해 주세요.');");
            out.println("location.href ='login_view.member?redirect=convenient_view.traveltip';");
            // 로그인 아되어있을 시 강제로 보내버림.
         } else {
            // 로그인 되어있는 상태라면 그냥 진행.
            //System.out.println(session.getAttribute("isLogin")); // true
            //System.out.println(session.getAttribute("mbemail"));
            //request.setAttribute("email", session.getAttribute("bmemail"));
            //System.out.println(session.getAttribute("mbno"));
         }
      %>
      

window.onload = function(){
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

var map = new daum.maps.Map(mapContainer, mapOption); 

// 지도를 생성합니다    

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
//searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces(search_keyword) {

    var keyword = search_keyword;
       //document.getElementById('keyword').value;
        //console.log(keyword);

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

        // 페이지 번호를 표출합니다
        //displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;
    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
   //console.log(places);
   //jsonArray의 json Object 형태로 들어오는데..json object의 형태가.
    var listEl = document.getElementById('placesList'), 
    //menuEl = document.getElementById('menu_wrap'),
   menuEl = document.getElementById("menu_wrap");
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    //console.log(places);
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
         places_obj = places[i];
            //console.log(places_obj.address);
           // console.log("만듬.");
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title, address, phone, newAddress, category) {
           
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
            daum.maps.event.addListener(marker, 'click', function() {         // 마커를 선택 했을때.    □■□■□■□■□■□■□■□■□■
               /* console.log(marker);
               console.log(title); */
               var option = document.getElementsByName("option");
               
               // 여기서 검색옵션으로 wifi 선택자인지 아닌지 판별.
               for (var i = 0; i < option.length; i++) {
                        if (option[i].checked) {
                           var check_option = option[i].value;
                        }
                  }
               
               
               if(check_option!="wifi"){
                   var el = document.createElement('li'), itemStr = '<div class="info">'
                     + '<span><h4><b>■ ' + title + '  ( 구분 / '+check_option+' )</b></h4></span>';

               if (places.newAddress) {
                  itemStr += '    <span>' + newAddress + '</span>'
                        + '   <span class="jibun gray">주 소 : ' + address
                        + '</span>';
               } else {
                  itemStr += '    <span>주 소 : ' + address + '</span></br>';
               }
               itemStr += '  <span class="tel">전 화 : ' + phone + '</span>'
                     + '</div>'
                     + '<div id="img_div" class="hidden-print"> <button type="button" id="my_placeslist" class="btn-u">삭제</button> </div>';

               el.innerHTML = itemStr;
               el.className = 'item';
                  
               //console.log("여까지임?ㅠㅠ");
               
               $('#placesList2').append(el);
               
               }else{
                  if (phone == "KT") {                                           // KT영역
                   var el = document.createElement('li'), itemStr = '</br>'
                         + '<div class="info">'
                         + '   <h4><b>■ ' + title + '</b>(<img id="img_cancel" src="/trabab/resources/assets/img/telecom/kt2.jpg">)'
                         +'</h4>';
                   itemStr += '    <span>주 소 : ' + address + '</span><br/>';
                   itemStr += '  <span class="tel">구 분 : ' + category
                         + '</span>' + '</div>'
                         + '<div id="img_div" class="hidden-print"> <button type="button" id="my_placeslist" class="btn-u">제거</button> </div>';

                   el.innerHTML = itemStr;
                   el.className = 'item';
                   $('#placesList2').append(el);
                   
                } else if (phone == "SKT") {                                       // SKT영역
                   var el = document.createElement('li'), itemStr = '</br>'
                   + '<div class="info">'
                   + '   <h4><b>■ ' + title + '</b>(<img src="/trabab/resources/assets/img/telecom/skt2.jpg">)</h4>';
                   itemStr += '    <span>주 소 : ' + address + '</span><br/>';
                   itemStr += '  <span class="tel">구 분 : ' + category
                         + '</span>' + '</div>'
                         + '<div id="img_div" class="hidden-print"> <button type="button" id="my_placeslist" class="btn-u">제거</button> </div>';

                   el.innerHTML = itemStr;
                   el.className = 'item';
                   $('#placesList2').append(el);
                   
                } else {                                                         // LGU+영역
                   var el = document.createElement('li'), itemStr = '</br>'
                   + '<div class="info">'
                   + '   <h4><b>■ ' + title + '</b>(<img src="/trabab/resources/assets/img/telecom/lguplus2.jpg">)</h4>';
                   itemStr += '    <span>주 소 : ' + address + '</span><br/>';
                   itemStr += '  <span class="tel">구 분 : ' + category
                         + '</span>' + '</div>'
                         + '<div id="img_div" class="hidden-print"> <button type="button" id="my_placeslist" class="btn-u">제거</button> </div>';

                   el.innerHTML = itemStr;
                   el.className = 'item';
                   $('#placesList2').append(el);
                }
               }
               
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
        })(marker, places[i].title, places[i].address, places[i].phone, places[i].newAddress, places[i].category);

        fragment.appendChild(itemEl);
        //console.log(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}
    //□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■여기까지함..
    $(document).on('click','#my_placeslist', function() {
      console.log("지워야해..");
      $(this).parent().parent().remove();
   });   
  //□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■여기까지함..

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
   
   //console.log(index);
   var option = document.getElementsByName("option");
   
   for (var i = 0; i < option.length; i++) {
            if (option[i].checked) {
               var check_option = option[i].value;
            }
      }
   
   //console.log(check_option+"이거선택함.");
   
   if (check_option != "wifi") {   // 공공와이파이 옵션이 아니라면. 
            var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
                  + (index + 1)
                  + '"></span>'
                  + '<div class="info">'
                  + '   <h5><b>' + places.title + '</b></h5>';

            if (places.newAddress) {
               itemStr += '    <span>' + places.newAddress + '</span>'
                     + '   <span class="jibun gray">' + places.address
                     + '</span>';
            } else {
               itemStr += '    <span>' + places.address + '</span>';
            }
            itemStr += '  <span class="tel">' + places.phone + '</span>'
                  + '</div>';

            el.innerHTML = itemStr;
            el.className = 'item';
      } else {   //공공와이파이 검색옵션을 선택했다면.
         
            if (places.phone == "KT") {                                           // KT영역
               var el = document.createElement('li'), 
                     itemStr = '<span class="markerbg marker_'+( index + 1 )+'"></span>'
                     + '<div class="info">'
                     + '   <h5><b>' + places.title + '</b><img src="/trabab/resources/assets/img/telecom/kt2.jpg"></h5   >';

               itemStr += '    <span>' + places.address + '</span>';
               itemStr += '  <span class="tel">' + places.category
                     + '</span>' + '</div>';

               el.innerHTML = itemStr;
               el.className = 'item';
            } else if (places.phone == "SKT") {                                       // SKT영역
               var el = document.createElement('li'), 
               itemStr = '<span class="markerbg marker_'+( index + 1 )+'"></span>'
               + '<div class="info">'
               + '   <h5><b>' + places.title + '</b><img src="/trabab/resources/assets/img/telecom/skt2.jpg"></h5   >';

               itemStr += '    <span>' + places.address + '</span>';
               itemStr += '  <span class="tel">' + places.category
                     + '</span>' + '</div>';

               el.innerHTML = itemStr;
               el.className = 'item';
            } else {                                                         // LGU+영역
               var el = document.createElement('li'), 
               itemStr = '<span class="markerbg marker_'+( index + 1 )+'"></span>'
               + '<div class="info">'
               + '   <h5><b>' + places.title + '</b><img src="/trabab/resources/assets/img/telecom/lguplus2.jpg"></h5   >';

               itemStr += '    <span>' + places.address + '</span>';
               itemStr += '  <span class="tel">' + places.category
                     + '</span>' + '</div>';

               el.innerHTML = itemStr;
               el.className = 'item';
            }

      
         }
         return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, idx, title) {
         var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
         imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
         imgOptions = {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset : new daum.maps.Point(13, 37)
         // 마커 좌표에 일치시킬 이미지 내에서의 좌표
         }, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
               imgOptions), marker = new daum.maps.Marker({
            position : position, // 마커의 위치
            image : markerImage
         });

         marker.setMap(map); // 지도 위에 마커를 표출합니다
         markers.push(marker); // 배열에 생성된 마커를 추가합니다

         return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
         }
         markers = [];
      }

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      /* function displayPagination(pagination) {
       var paginationEl = document.getElementById('pagination'),
       fragment = document.createDocumentFragment(),
       i; 

       // 기존에 추가된 페이지번호를 삭제합니다
       while (paginationEl.hasChildNodes()) {
       paginationEl.removeChild (paginationEl.lastChild);
       }

       for (i=1; i<=pagination.last; i++) {
       var el = document.createElement('a');
       el.href = "#";
       el.innerHTML = i;

       if (i===pagination.current) {
       el.className = 'on';
       } else {
       el.onclick = (function(i) {
       return function() {
       pagination.gotoPage(i);
       }
       })(i);
       }

       fragment.appendChild(el);
       }
       paginationEl.appendChild(fragment);
       } */

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
         var content = '<div style="padding:5px;z-index:1;">' + title
               + '</div>';

         infowindow.setContent(content);
         infowindow.open(map, marker);
      }

      // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {
         while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
         }
      }

      $('#search_button').on('click', function() {
         var keyword = document.getElementById("keyword").value;
         if (keyword == "") {
            alert('지역명을 입력해주세요.');
         } else {
            var option1 = document.getElementsByName("option");
            var option2 = "";
            //console.log(option1.length);

            for (var i = 0; i < option1.length; i++) {
               if (option1[i].checked) {
                  option2 = option1[i].value;
               }
            }
            //console.log(option2);
            if (option2 == "wifi") {
               console.log(keyword);   // 키워드 잘 받아오는지 확인.
               $.ajax({
                  url : 'searchWifi.traveltip',
                  data : {
                     keyword : keyword
                  },
                  type : 'post',
                  dataType : 'json',
                  success : function(data) {
                     //console.log("성공");
                     console.log("받아온 데이터 갯수 : " + data.length);
                     /* for (var i = 0; i < data.length; i++) {
                        console.log(data[i].address);
                     } */
                     displayPlaces(data);
                  },
                  
                  error : function(data) {
                     console.log("에러");
                  }
               });
            }
            /*    if($("#rtn1").attr('checked') == true) {
                  console.log("1번임");
               } */
            var search_keyword = keyword + " " + option2;
            //console.log("search_start()들어옴");
            //console.log(search_keyword);
            if (option2 != "wifi") {
               searchPlaces(search_keyword); // 해당 키워드로 검색 수행
            } 
         }
      });
      
      
      
   }

   // 검색 확인 버튼 눌렀을 시 
   /* function search_start() {
      // 편의 시설 검색 버튼 확인 시 호출
      var keyword = document.getElementById("keyword").value;
      var option = document.getElementById("rtn1").value;
      var search_keyword = keyword+" "+option;
      console.log("search_start()들어옴");
      
      //console.log(search_keyword);
      searchPlaces();
   } */
</script>
</head>

<body>
<div class="wrapper">

    <!--=== Header ===-->    
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--=== End Header ===-->


   <div class="breadcrumbs-v1 hidden-print" style="background: url(/trabab/resources/assets/img/photogal_img/convenient.jpg) no-repeat;  background-size:cover; background-position: center center;">
        <div class="container">
            <span>TRAVEL TIP</span>
            <h1>편의시설 찾기</h1>
        </div>
    </div>

   <!-- Content -->
   <div class="bg-color-light ">
      <!-- container가 묶고 있음 -->
        <div class="container content profile">
            <div class="row">
            
               <!-- Left Sidebar -->
               <div class="hidden-print">
            <jsp:include page="../template/left_sidebar.jsp"></jsp:include>
            </div>
            <div class="col-md-8 ">
                <!-- General Unify Forms -->
                <form action="#" class="sky-form">
                   <input type="hidden" name="latitude" id="latitude"/>
                   <input type="hidden" name="longitude" id="longitude"/>
                  
                  <fieldset class= "hidden-print">
                           <div class="headline">
                              <h1><b>편의시설 검색 </b></h1>
                           </div>
                              <label class="input"> <input id="keyword"
                                 type="text" placeholder="지역명을 입력하세요." style="width: 300px;" />
                              </label>
                              <br />
                              
                              <!-- <div id="radio1"> -->
                              
                              <table>
                                 <tr>
                                    <td width="150px;" height="60px;">
                                       <h4><input type="radio" id="rtn1" name="option" value="주차장" checked="checked"> 주차장 </input> </h4> &nbsp;
                                    </td>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn2" name="option" value="화장실"> 화장실 </input> </h4> &nbsp;
                                    </td>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn3" name="option" value="병원"> 병원 </input> </h4> &nbsp;
                                    </td>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn4" name="option" value="은행"> 은행 </input> </h4> &nbsp;
                                    </td>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn5" name="option" value="렌터카"> 렌터카 </input> </h4> &nbsp;
                                    </td>
                                    </tr>
                                    <tr>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn6" name="option" value="경찰서">    경찰서 </input></h4> &nbsp;
                                    </td>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn7" name="option" value="소방서"> 소방서 </input> </h4>&nbsp;
                                    </td>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn8" name="option" value="시장"> 시장 </input> </h4>&nbsp;
                                    </td>
                                    <td width="150px;">
                                       <h4><input type="radio" id="rtn10" name="option" value="wifi"> 공공 와이파이<br/></h4> &nbsp;&nbsp;&nbsp;&nbsp;(읍/면/동 단위 검색) </input> &nbsp;
                                    </td>
                                 </tr>
                              </table>
                              <br/>
                              <div align="center">
                        <button type="button" id="search_button" class="btn-u" style="width:300px; "><b> 편의시설 검색 </b></button>
                        </div>      <!-- </div> -->
                     <br/>
                  </fieldset>
                  <br/ class="hidden-print">   <!-- 후기 지도 부분 -->
                  <fieldset style="height:1000px;" class="hidden-print">
                       <section>
                          <!-- Begin Content -->
                             <div class="hidden-print">
                                 <!-- Basic Map -->
                                 <div class="headline hidden-print"><h2><b>검색 결과 [ 지도에서 인쇄를 원하는 장소의 마커를 클릭해주세요 ] </b></h2></div>
                              
                              <div class="map_wrap">
                                 <div id="map" class="hidden-print"
                                    style="width: 100%; height: 100%; position: relative; overflow: hidden;">
                                 </div>
                                 <br/>
                                 <div id="menu_wrap" class="bg_white hidden-print">
                                    <!-- <div class="option">
                                       <div>
                                           <form onsubmit="searchPlaces(); return false;">
                                             키워드 : <input type="text" value="이태원 맛집" id="keyword2"
                                                size="15">
                                             <button type="submit">검색하기</button>
                                          </form> 
                                       </div>
                                    </div> -->
                                    <hr>
                                    <ul id="placesList"></ul>
                                    <!-- <div id="pagination"></div> -->
                                 </div>
                              </div>
                              <!-- <div id="information_menu" >
                              </div> -->
                              <!-- <div id="map" style="width:100%; height:700px;"></div> -->
                              <!-- <input type="text" id="pac-input"> -->
                                <!-- <div id="map" class="map margin-bottom-50"></div> -->
                                 <!-- End Basic Map -->
                             </div>
                       <!-- End Content -->
                          </section>
                  </fieldset>
                  <fieldset>
                     <section>
                         <div class="headline"><h3> <B>나의 편의시설 리스트</B></h3></div>
                         <div id="menu_wrap2" class="bg_white">
                            <ul id="placesList2"></ul>
                         </div>
                        <div align="center" class="hidden-print">
                                <button  type="button" id="print_button" class="btn-u" style="width:300px; "> 나의 편의시설 리스트 프린트하기</button></td>
                        </div>   
                     </section>
                  </fieldset>
                  
                  <!-- <fieldset>
                        <section>
                            <div class="headline"><h3>여행 제목</h3></div>
                            <label class="input">
                                <input type="text" id="gtsubject">
                            </label>
                        </section>
                        
                        장소검색 부분이 들어가야함..
                        <section>
                           <div class="headline"><h3>여행 장소 : </h3></div>
                           <label class="input"> 
                              <input type="text" id="autocomplete" onfocus="geolocate()" placeholder="장소를 검색하세요.">
                           </label>
                        </section>

                       
                     <section>
                         <div class="headline"><h3>여행 일정</h3></div>
                         <div class="row">
                             <section class="col col-6">
                                 <label class="input">
                                     <i class="icon-append fa fa-calendar"></i>
                                     <input type="text" name="start" id="start"  placeholder="Start date">
                                 </label>
                             </section>
                             <section class="col col-6">
                                 <label class="input">
                                     <i class="icon-append fa fa-calendar"></i>
                                     <input type="text" name="finish" id="finish"  placeholder="Expected finish date">
                                 </label>
                             </section>
                         </div>
                     </section>
                     
                     <section>
                            <div class="headline"><h3>한줄 내용</h3></div>
                            <label class="input">
                                <input id="gtcontent" type="text">
                            </label>
                        </section>
                           <div class="headline"><h4> [주의사항] 게시물 등록 시 사용자의 이메일이 노출 됩니다.</h4></div>
                  </fieldset> -->
                </form>                
            </div>
         </div>
      </div>
   </div>
   
   <!-- <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div> -->
   <!-- footer -->
   <div class="hidden-print">
   <jsp:include page="../template/footer.jsp" ></jsp:include>
   </div>
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
	 $(document).on('click', '#delete_img', function() {
	 	$(this).parent().remove();
     });
    
	 $('#print_button').click(function(){
         window.print();
     });
	//End ImageUpload
</script>
</body>
</html>
