	/********* 구글 지오로케이션 ********/
	let map, marker, infoWindow, geocoder, searchLatLng;
	
	// 마커 지우기 위한 배열
	let markers = [];
	
	function initMap() {
		// 기본 샘플 주소 값: 스인개
		let smhrd = {lat: 35.14972, lng: 126.91987};
	
		// 지도 켜기 
		// 지도 중괄호 속성
		map = new google.maps.Map(document.getElementById("map"),{
			center: smhrd,
		    zoom: 15,
		    zoomControlOptions: {
		      position: google.maps.ControlPosition.LEFT_CENTER,
		    },
		    scaleControl: true,
		    fullscreenControl: true,
		    mapTypeControl: false,
		    streetViewControl: false,
		 });
		
		// 위치 검색할 버튼 만들기
		const locationButton = document.createElement("button");
		
 	 	locationButton.textContent = "위치 검색";
 		locationButton.classList.add("custom-map-control-button");
 		map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
 		// 위치 검색 버튼 눌리면 Geolocation 실행
 		locationButton.addEventListener("click", () => {
 			doGeolocation(); 
 		});
		
		
		// infoWindow 객체 생성: 주로 위치 풍선 보여줌
		infoWindow = new google.maps.InfoWindow();
		
		// 기본 마커 띄우기 - 마커 클릭하면 현재위치 주소 infoWindow
		addMarker(smhrd);
		
		
		// reverseGeocoding 관련 객체 생성
		geocoder = new google.maps.Geocoder();
		
		
		// 지도에 원하는 부분 클릭하면 새 마커 나오게 하기
		google.maps.event.addListener(map, 'click', function(event) {
			deleteMarkers();
			infoWindow.close();
			searchedCoords(event.latLng);
			addMarker(event.latLng);
			geocodeLatLng(geocoder, map, infoWindow);
		});

	}
	// 여기까지가 initMap() 함수 : 지도, 마커, 위치 검색의 버튼 생성  
	
	
	// 지오로케이션 함수
	function doGeolocation() {
 		if (navigator.geolocation) {
		      navigator.geolocation.getCurrentPosition(
		        (position) => {
		          const pos = {
		            lat: position.coords.latitude,
		            lng: position.coords.longitude,
		          };

		          infoWindow.setPosition(pos);
		          infoWindow.open(map);
		  	      map.setZoom(17);
		  		  map.setCenter(pos);

		  	    
		  	 	// reverseGeocoding 관련 객체 생성
		  		geocoder = new google.maps.Geocoder(); 
		  	      
				// 1. latLng 객체 생성하는 함수 사용 / 2. 역지오코딩 함수로 주소 작성 / 3. 기존 마커 지우기 	  	    
		  	    searchedCoords(pos);
		  	    geocodeLatLng(geocoder, map, infoWindow);
		  	    deleteMarkers()
		        },
		        () => {
		          handleLocationError(true, infoWindow, map.getCenter());
		        }
		      );
		    } else {
		      // if Browser doesn't support Geolocation
		      handleLocationError(false, infoWindow, map.getCenter());
		    }
	}
	 
	 
	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	  infoWindow.setPosition(pos);
	  infoWindow.setContent(
	    browserHasGeolocation
	      ? "Error: The Geolocation service failed."
	      : "Error: Your browser doesn't support geolocation."
	  );
	  infoWindow.open(map);
	}
		
	// doGeolocation() 에서 좌표 값을 가져오는 callback 함수
	// searchLatLng에 latLng 형태로 검색된 coords:좌표 입력
	function searchedCoords(pos){
		searchLatLng = pos;
	 }
	
	// reverseGeocoding 함수, 위에서 만든 latLng 객체를 사용해서 geocoder 객체 바로 실행
	function geocodeLatLng(geocoder, map, infoWindow) {
  	  /* const input = document.getElementById("latLng").value;
  	  const latLngStr = input.split(",", 2);
  	  const latLng = {
  	    lat: parseFloat(latLngStr[0]),
  	    lng: parseFloat(latLngStr[1]),
  	  }; */
  	  geocoder
  	    .geocode({ location: searchLatLng })
  	    .then((response) => {
  	      if (response.results[0]) {

  	    	addMarker(searchLatLng);
			
  	        // 지도 위치에 말풍선 infoWindow 객체, 지도 및 텍스트 확인
  	        infoWindow.setContent(response.results[0].formatted_address);
  	        infoWindow.open(marker.getMap(), marker);
   	        document.getElementById('guide').innerText= response.results[0].formatted_address;
   	        
  	      } else {
  	        window.alert("No results found");
  	      }
  	    })
  	    .catch((e) => window.alert("Geocoder failed due to: " + e));
  	}    
	
	
	// 새 마커 작성하기, 마커 클릭 이벤트를 위한 'optimized: false' 속성 추가
	function addMarker(pos) {
		marker = new google.maps.Marker({
		    position: pos,
		    map: map,
		    optimized: false,
		});
		markers.push(marker);
	}
	
	
	// 모든 마커를 array로 넣음
	function setMapOnAll(map) {
		for (let i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
		}
	}


	// array를 비움으로써 모든 마커를 삭제함
	function deleteMarkers() {
	setMapOnAll(null);
	markers = [];
	}

	// 모달 창 켜기
	const modal = document.getElementById("modal");
	const search = document.getElementById("geoLocation");

	search.addEventListener("click", e => {
	    modal.style.display = "flex";
	});


	// 모달 창 끄기 1. '<' 버튼 누르기  2. 모달 바깥 영역 클릭

	//1. < 버튼 누르기
	const back = modal.querySelector(".back");

	back.addEventListener("click", e => {
	    modal.style.display = "none";
	});

	//2. 모달 바깥 영역 클릭
	modal.addEventListener("click", e => {
	    const evTarget = e.target;
	    if(evTarget.classList.contains("modal-overlay")) {
	        modal.style.display = "none";
	    }
	}); 
	
	function inputAddress(){
		document.getElementById('input_place').value = document.getElementById('guide').innerText;
		deleteMarkers();
		back.click();
		document.getElementById('guide').innerText="제보위치를 확인해주십시오";
	}
	