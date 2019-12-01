<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/img" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--============================================= -->
<link rel="stylesheet" href="${css}/linearicons.css">
<link rel="stylesheet" href="${css}/font-awesome.min.css">
<link href="${css}/datatables.min.css" rel="stylesheet">
<link href="${css}/buttons.dataTables.min.css" rel="stylesheet">
<link rel="stylesheet" href="${css}/bootstrap.css">
<link rel="stylesheet" href="${css}/magnific-popup.css">
<link rel="stylesheet" href="${css}/nice-select.css">
<link rel="stylesheet" href="${css}/hexagons.min.css">
<link rel="stylesheet" href="${css}/animate.min.css">
<link rel="stylesheet" href="${css}/owl.carousel.css">
<link rel="stylesheet" href="${css}/main.css">
<link rel="stylesheet" href="${css}/fixerbreadcrumb.css">
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">

	<script src="${js}/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.${js}/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="${js}/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=xyz"></script>
	<script src="${js}/easing.min.js"></script>
	<script src="${js}/hoverIntent.js"></script>
	<script src="${js}/superfish.min.js"></script>
	<script src="${js}/jquery.ajaxchimp.min.js"></script>
	<script src="${js}/jquery.magnific-popup.min.js"></script>
	<script src="${js}/owl.carousel.min.js"></script>
	<script src="${js}/jquery.sticky.js"></script>
	<script src="${js}/jquery.nice-select.min.js"></script>
	<script src="${js}/hexagons.min.js"></script>
	<script src="${js}/waypoints.min.js"></script>
	<script src="${js}/jquery.counterup.min.js"></script>
	<script src="${js}/mail-script.js"></script>
	<script src="${js}/main.js"></script>
    <script src="${js}/user.js"></script>
    <script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

	<div class="modal" id="loginModal" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action='<spring:url value="/loginAction"/>' method="post">
						<input type="text" class="form-control" name="username"
							placeholder="Username" /> <br /> <input type="password"
							class="form-control" name="password" placeholder="Password"
							id="password" /> <br />
						<button type="submit" class="btn btn-primary pull-right">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="changePwdModal" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Change Password</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="changePasswordForm"
						action="${contextRoot}/webrst/change/changePassword.html" method="post">

						<input name="oldPassword" placeholder="Old Password"
							class="form-control" type="password" id="oldPassword" /> <br />
						<input name="newPassword" placeholder="New Password"
							class="form-control" type="password" id="newPassword" /> <br />
						<button type="submit" class="btn btn-primary pull-right">Submit</button>

					</form>
				</div>
			</div>
		</div>
	</div>
</html>