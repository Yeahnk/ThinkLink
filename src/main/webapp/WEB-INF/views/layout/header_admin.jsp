<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>
.offcanvas {
	min-width: 100%;
	background: #282828 !important;
}

div.card { -
	-bs-card-box-shadow: none;
}

.txt a {
	color: white !important;
	font-size: 18px;
}

.txt-sub {
	color: #777;
	font-size: 20px;
	margin-left: 10px;
}

.menu-t {
	color: white !important;
	font-size: 24px;
}

.off-title {
	color: #37D2E7 !important;
	margin-bottom: 50px;
}

.menu_column {
	margin-right: 125px;
}

.menu_group {
	margin-left: 10px;
}
</style>

<div class="top-0">
	<div class="py-3" style="background: white;">
		<ul class="header-menu-option">
			<li>
				<a id="toggle-sidebar" href="#">
					<i class="fa-sharp fa-regular fa-bars fa-fw fa-2xl"></i>
				</a>
			</li>
		</ul>
	</div>
	<div class="header-option justify-content-center align-items-center">
		<ul>
			<li>헤더메뉴1</li>
			<li>
				<a href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbarDark" aria-controls="offcanvasNavbarDark" aria-label="Toggle navigation">
					<i class="fa-sharp fa-regular fa-table-cells fa-fw fa-2xl"></i>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link pe-0" href="javascript:void(0)" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
					<div class="d-flex align-items-center">
						<div class="user-profile-img">
							<img src="/profile/view/${employee.emplProflPhoto }" class="rounded-circle" width="35" height="35" alt="" />
						</div>
					</div>
				</a>
				<div class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop1" style="width: 360px;">
					<div class="profile-dropdown position-relative" data-simplebar>
						<div class="py-3 px-7 pb-0">
							<h5 class="mb-0 fs-5 fw-semibold">사원 정보</h5>
						</div>
						<div class="d-flex align-items-center py-9 mx-7 border-bottom">
							<img src="/profile/view/${employee.emplProflPhoto }" class="rounded-circle" width="80" height="80" alt="" />
							<div class="ms-3">
								<h5 class="mb-1 fs-5 fw-semibold">${employee.emplNm }</h5>
								<span class="mb-1 fs-4 d-block"> <i class="fa-sharp fa-solid fa-star fa-fw"></i> ${employee.clsfNm }
								</span>
								<p class="mb-0 d-flex align-items-center gap-2">
									<i class="fa-sharp fa-solid fa-folder-user fa-fw"></i> ${employee.deptNm }
								</p>
							</div>
						</div>
						<div class="message-body">
							<a href="/" class="py-8 px-7 mt-8 d-flex align-items-center">
								<span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-9">
										<i class="fa-duotone fa-user-tie fa-xl fa-fw fa"></i>
								</span>
								<div class="w-75 d-inline-block v-middle ps-3">
									<h6 class="mb-1 fs-3 fw-semibold lh-base">메인 페이지</h6>
								</div>
							</a>
						</div>
						<div class="d-grid py-4 px-7 pt-8">
							<form action="/logout" method="post">
								<button class="btn btn-danger form-control">로그아웃</button>
								<sec:csrfInput />
							</form>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>

