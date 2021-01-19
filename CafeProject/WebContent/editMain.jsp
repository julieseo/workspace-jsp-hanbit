<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Cafe Home</title>
<link rel="icon" type="image/x-icon"
	href="./resourse/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->

<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resource/css/styles.css" rel="stylesheet" />
<script>
//매개변수 id 값을 delete 페이지에 넘겨서 이동
function deleteConfirm(cafeid) {
	
	if (confirm("해당 상품을 삭제 하시겠습니까?") == true)
		location.href = "./deleteCoffee.jsp?cafeid=" + cafeid;
	//deleteProduct페이지로 id를 같이 넘긴 후 페이지에서 그 상품을 DB에서 삭제
	else return;
}

</script>

</head>

<%@ include file="menu/navBar.jsp" %>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading">Welcome To Our Cafe!</div>
			<div class="masthead-heading text-uppercase">
			Coffee and Bean
			</div>
			<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
				href="#services">Login</a>
		</div>
	</header>
	<!-- Coffee Beans-->
	<section class="page-section" id="coffeeBean">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Coffee Bean
				<a href="#insertBean" data-toggle="modal"	class="btn btn-primary" role="button"> 추가 &raquo;</a></h2> 
				<h3 class="section-subheading text-muted">저희가 사용하는 원두를 확인하고
					스스로의 취향에 맞는 향과 맛을 찾아 즐기세요.</h3>
			</div>
			
			<div class="row text-center">
			<%
				String sql = "select * from coffee where kind = '1'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
				<div class="col-md-4">
					<img class="img-fluid"
						src="/upload/<%=rs.getString("fileName")%>" alt="" />
					<h4 class="my-3"><%=rs.getString("name")%></h4>
					<p class="text-muted">
						생두 : <%=rs.getString("beans")%><br>
						수확시기 : <%=rs.getString("regist_day")%><br>
						재배고도 : <%=rs.getString("explan")%><br>
						품종 : <%=rs.getString("variety")%><br>
						등급 : <%=rs.getString("level")%>
					</p>
					<a href="#updateBean<%=rs.getInt("cafeid")%>" data-toggle="modal" class="btn btn-success" role="button"> 수정 &raquo;></a>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("cafeid")%>')"	
					class="btn btn-danger" role="button"> 삭제 &raquo;></a>
				</div>
			<%
				}
				if (rs != null)
					rs.close();
	 			if (pstmt != null)
	 				pstmt.close();
	 			
			
			%>
			</div>
		</div>
	</section>
	<!-- Coffee -->
	<section class="page-section bg-light" id="coffee">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Coffee</h2>
				<h3 class="section-subheading text-muted">원하는 종류의 원두로 만든 다양한
					커피를 즐기세요.</h3>
			</div>
			<div class="row">
			
				<%
				sql = "select * from coffee where kind = '2'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="coffee-item">
						<a class="coffee-link" data-toggle="modal" href="#coffeeModal<%=rs.getInt("cafeid")%>">
							<div class="coffee-hover">
								<div class="coffee-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
							<img class="img-fluid w-100"
							src="/upload/<%=rs.getString("fileName")%>" alt="" />
						<div class="coffee-caption">
							<div class="coffee-caption-heading"><%=rs.getString("beans")%></div>
							<div class="coffee-caption-subheading text-muted"><%=rs.getString("name")%></div>
						</div>
						</a>
					</div>
				</div>
					<%
					}
						
					if (rs != null)
						rs.close();
		 			if (pstmt != null)
		 				pstmt.close();
					%>
				<div class="col-lg-4 col-sm-6">
					<div class="coffee-item">
					<a class="coffee-link" data-toggle="modal" href="#insertBean">
							<div class="coffee-hover">
								<div class="coffee-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
						<img class="img-fluid w-100"
							src="resource/assets/img/coffee/loading.png" alt="" />
						<div class="coffee-caption">
							<div class="coffee-caption-heading">Update</div>
							<div class="coffee-caption-subheading text-muted">추가하기</div>
						</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 게시판 -->
		<section class="page-section" id="notice">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Notice</h2>
				<h3 class="section-subheading text-muted">공지사항을 확인하세요.</h3>
			</div>
			<div class="row">
				<table class="table table-hover" style="border: 1px solid #ddd">
					<thead class="thead-dark">
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="#noticeModal1" data-toggle="modal">Gift
									Shop Welcome event</a></td>
							<td>2021-01-07</td>
							<td>37586</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="#noticeModal2" data-toggle="modal">Gift
									Shop Welcome event</a></td>
							<td>2021-01-07</td>
							<td>37586</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="#noticeModal3" data-toggle="modal">Gift
									Shop Welcome event</a></td>
							<td>2021-01-07</td>
							<td>37586</td>
						</tr>
					</tbody>
				</table>
				<ul class="pagination mx-auto">
					<li class="page-item">
						<a href="#" class="btn btn-arraw-left">다음</a>
						<a href="#" class="btn btn-arraw-left">[ 1 ]</a>
						<a href="#" class="btn btn-arraw-left">이전</a>
					</li>
				</ul>
			</div>
		</div>
	</section>

	<%@ include file="menu/footer.jsp" %>
	
