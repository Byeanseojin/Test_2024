var courseCounter = 4; // 다음 추가될 코스 ID

    document.getElementById("addCourseBtn").addEventListener("click", function() {
        // 새로운 코스를 담을 div 생성
        var newCourseWrapperDiv = document.createElement("div");
        newCourseWrapperDiv.classList.add("course-wrapper"); // 새로운 div에 course-wrapper 클래스 추가
        var newCourseDiv = document.createElement("div");
        newCourseDiv.classList.add("course"); // 새로운 div에 course 클래스 추가

        // 새로운 코스 선택 드롭다운 생성
        var newCourseLabel = document.createElement("label");
        var courseId = "course" + courseCounter;
        newCourseLabel.htmlFor = courseId;
        newCourseLabel.innerHTML = "코스 " + courseCounter + ":&nbsp;"; // 여기에 HTML 엔티티 공백 추가

        var newCourseDropdown = document.createElement("select");
        newCourseDropdown.name = courseId; // 각 코스에 고유한 ID 할당
        newCourseDropdown.id = courseId;
        newCourseDropdown.innerHTML = `
            <option value="" disabled selected>코스 선택</option>
            <option value="식사">식사</option>
            <option value="카페">카페</option>
            <option value="활동">활동</option>
        `;

        // 새로운 코스를 담을 div에 추가
        newCourseDiv.appendChild(newCourseLabel);
        newCourseDiv.appendChild(newCourseDropdown);

        // 새 코스를 코스 래퍼에 추가
        newCourseWrapperDiv.appendChild(newCourseDiv);

        // courseContainer에 새로운 코스를 추가
        var courseContainer = document.getElementById("courseContainer");
        courseContainer.appendChild(newCourseWrapperDiv);

        // 새 코스와 이전 코스 사이에 줄 바꿈 추가
        var br = document.createElement("br");
        courseContainer.appendChild(br);

        // 코스 카운터 증가
        courseCounter++;
    });

    document.getElementById("deleteCourseBtn").addEventListener("click", function() {
        var courseContainer = document.getElementById("courseContainer");
        var courseWrappers = courseContainer.getElementsByClassName("course-wrapper");

        if (courseWrappers.length > 0) {
            // 마지막 코스를 담고 있는 래퍼를 찾기
            var lastCourseWrapper = courseWrappers[courseWrappers.length - 1];
            // 마지막 코스를 담고 있는 래퍼를 제거
            lastCourseWrapper.remove();
            // 줄 바꿈 요소도 함께 제거
            if (courseContainer.lastElementChild.tagName === "BR") {
                courseContainer.removeChild(courseContainer.lastElementChild);
            }
            // 코스 카운터 감소
            courseCounter--;
        }
    });
//지도 js
window.onload = function () {
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 임시 중심 좌표
        level: 3
    };

    var map = new kakao.maps.Map(container, options);

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;
            var locPosition = new kakao.maps.LatLng(lat, lon);
            map.setCenter(locPosition);
        }, function(error) {
            console.error('Error occurred. Error code: ' + error.code);
        });
    } else {
        alert('Geolocation is not supported by this browser.');
    }

    var ps = new kakao.maps.services.Places();
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    function searchPlaces() {
        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        ps.keywordSearch(keyword, placesSearchCB);
    }

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            var firstResult = data[0];
            var firstLocation = new kakao.maps.LatLng(firstResult.y, firstResult.x);

            console.log("첫 번째 결과의 위치:", firstResult, firstLocation);

            map.setCenter(firstLocation);

            var bounds = new kakao.maps.LatLngBounds();

            for (var i = 0; i < data.length; i++) {
                displayMarker(data[i]);
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }

            map.setBounds(bounds);

            // 검색 결과가 있을 때만 선택된 지역에 키워드를 표시합니다.
            document.getElementById('selected-location-text').textContent = document.getElementById('keyword').value;
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
        }
    }


    function displayMarker(place) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x)
        });

        kakao.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
            infowindow.open(map, marker);
        });
    }
    // 페이지 로드시 선택된 지역에 아무것도 표시되지 않도록 수정
    document.getElementById('selected-location-text').textContent = "";

    // 검색 버튼 클릭 이벤트
    document.getElementById('map-search-btn').addEventListener('click', searchPlaces);

    // 엔터 키 눌렀을 때 검색 이벤트
    document.getElementById('keyword').addEventListener('keypress', function (e) {
        if (e.key === 'Enter') {
            searchPlaces();
        }
    });
};