<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbarDark" aria-labelledby="offcanvasNavbarDarkLabel">
	<div class="offcanvas-header">
		<button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		<div class="card" style="background: #222;">
			<div class="row">
				<div class="col-lg-3 col-md-2">
					<div class="card-body" style="background: #222; border: #292929;">
						<div class="profile">
							<div class="d-block" style="width: 110px; height: 110px;">
								<img src="/profile/view/${employee.emplProflPhoto }" class="img-fluid rounded-circle round-100 border-3 border-white" alt="">
							</div>
							<div class="ms-2">
								<form action="/logout" method="post">
									<button type="button" class="btn btn-outline-info">로그아웃</button>
									<sec:csrfInput />
								</form>
								<p class="name fs-6 text-white m-0 mt-3">${employee.emplNm }</p>
								<ul class="login_info text-white">
									<li>
										<i class="fa-sharp fa-solid fa-house"></i> <span class="txt">ThinkLink</span>
									</li>
									<li>
										<i class="fa-sharp fa-solid fa-envelope"></i> <span class="txt">${employee.emplEmail }</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-4" style="border-left: 3px dashed #424242;">
					<div class="card-body" style="background: #222; border: #292929;">
						<div class="d-inline-block">
							<h1 class="off-title">관리 목록</h1>
							<div class="menu_column float-start">
								<h3>
									<span class="menu-t">업무 관리</span><span class="txt-sub">4</span>
								</h3>
								<div class="menu_group float-start">
									<ul class="menu_list float-start">
										<li class="position-relative">
											<span class="txt" name="A-a" title="출결관리"><a href="#">출결관리</a></span>
										</li>
										<li>
											<span class="txt" name="A-b" title="일정관리"><a href="#">일정관리</a></span>
										</li>
										<li>
											<span class="txt" name="A-c" title="결재관리"><a href="#">결재관리</a></span>
										</li>
										<li>
											<span class="txt" name="A-d" title="양식관리"><a href="/admin/documents/list">양식관리</a></span>
										</li>
									</ul>
								</div>
							</div>
							<div class="menu_column float-start">
								<h3>
									<span class="menu-t">시설물 관리</span><span class="txt-sub">3</span>
								</h3>
								<div class="menu_group float-start">
									<ul class="menu_list float-start">
										<li class="position-relative">
											<span class="txt" name="A-a" title="대여목록"><a href="#">대여목록</a></span>
										</li>
										<li>
											<span class="txt" name="A-b" title="신청목록"><a href="#">신청목록</a></span>
										</li>
										<li>
											<span class="txt" name="A-c" title="반납목록"><a href="#">반납목록</a></span>
										</li>
									</ul>
								</div>
							</div>
							<div class="menu_column float-start">
								<h3>
									<span class="menu-t">전체 통계</span><span class="txt-sub">7</span>
								</h3>
								<div class="menu_group float-start">
									<ul class="menu_list float-start">
										<li class="position-relative">
											<span class="txt" name="A-a" title="근태통계"><a href="/admin/attendance/statistics">근태통계</a></span>
										</li>
										<li>
											<span class="txt" name="A-b" title="근속통계"><a href="/admin/attendance/longevity">근속통계</a></span>
										</li>
										<li>
											<span class="txt" name="A-c" title="결재통계"><a href="#">결재통계</a></span>
										</li>
										<li>
											<span class="txt" name="A-c" title="프로젝트통계"><a href="#">프로젝트통계</a></span>
										</li>
										<li>
											<span class="txt" name="A-c" title="예약통계"><a href="#">예약통계</a></span>
										</li>
										<li>
											<span class="txt" name="A-c" title="양식통계"><a href="#">양식통계</a></span>
										</li>
										<li>
											<span class="txt" name="A-c" title="게시판통계"><a href="#">게시판통계</a></span>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="d-inline-block mt-3">
							<div class="menu_column float-start">
								<h3>
									<span class="menu-t">조직 관리</span><span class="txt-sub">2</span>
								</h3>
								<div class="menu_group float-start">
									<ul class="menu_list float-start">
										<li class="position-relative">
											<span class="txt" name="A-a" title="사원관리"><a href="/admin/employee/normalManagement">사원관리</a></span>
										</li>
										<li>
											<span class="txt" name="A-b" title="조직도관리"><a href="#">조직도관리</a></span>
										</li>
									</ul>
								</div>
							</div>
							<div class="menu_column float-start">
								<h3>
									<span class="menu-t">게시판 관리</span><span class="txt-sub">2</span>
								</h3>
								<div class="menu_group float-start">
									<ul class="menu_list float-start">
										<li class="position-relative">
											<span class="txt" name="A-a" title="공지사항"><a href="#">공지사항</a></span>
										</li>
										<li>
											<span class="txt" name="A-b" title="카테고리관리"><a href="#">카테고리관리</a></span>
										</li>
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