<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=39f45150-43d1-386e-9557-cd82ccc3e59e"></script>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
 		$(document).ready(function(){
 			var map;
 	           
            var endPointX = ${pointX};
         	var endPointY = ${pointY};
         	
             //pr_3857 인스탄스 생성.
             var pr_3857 = new Tmap.Projection("EPSG:3857");
  
             //pr_4326 인스탄스 생성.
             var pr_4326 = new Tmap.Projection("EPSG:4326");
             //좌표 변환 함수
             function get3857LonLat(coordX, coordY){
                 return new Tmap.LonLat(coordX, coordY).transform(pr_4326, pr_3857);
             }
             
             map = new Tmap.Map({div:'map_div', width:"600px", height:"400px", animation:true}); 
                 
                
             //좌표계 변환
             var trans = get3857LonLat(endPointX, endPointY);
             var transX = trans.lon;
             var transY = trans.lat;
                 
             //lonlat 인스턴스 생성.
             var lonlat = new Tmap.LonLat(transX, transY);
                 
             //marker 생성 및 옵션 설정 
             var markers = new Tmap.Layer.Markers( "MarkerLayer" );
             map.addLayer(markers);
  
             var size = new Tmap.Size(24,38);
             var offset = new Tmap.Pixel(-(size.w/2), -size.h);
             var icon = new Tmap.Icon('https://developers.skplanetx.com/upload/tmap/marker/pin_b_m_a.png', size, offset);  
    
             //marker 지도에 표시
             var marker = new Tmap.Marker(lonlat, icon);
             markers.addMarker(marker);
                 
             //요청된 좌표에 중앙을 맞춰준다.(좌표,줌레벨)
             map.setCenter(lonlat,15);
        });
           
        </script>
</head>
<body>
	<div id="map_div"></div>
	<button>길찾기</button>
</body>
</html>