<!-- UpdateBean Modal-->
	<!-- Modal -->
	<%
	;
	sql = "select * from coffee where kind=1";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	while (rs.next()) {
	%>
	<div class="coffee-modal modal fade" id="updateBean<%=rs.getInt("cafeid")%>" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="resource/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col">
							<div class="modal-body">
								<!-- Project Details Go Here-->	
								<div class="container">
									<div class="row">
										<div class="col-md-5">
											<img src="/upload/<%=rs.getString("fileName")%>" alt="image" style="width:100%;" />
										</div>
										<div class="col-md-7">
											<form name="newProduct" action="processUpdateBean.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
												<input type="hidden" name="cafeid" value='<%=rs.getString("cafeid")%>'>
												<div class="form-group row">
													<label class="col-sm-4">상품 이름</label>
													<div class="col-sm-8">
														<input type="text" id="name" name="name" class="form-control" value='<%=rs.getString("name")%>'>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">생두</label>
													<div class="col-sm-8">
														<input type="text" id="beans" name="beans" class="form-control" value="<%=rs.getString("beans")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">수확시기</label>
													<div class="col-sm-8">
														<input type="text" id="regist_day" name="regist_day" class="form-control" value="<%=rs.getString("regist_day")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">재배고도</label>
													<div class="col-sm-8">
														<input type="text" id="explan" name="explan" class="form-control" value="<%=rs.getString("explan")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">품종</label>
													<div class="col-sm-8">
														<input type="text" name="variety" class="form-control" value="<%=rs.getString("variety")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">등급</label>
													<div class="col-sm-8">
														<input type="text" name="level" class="form-control" value="<%=rs.getString("level")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">이미지</label>
													<div class="col-sm-8">
														<input type="file" name="fileName" class="form-control" style="font-size: 10px">
													</div>
												</div>
												<div class="form-group row">
											<div class="col-sm-offset-2 col-sm-10 ">
												<input type="submit" class="btn btn-outline-primary" value="Update" >
												<button class="btn btn-outline-secondary" data-dismiss="modal" type="button">
												 	Close
												</button>
										</div>
									</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
								<%
								}
								if (rs != null)
									rs.close();
								if (pstmt != null)
									pstmt.close();
								%>	
 
 <!-- UpdateCoffee Modal-->
	<!-- Modal -->
	<%
	;
	sql = "select * from coffee where kind=2";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	while (rs.next()) {
	%>
	<div class="coffee-modal modal fade" id="updateCoffee<%=rs.getInt("cafeid")%>" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="resource/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container-fluid">
					<div class="row justify-content-center">
						<div class="col">
							<div class="modal-body">
								<!-- Project Details Go Here-->	
								<div class="container">
									<div class="row">
										<div class="col-md-5">
											<img src="/upload/<%=rs.getString("fileName")%>" alt="image" style="width:100%;" />
										</div>
										<div class="col-md-7">
											<form name="newProduct" action="processUpdateBean.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
												<input type="hidden" name="cafeid" value='<%=rs.getString("cafeid")%>'>
												<div class="form-group row">
													<label class="col-sm-4">이름</label>
													<div class="col-sm-8">
														<input type="text" id="name" name="name" class="form-control" value='<%=rs.getString("name")%>'>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">영문 이름</label>
													<div class="col-sm-8">
														<input type="text" id="beans" name="beans" class="form-control" value="<%=rs.getString("beans")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">등록 날짜</label>
													<div class="col-sm-8">
														<input type="text" id="regist_day" name="regist_day" class="form-control" value="<%=rs.getString("regist_day")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">설명</label>
													<div class="col-sm-8">
														<input type="text" id="explan" name="explan" class="form-control" value="<%=rs.getString("explan")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">ICE or HOT</label>
													<div class="col-sm-8">
														<input type="text" name="variety" class="form-control" value="<%=rs.getString("variety")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">사이즈</label>
													<div class="col-sm-8">
														<input type="text" name="level" class="form-control" value="<%=rs.getString("level")%>">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4">이미지</label>
													<div class="col-sm-8">
														<input type="file" name="fileName" class="form-control" style="font-size: 10px">
													</div>
												</div>
												<div class="form-group row">
											<div class="col-sm-offset-2 col-sm-10 ">
												<input type="submit" class="btn btn-outline-primary" value="Update" >
												<button class="btn btn-outline-secondary" data-dismiss="modal" type="button">
												 	Close
												</button>
										</div>
									</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
								<%
								}
								if (rs != null)
									rs.close();
								if (pstmt != null)
									pstmt.close();
								%>	
 

	<!-- Coffee Modal-->
	<!-- Modal 1-->
						<%
						sql = "select * from coffee where kind = '2'";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
						%>
	<div class="coffee-modal modal fade" id="coffeeModal<%=rs.getInt("cafeid")%>" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="resource/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project Details Go Here-->
								<h2 class="text-uppercase"><%=rs.getString("beans")%></h2>
								<p class="item-intro text-muted"><%=rs.getString("name")%>(<%=rs.getString("variety")%>)
								<br><%=rs.getString("level")%>
								</p>
								<img class="img-fluid d-block mx-auto"
									src="resource/assets/img/coffee/<%=rs.getString("fileName")%>" alt="" />
								<p>
								<%=rs.getString("explan")%>
								</p>
								<ul class="list-inline">
									<li>최근리뷰1</li>
									<li>최근리뷰2</li>
									<li>최근리뷰3</li>
								</ul>
								<a class="btn btn-outline-primary" 
									type="button" data-toggle="modal" href="#updateCoffee<%=rs.getInt("cafeid")%>" data-dismiss="modal">
									<i class="fas fa-user-circle mr-1"></i> Update
								</a>
								<button class="btn btn-outline-danger" data-dismiss="modal"
									type="button" onclick="deleteConfirm('<%=rs.getString("cafeid")%>')">
									<i class="fas fa-times mr-1"></i>  Delete
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
								<%
								}
								if (rs != null)
									rs.close();
								if (pstmt != null)
									pstmt.close();
								if (conn != null)
									conn.close();
								%>	
								
