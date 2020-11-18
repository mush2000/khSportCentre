/* 페이지 로딩 후 실행 */

	$(document).ready(function(){
		setTimeout(function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
				center: new kakao.maps.LatLng(35.5248, 129.3362), // 지도의 중심좌표
				//center: new kakao.maps.LatLng(35.52266, 129.33794), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			function resizeMap() {
			    var mapContainer = document.getElementById('map');
			    mapContainer.style.width = '500px';
			    mapContainer.style.height = '500px'; 
			}
			
			var imageSrc = 'resources/images/mappin.png', // 마커이미지의 주소입니다    
			imageSize = new kakao.maps.Size(120, 90), // 마커이미지의 크기입니다
			imageOption = {offset: new kakao.maps.Point(30, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = new kakao.maps.LatLng(35.5248, 129.3362); // 마커가 표시될 위치입니다
			// markerPosition = new kakao.maps.LatLng(35.5228, 129.33783); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position: markerPosition, 
				image: markerImage // 마커이미지 설정 
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
			
			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		}, 2500);


		
	});
	

	

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);