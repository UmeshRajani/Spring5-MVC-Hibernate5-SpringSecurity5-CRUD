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
</head>
<body>

	<header id="header" id="home">
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
							</div></li>
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
	<!-- #header -->

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div
			class="row fullscreen d-flex align-items-center justify-content-start">
			<div class="banner-content col-lg-9 col-md-12">
				<h1 class="text-white text-uppercase">We’re your fixer</h1>
				<p class="text-white">This is home fixer system to fix all
					electric, plumbig etc problems.</p>
				<security:authorize access="isAnonymous()">
				<a href="#" data-toggle="modal" data-target="#loginModal"
					class="primary-btn text-uppercase">Raise Ticket</a>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
				<a href="${contextRoot}/webrst/ticketForm"
					class="primary-btn text-uppercase">Raise Ticket</a>
				</security:authorize>
			</div>
		</div>
	</div>
	</section>
	<!-- End banner Area -->


	<!-- Start quote Area -->
	<section class="quote-area pt-100">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-5 col-sm-12 quote-left">
				<h2 class="text-right">
					<span>Plumbing</span> for those Area<br> where like to change<br>
					<span>Nowhere</span>.
				</h2>
			</div>
			<div class="col-lg-7 col-sm-12 quote-right">
				<p class="text-left">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur.</p>
			</div>
		</div>
	</div>
	</section>
	<!-- End quote Area -->

	<!-- Start cat Area -->
	<section class="cat-area section-gap" id="service">
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="single-cat d-flex flex-column">
					<a href="#" class="hb-sm-margin mx-auto d-block"><span
						class="hb hb-sm inv hb-facebook-inv"><span
							class="lnr lnr-magic-wand"></span></span></a>
					<h4 class="mb-20" style="margin-top: 23px;">Maintenance</h4>
					<p>inappropriate behavior is often laughed off as “boys will be
						boys,” women face higher conduct standards especially in the
						workplace. That’s why.</p>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="single-cat">
					<a href="#" class="hb-sm-margin mx-auto d-block"><span
						class="hb hb-sm inv hb-facebook-inv"><span
							class="lnr lnr-rocket"></span></span></a>
					<h4 class="mt-40 mb-20">Residental Service</h4>
					<p>inappropriate behavior is often laughed off as “boys will be
						boys,” women face higher conduct standards especially in the
						workplace. That’s why.</p>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="single-cat">
					<a href="#" class="hb-sm-margin mx-auto d-block"><span
						class="hb hb-sm inv hb-facebook-inv"><span
							class="lnr lnr-bug"></span></span></a>
					<h4 class="mt-40 mb-20">Commercial Service</h4>
					<p>inappropriate behavior is often laughed off as “boys will be
						boys,” women face higher conduct standards especially in the
						workplace. That’s why.</p>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End cat Area -->

	<!-- Start video Area -->
	<section class="video-area pb-100" id="video">
	<div class="container">
		<div class="row justify-content-center">
			<div class="video-section section-gap col-lg-12">
				<div class="text-wrap">
					<h1 class="text-white">Explore ourself in a new way</h1>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
						eiusmod tempor incididunt ut labore et dolore <br> magna
						aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
					</p>
					<div class="play-btn-wrap">
						<a href="http://www.youtube.com/watch?v=0O2aH4XLbto"
							class="play-btn"> <img src="${images}/play-btn.png" alt="">
							Watch Video
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End video Area -->

	<!-- Start testomial Area -->
	<section class="testomial-area section-gap" id="testimonail">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-60 col-lg-8">
				<div class="title text-center">
					<h1 class="mb-10">What our Client’s Say about us</h1>
					<p>Who are in extremely love with eco friendly system.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="active-tstimonial-carusel">
				<div class="single-testimonial item">
					<img class="mx-auto" src="${images}/t1.png" alt="">
					<p class="desc">Accessories Here you can find the best computer
						accessory for your laptop, monitor, printer, scanner, speaker,
						projector, hardware and more. laptop accessory</p>
					<h4>Mark Alviro Wiens</h4>
					<p>CEO at Google</p>
				</div>
				<div class="single-testimonial item">
					<img class="mx-auto" src="${images}/t1.png" alt="">
					<p class="desc">Accessories Here you can find the best computer
						accessory for your laptop, monitor, printer, scanner, speaker,
						projector, hardware and more. laptop accessory</p>
					<h4>Mark Alviro Wiens</h4>
					<p>CEO at Google</p>
				</div>
				<div class="single-testimonial item">
					<img class="mx-auto" src="${images}/t1.png" alt="">
					<p class="desc">Accessories Here you can find the best computer
						accessory for your laptop, monitor, printer, scanner, speaker,
						projector, hardware and more. laptop accessory</p>
					<h4>Mark Alviro Wiens</h4>
					<p>CEO at Google</p>
				</div>
				<div class="single-testimonial item">
					<img class="mx-auto" src="${images}/t1.png" alt="">
					<p class="desc">Accessories Here you can find the best computer
						accessory for your laptop, monitor, printer, scanner, speaker,
						projector, hardware and more. laptop accessory</p>
					<h4>Mark Alviro Wiens</h4>
					<p>CEO at Google</p>
				</div>
				<div class="single-testimonial item">
					<img class="mx-auto" src="${images}/t1.png" alt="">
					<p class="desc">Accessories Here you can find the best computer
						accessory for your laptop, monitor, printer, scanner, speaker,
						projector, hardware and more. laptop accessory</p>
					<h4>Mark Alviro Wiens</h4>
					<p>CEO at Google</p>
				</div>
				<div class="single-testimonial item">
					<img class="mx-auto" src="${images}/t1.png" alt="">
					<p class="desc">Accessories Here you can find the best computer
						accessory for your laptop, monitor, printer, scanner, speaker,
						projector, hardware and more. laptop accessory</p>
					<h4>Mark Alviro Wiens</h4>
					<p>CEO at Google</p>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End testomial Area -->

	<!-- Start contact Area: need to define handler method in controller to send mail-->
	<section class="contact-area" id="contact">
	<div class="container">
		<div class="contact-section">
			<div class="row align-items-center">
				<div class="col-lg-4 contact-left">
					<div style="width: 100%; height: 545px;" id="map"></div>
				</div>
				<div class="col-lg-7 contact-right">
					<form class="form-area" id="myForm" action="sendMail" method="post"
						class="contact-form text-right">
						<input name="fname" placeholder="Enter your name"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Enter your name'"
							class="common-input mt-10" required="" type="text"> <input
							name="email" placeholder="Enter email address"
							pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Enter email address'"
							class="common-input mt-10" required="" type="email">
						<textarea class="common-textarea mt-10" name="message"
							placeholder="Messege" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Messege'" required=""></textarea>
						<button class="primary-btn mt-20">
							Send Message<span class="lnr lnr-arrow-right"></span>
						</button>
						<div class="alert-msg"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- End contact Area -->

	<!-- start footer Area -->
	<footer class="footer-area " style="padding-top: 0px;">
	<div class="container">
		<div class="row">
			
				<div class="single-footer-widget">
					<a
							href="https://colorlib.com" target="_blank">
					<p class="footer-text">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with by Colorlib
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
					</a>
				</div>
			
		</div>
	</div>
	</footer>
	<!-- End footer Area -->

</body>
</html>