<!-- INSERT MODAL -->
<div class="coffee-modal modal fade" id="insertBean" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="resource/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project Details Go Here-->
								<form name="newCoffee" action="./insertCoffee.jsp" class="form-horizontal" method="post" enctype ="multipart/form-data">
									<div class ="form-group row">
									<label class ="col-sm-6">이미지</label>
										<div class ="col-sm-6">
						 					<input type="file" name="fileName" class="form-control">
						 				</div>
						 			</div>
									<div class="form-group row">
										<label class="col-sm-6">분류(1:원두 /2:커피)</label>
										<div class="col-sm-6">
											<input type="text" name="kind" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-6">이름</label>
										<div class="col-sm-6">
											<input type="text" name="name" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-6">생두(Bean) / 영문이름(Coffee)</label>
										<div class="col-sm-6">
											<input type="text" name="beans" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-6">수확시기(Bean) / 등록날짜(Coffee)</label>
										<div class="col-sm-6">
											<textarea name="regist_day" cols="50" rows="2"
												class="form-control" required></textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-6">재배고도(Bean) / 설명(Coffee)</label>
										<div class="col-sm-6">
											<input type="text" name="explan" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-6">품종(Bean) / ICE or HOT(Coffee)</label>
										<div class="col-sm-6">
											<input type="text" name="variety" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-6">등급(Bean) / 사이즈(Coffee)</label>
										<div class="col-sm-6">
											<input type="text" name="level" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-offset-2 col-sm-10 ">
											<input type="submit" class="btn btn-outline-primary" value="Insert" >
											<button class="btn btn-outline-secondary" data-dismiss="modal" type="button">
												 Close
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="resource/assets/mail/jqBootstrapValidation.js"></script>
	<script src="resource/assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="resource/js/scripts.js"></script>
</body>

</html>