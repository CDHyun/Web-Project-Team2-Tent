<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>부트스트랩 차트그리기</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <!-- 차트 링크 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<style>
  .header {
    display: flex;
  }

  .content {
    margin-left: 350px;
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
        <canvas id="myChart" style="width: 100%; height: 300px;"></canvas>
      </div>
      <div class="col-lg-6">
        <div class="card" style="width: 100%; height: 300px;">
          <div class="card-body">
            <canvas id="myChart2" style="width: 100%; height: 200px;"></canvas>
          </div>
          <div class="card card-body text-center bg-primary " style="width: 100%; height: 200px;">
            <h3>색상별 판매량</h3>
          </div>
        </div>
      </div>
    </div>
  </div>

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
  <!-- 차트 -->
  <script>
    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
          label: '# of Votes',
          data: [125000, 100009, 300000, 500000, 200000, 300000, 100000],
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

    // 막대차트
    data = {
      datasets: [{
        backgroundColor: ['Red', 'Yellow', 'Blue', 'Black'],
        data: [10, 20, 30, 40]
      }],
      // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
      labels: ['Red', 'Yellow', 'Blue', 'Black']
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
  <table border="" class="content" >
  <tr>
    <th>구매번호</th>
    <th>구매자</th>
    <th>제품번호</th>
    <th>색상</th>
    <th>수량</th>
    <th>주문날짜</th>
   	<th>상태</th>
  </tr>
  <c:forEach items="${check}" var="dto">
    <tr>
      <td>${dto.pcNo}</td>
      <td>${dto.uid}</td>
      <td>${dto.pCode}</td>
      <td>${dto.pColor}</td>
      <td>${dto.pcQty}</td>
      <td>${dto.pcInsertdate}</td>
     <td>
  		<select name="status">
  			<option value="-1" ${dto.pcStatus == -1 ? 'selected' : ''}>주문취소</option>
  			<option value="0" ${dto.pcStatus == 0 ? 'selected' : ''}>상품준비중</option>
 			<option value="1" ${dto.pcStatus == 1 ? 'selected' : ''}>배송중</option>
  			<option value="2" ${dto.pcStatus == 2 ? 'selected' : ''}>배송완료</option>
		</select>
	</td>
    </tr>
  </c:forEach>
</table>

</body>

</html>
