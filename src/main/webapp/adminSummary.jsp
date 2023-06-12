<%@page import="com.javalec.tent.dto.AdminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>부트스트랩 차트그리기</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <!-- 차트 링크 -->
  <script src=	"https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<style>
  .header {
    display: flex;
  }

  .content {
    margin-left: 25%;
  }
  .content2 {
    margin-left: 60%;
  }
  .content3 {
    margin-left: 100px;
  }

  table {
    margin-top: 20px;
    border-collapse: collapse;
    width: 50%;
  }

  th,
  td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  th {
    background-color: #f2f2f2;
  }
</style>

<body>

  <!-- Header Start -->
  <div class="header">
    <jsp:include page="/adminSidebar.jsp" />
  </div>
  <!-- Header End -->


  <div class="container">
    <div class="row my-3">
      <div class="col-lg-6">
      <h3>요일별 판매량</h3>
        <canvas id="myChart" style="width: 100%; height: 300px;"></canvas>
      </div>
      <div class="col-lg-6">
        <div class="card" style="width: 100%; height: 300px;">
          <div class="card-body">
            <canvas id="myChart2" style="width: 100%; height: 200px;"></canvas>
          </div>
          <div class="card card-body text-center  " style="width: 100%; height: 200px;">
            <h3>색상별 판매량</h3>
          </div>
        </div>
      </div>
    </div>
  </div>

  
  <!-- 차트 -->
  <script>
  var ctx = document.getElementById('myChart');
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['월', '화', '수', '목', '금', '토', '일'],
      datasets: [{
       label: 'SUM of DailySale', 
        data: [${data}],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }]
    },
    options: {
      maintainAspectRatio: true,
      responsive: false,
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  });

    // 도넛차트
 
   
    
    data = {
      datasets: [{
        backgroundColor: ['beige','black','brown','gray','khakii','orange'],   // 색상은 나중에 고정되면 정해야함
        borderColor: 'Black', // 검정색 테두리
        borderWidth: 1, // 테두리의 너비 설정
        data: [10,8,4,4,4,2]
        //data: [${sumColorList}]

      }],
      // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
      labels: ['Beige','Black','Brown','Gray','Khakii','Orange'] // 범례
    };

    // 도넛형 차트
    
    
    var ctx2 = document.getElementById("myChart2");
    var myDoughnutChart = new Chart(ctx2, {
      type: 'doughnut',
      data: data,
      options: {
        maintainAspectRatio: true,
        responsive: false
      }
    });
  </script>
  
  <br/><br/><br/>
  
  
  
  
<h3 class="content">기간 매출 조회</h3>
<form action="adminfirst.do" method="post" class="content">
  <label for="startDate">시작일:</label>
  <input type="date" id="startDate" name="startDate">&nbsp;&nbsp;
  <label for="endDate">종료일:</label>
  <input type="date" id="endDate" name="endDate">
  <button type="submit">검색</button>
</form>


 
 
<p class="content2">총 매출액 : <input type="text" name="sumAll" id="sumAll" readonly="readonly" size="15" value="&#8361;&nbsp;<fmt:formatNumber value="${TOTAL }" type="number" pattern="#,###"></fmt:formatNumber>"></p>



<table border="" class="content">
  <tr>
    <th>No</th>
    <th>주문일자</th>
    <th>브랜드명</th>
    <th>상품명</th>
    <th>합계금액</th>
  </tr>
  
 
  
  <c:forEach items="${SALES}" var="dto" varStatus="st">
    <tr>
      <td>${st.index+1}</td>
      <td>${dto.pcInsertdate}</td>
      <td>${dto.pBrandName}</td>
      <td>${dto.pName}</td>
      <td>&#8361;&nbsp;<fmt:formatNumber value="${dto.sum}" type="number" pattern="#,###"></fmt:formatNumber></td>
    </tr>
  </c:forEach>
</table>

</body>
<!-- 부트스트랩 -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>

</html>
