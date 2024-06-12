<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BEST 맛집</title>
    <link rel="stylesheet"  href="../css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
         .search-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            width: 100%; /* 너비 100% */
            justify-content: center; /* 가로 중앙 정렬 */
        }

        .container2 {
            width: 70%;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
		.chartWrap{
		  display: flex;
		  justify-content: space-around;
		}
		.chartWrap .chart {
		  position: relative;
		  width: 300px;
		  height: 300px;
		  border-radius: 50%;
		  transition: 0.3s;
		  background:lightgray;
		  display:inline-block;
		}
		.chartWrap .chart:after{
		  content:'';
		  background: #fff;
		  position: absolute;
		  top:50%; left:50%;
		  width:170px; height:170px;
		  border-radius: 50%;
		  transform: translate(-50%, -50%);
		}
		.chartWrap .chart-bar{
		  width: inherit;
		  height: inherit;
		  border-radius: 50%;
		  position: relative;
		}
		.chart{
			margin:100px;
			width: 100px;
			height: 100px;
		}
		
		.chart-total{
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  background:gray;
		  width:100%;
		}
		.chart-total span{
		  position: absolute;
		  color:#777;
		}
		.chart-total-num{
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  font-size:1.3rem;
		  font-weight:bold;
		  color:#333;
		}
		.chart-total-text1{
		  top:-150px;right:-10px;
		}
		.chart-total-text2{
		  top:-50px;right:-70px;
		}
		.chart-total-text3{
		  top:120px;right:30px;
		}
		.chart-total-text4{
		  top:0;left:-70px;
		}
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- 로고 이미지 추가 -->
            <div class="logo">
                <img src="${pageContext.request.contextPath}/imgs/mmm_logo2.png" alt="MMM">
            </div>
        </div>
    </div>
    <!-- 사이드바 -->
<%@ include file="../sidebar.jsp" %>
    <div class="container2">
        <div class="row search-container">
            <div class="col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control" id="search-input" placeholder="지역을 검색하세요">
                    <div class="input-group-append">
                        <button class="btn search-btn" type="button">검색</button>
                    </div>
                </div>
            </div>
        </div>
<div class="row">
<div class="col-md-4">
<div class="chartWrap">
  
  <div class="chart">
    <div class="chart-bar" data-deg="50"></div>
    <div class="chart-bar" data-deg="95"></div>
    <div class="chart-bar" data-deg="200"></div>
    <div class="chart-bar" data-deg="15"></div>
    <div class="chart-total">
      <span class="chart-total-num">Total:<br> 3,135</span>
      <span class="chart-total-text1">Automobile</span>
      <span class="chart-total-text2">Disability</span>
      <span class="chart-total-text3">Life</span>
      <span class="chart-total-text4">Property</span>
    </div>
  </div>
    <div class="chart">
    <div class="chart-bar" data-deg="50"></div>
    <div class="chart-bar" data-deg="95"></div>
    <div class="chart-bar" data-deg="200"></div>
    <div class="chart-bar" data-deg="15"></div>
    <div class="chart-total">
      <span class="chart-total-num">Total:<br> 4,238</span>
      <span class="chart-total-text1">Food</span>
      <span class="chart-total-text2">Drink</span>
      <span class="chart-total-text3">Dessert</span>
      <span class="chart-total-text4">Snack</span>
    </div>
  </div>
    <div class="chart">
    <div class="chart-bar" data-deg="50"></div>
    <div class="chart-bar" data-deg="95"></div>
    <div class="chart-bar" data-deg="200"></div>
    <div class="chart-bar" data-deg="15"></div>
    <div class="chart-total">
      <span class="chart-total-num">Total:<br> 2,560</span>
      <span class="chart-total-text1">Breakfast</span>
      <span class="chart-total-text2">Lunch</span>
      <span class="chart-total-text3">Dinner</span>
      <span class="chart-total-text4">Midnight Snack</span>
    </div>
  </div>
</div>

<script>		
	var _charts = document.querySelectorAll('.chart');
	var _chartBars = document.querySelectorAll('.chart-bar');
	var color = ['#9986dd','#fbb871','#bd72ac','#f599dc'] //색상
	var newDeg = []; //차트 deg
	
	function insertAfter(newNode, referenceNode) {
	    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
	}
	
	function chartDraw(){ 
	  for( var i=0;i<_chartBars.length;i++){
	    var _num = _chartBars[i].dataset.deg
	    newDeg.push( _num )
	  }
	
	  for( var i=0;i<_charts.length;i++){
	    var num = newDeg.length - newDeg.length;
	    _charts[i].style.background = 'conic-gradient(#9986dd '+
	                                                newDeg[num]+'deg, #fbb871 '+
	                                                newDeg[num]+'deg '+newDeg[num+1]+'deg, #bd72ac '+
	                                                newDeg[1]+'deg '+newDeg[2]+'deg, #f599dc '+
	                                                newDeg[2]+'deg )';
	  }
	}
	
	chartDraw();
</script>
<div class="menu-toggle">&#9776;</div>
</body>
<script src="../js/main.js"></script>
</html>
