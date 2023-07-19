<%@page import="project.model.PCategory"%>
<%@page import="project.dao.PCategoryDAO"%>
<%@page import="project.model.PProduct"%>
<%@page import="project.dao.PProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shop || Ginza</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- All css files are included here. -->
<jsp:include page="/includes/css-source.jsp"></jsp:include>
</head>

<body>
	<div id="main-wrapper">
		<!--Header section start-->
		<jsp:include page="/includes/top-header.jsp"></jsp:include>
		<!--Header section end-->
		
		<!-- Page Banner Section Start -->
		<div class="page-banner-section section bg-image"
			data-bg="https://htmldemo.net/ginza/ginza/assets/images/bg/breadcrumb.jpg">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="page-banner text-center">
							<h2>Shop</h2>
							<ul class="page-breadcrumb">
								<li><a href="index.jsp">Home</a></li>
								<li>Shop</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Page Banner Section End -->

		<!-- Shop Section Start -->
		<div class="shop-section section">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div
							class="shop-area sb-border pb-70 pb-lg-50 pb-md-40 pb-sm-60 pb-xs-50">
							<div class="row">
								<div class="col-12">
									<!-- Grid & List View Start -->
									<div
										class="shop-topbar-wrapper d-flex justify-content-between align-items-center">
										<div class="grid-list-option d-flex">
											<ul class="nav">
												<li><a class="active show" data-bs-toggle="tab"
													href="#grid"><i class="fa fa-th"></i></a></li>
												<li><a data-bs-toggle="tab" href="#list" class=""><i
														class="fa fa-th-list"></i></a></li>
											</ul>
											<p>
												Showing <b>${count}</b> results
											</p>
										</div>
										<!--Toolbar Short Area Start-->
										<div class="toolbar-short-area d-md-flex align-items-center">
											<div class="toolbar-shorter ">
												<label>Sort By:</label> <select class="wide">
													<option data-display="Select">Nothing</option>
													<option value="Relevance">Relevance</option>
													<option value="Name, A to Z">Name, A to Z</option>
													<option value="Name, Z to A">Name, Z to A</option>
													<option value="Price, low to high">Price, low to high</option>
													<option value="Price, high to low">Price, high to low</option>
												</select>
											</div>
										</div>
										<!--Toolbar Short Area End-->
									</div>
									<!-- Grid & List View End -->
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3 order-lg-1 order-2">
									<!-- Single Sidebar Start  -->
									<div class="common-sidebar-widget">
										<h3 class="sidebar-title">Product categories</h3>
										<ul class="sidebar-list">
											<c:forEach var="category" items="${categoryList}">
												<li><a href="PShop?categoryId=${category.id}"><i
														class="ion-plus"></i> ${category.name}
														<!-- <span class="count">
															(${count})</span> -->
														</a></li>
												<br>
											</c:forEach>
										</ul>
									</div>
									<!-- Single Sidebar End  -->
									<!-- Single Sidebar Start  -->
									<div class="common-sidebar-widget">
										<h3 class="sidebar-title">Filter by price</h3>
										<div class="sidebar-price">
											<div id="price-range" class="mb-20"></div>
											<button type="button" class="btn">Filter</button>
											<input type="text" id="price-amount" class="price-amount"
												readonly>
										</div>
									</div>
									<!-- Single Sidebar End  -->
									<!-- Single Sidebar Start  -->
									<div class="common-sidebar-widget">
										<h3 class="sidebar-title">Filter by</h3>
										<ul class="sidebar-list">
											<li><a href="#"><i class="ion-plus"></i>Gold <span class="count">(1)</span></a></li>
											<li><a href="#"><i class="ion-plus"></i>Green <span class="count">(1)</span></a></li>
											<li><a href="#"><i class="ion-plus"></i>White <span class="count">(1)</span></a></li>
										</ul>
									</div>
									<!-- Single Sidebar End  -->
									<!-- Single Sidebar Start  -->
									<div class="common-sidebar-widget">
										<h3 class="sidebar-title">Compare Products</h3>
										<div class="compare-products-list">
											<ul>
												<li><a href="#" class="title">Cras neque metus</a> <a
													href="#" class="remove-compare"><i class="fa fa-close"></i></a>
												</li>
												<li><a href="#" class="title">Cras neque metus</a> <a
													href="#" class="remove-compare"><i class="fa fa-close"></i></a>
												</li>
											</ul>
											<a href="#" class="clear-btn">Clear all</a>
											<button type="button" class="btn compare-btn">Compare</button>
										</div>
									</div>
									<!-- Single Sidebar End  -->
									<!-- Single Sidebar Start  -->
									<div class="common-sidebar-widget">
										<h3 class="sidebar-title">Product tags</h3>
										<ul class="sidebar-tag">
											<li><a href="#">blouse</a></li>
											<li><a href="#">clothes</a></li>
											<li><a href="#">fashion</a></li>
											<li><a href="#">handbag</a></li>
											<li><a href="#">laptop</a></li>
										</ul>
									</div>
									<!-- Single Sidebar End  -->
								</div>
								<div class="col-lg-9 order-lg-2 order-1">
									<div class="row">
										<div class="col-12">
											<div class="shop-product">
												<div id="myTabContent-2" class="tab-content">
													<div id="grid" class="tab-pane fade active show">
														<div class="product-grid-view">
															<div class="row">
																<!--  Single Grid product Start -->
																<c:forEach var="product" items="${productList}">
																	<div class="col-lg-4 col-md-6 col-sm-6">																	
																		<div class="single-grid-product mb-30">
																			<div class="product-image">
																				<div class="product-label">
																					<span class="sale">Discount: TBC function</span>
																					<span class="new">NewProduct ${product.lableIsNew}</span>
																				</div>
																				<a href="PProductDetail?productId=${product.id}">
																					<img src="${product.imageSrc}" class="img-fluid"
																					alt=""> <img src="${product.imageSrc}"
																					class="img-fluid" alt="">
																				</a>

																				<div
																					class="product-action d-flex justify-content-between">
																					<a class="product-btn"
																						href="PProductDetail?productId=${product.id}">Add to Cart</a>
																					<ul class="d-flex">
																						<li><a href="wishlist.jsp"><i
																								class="ion-android-favorite-outline"></i></a></li>
																						<li><a href="compare.jsp"><i
																								class="ion-ios-shuffle"></i></a></li>
																						<li><a href="#quick-view-modal-container"
																							data-bs-toggle="modal" title="Quick View"><i
																								class="ion-ios-search-strong"></i></a></li>
																					</ul>
																				</div>
																			</div>
																			<div class="product-content">
																				<div class="product-category-rating">
																					<span class="category"><a href="shop.jsp">Category: ${product.categoryId}</a></span>
																					<span class="rating">Rating: ${product.rating} </span>
																				</div>

																				<h3 class="title">
																					<a href="PProductDetail?productId=${product.id}">${product.title}</a>
																				</h3>
																				<p class="product-price">
																					<span class="discounted-price">$${product.discountedPrice}</span>
																					<span class="main-price discounted">$${product.price}</span>
																				</p>
																			</div>
																		</div>
																		<!--  Single Grid product End -->
																	</div>
																</c:forEach>
																<!-- Single List Product End -->
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row mb-30 mb-sm-40 mb-xs-30">
										<div class="col">
											<ul class="page-pagination">
												<c:forEach begin="1" end="${endPage}" var="i">
												<li class="${pageIndex == i?"active":""}" ><a href="PShop?pageIndex=${i}">${i}</a></li>
												</c:forEach>												
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Shop Section End -->

		<!--NewsLetter section start-->
		<jsp:include page="/includes/newsletter.jsp"></jsp:include>
		<!--NewsLetter section end-->

		<!--Footer section start-->
		<jsp:include page="/includes/footer.jsp"></jsp:include>
		<!--Footer section end-->

		<!-- Modal Area Start -->
		<jsp:include page="/includes/modal.jsp"></jsp:include>
		<!-- Modal Area End -->

	</div>

	<!-- Placed js at the end of the document so the pages load faster -->

	<!-- All jquery file included here -->
	<jsp:include page="/includes/js-source.jsp"></jsp:include>
</body>

</html>