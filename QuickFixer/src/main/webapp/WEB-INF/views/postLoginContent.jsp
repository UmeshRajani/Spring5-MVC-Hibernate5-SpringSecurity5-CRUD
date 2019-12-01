<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="${images}/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- Site Title -->
<title>Quickfixer</title>

<%@include file="stylescripts.jsp"%>

<script>
		window.contextRoot = '${pageContext.request.contextPath}';
</script>
</head>
<body>

	<header id="header" id="home" style="background: rgba(0,0,0,0.8);">
	<div class="container">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="index.html"><img src="${images}/logo.png" alt=""
					title="" /></a>
			</div>
			<nav class="navbar navbar-expand-md navbar-dark font-weight-bold">
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbarCollapse" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="nav-item"><a href="${contextRoot}/home"
						class="nav-link">Home</a></li>

					<security:authorize access="hasRole('ADMIN')">
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown">User</a>
							<div class="dropdown-menu">
								<a href="${contextRoot}/webrst/userForm" class="dropdown-item">Add
									User</a> <a href="${contextRoot}/webrst/user" class="dropdown-item">View
									Users</a>
							</div>
						</li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
					<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown">Ticket</a>
							<div class="dropdown-menu">
								<a href="${contextRoot}/webrst/ticketForm" class="dropdown-item">Add
									Ticket</a> <a href="${contextRoot}/webrst/ticket" class="dropdown-item">View
									Tickets</a>
							</div>
					</li>	
					</security:authorize>
					<security:authorize access="isAnonymous()">
						<li class="nav-item"><a href="#" data-toggle="modal"
							data-target="#loginModal" class="nav-link">Login</a></li>
					</security:authorize>
				</ul>
				<security:authorize access="isAuthenticated()">
					<ul class="nav navbar-nav ml-auto">
						<li class="nav-item dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"><%=request.getUserPrincipal().getName()%></a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="#" data-toggle="modal" data-target="#changePwdModal"
									class="dropdown-item">Change Password</a>
								<div class="dropdown-divider"></div>
								<a href="${contextRoot}/logout" class="dropdown-item">Logout</a>
							</div></li>
					</ul>
				</security:authorize>
			</div>
			</nav>
		</div>
	</div>
	</header>
<section class="cat-area section-gap">
	<div class="container">
        
        <c:if test="${showUserList == true}">
        	<%@include file="user.jsp"%>
        </c:if>
        
        <c:if test="${showTicketList == true}">
        	<%@include file="ticket.jsp"%>
        </c:if>

        <c:if test="${showUserForm == true}">
        	<%@include file="userForm.jsp"%>
        </c:if>

        <c:if test="${showTicketForm == true}">
        	<%@include file="ticketForm.jsp"%>
        </c:if>
        
    </div>
</section>
</body>
</html>



