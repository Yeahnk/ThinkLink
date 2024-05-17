<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
/* 툴바 간격 조절 */
.container, .container-fluid, .container-xxl, .container-xl,
	.container-lg, .container-md, .container-sm { -
	-bs-gutter-x: 1px !important;
}
</style>
<div class="container-fluid">
	<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
		<div class="card-body px-4 py-3">
			<div class="row align-items-center">
				<div class="col-9">
					<h4 class="fw-semibold mb-8">주소록</h4>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a class="text-muted text-decoration-none" href="../">Home</a></li>
							<li class="breadcrumb-item" aria-current="page">주소록</li>
						</ol>
					</nav>
				</div>
				<div class="col-3">
					<div class="text-center mb-n5">
						<img src="${pageContext.request.contextPath}/resources/vendor/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex w-100">
		<div class="left-part border-end w-20 flex-shrink-0 d-none d-lg-block">
			<div class="px-9 pt-4 pb-3">
				<a href="javascript:void(0)" id="btn-add-contact" class="btn btn-primary fw-semibold py-8 w-100">
					<i class="ti ti-users text-white me-1 fs-5"></i> 연락처 추가
				</a>
			</div>

			<ul class="list-group mh-n100" data-simplebar>
				<li class="fw-semibold text-dark text-uppercase mx-9 my-2 px-3 fs-2">개인 주소록</li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
						<i class="ti ti-bookmark fs-5 text-primary"></i>전체 주소록
					</a></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
						<i class="ti ti-star"></i>추가할 주소록
					</a></li>
				<li class="fw-semibold text-dark text-uppercase mx-9 my-2 px-3 fs-2">사내주소록</li>
				<li class="list-group-item border-0 p-0 mx-9" id="company_addressbook"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="${pageContext.request.contextPath}/address/employeeAddressList">
						<i class="ti ti-bookmark fs-5 text-primary"></i>전체주소록
					</a></li>
				<li class="fw-semibold text-dark text-uppercase mx-9 my-2 px-3 fs-2">부서주소록</li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
						<i class="ti ti-bookmark fs-5 text-primary"></i>개발팀
					</a></li>

			</ul>
		</div>
		<div class="widget-content searchable-container list">

			<!-- 			<div class="card card-body"> -->
			<!-- 				<div class="row"> -->

			<!-- 					<div class="col-md-4 col-xl-3"> -->
			<!-- 						<span>전체주소록 총 0건</span> -->
			<!-- 						<form class="position-relative"> -->
			<!-- 							<input type="text" class="form-control product-search ps-5" id="input-search" placeholder="Search Contacts..." /> -->
			<!-- 							<i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i> -->
			<!-- 						</form> -->
			<!-- 					</div> -->
			<!-- 					<div class="col-md-8 col-xl-9 text-end d-flex justify-content-md-end justify-content-center mt-3 mt-md-0"> -->
			<!-- 						<div class="action-btn show-btn"> -->
			<!-- 							<a href="javascript:void(0)" class="delete-multiple bg-danger-subtle btn me-2 text-danger d-flex align-items-center "> -->
			<!-- 								<i class="ti ti-trash text-danger me-1 fs-5"></i> Delete All Row -->
			<!-- 							</a> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
		</div>
		<div class="card card-body">
			<div class="row">
				<h3>사내주소록</h3>
				<div class="col-md-4 col-xl-3">
					<span>전체주소록 총 0건</span>
					<form class="position-absolute" style="right: 30px;">
						<input type="text" class="form-control product-search ps-5" id="input-search" placeholder="검색" />
						<i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
					</form>
				</div>

			</div>
			<br />
			<div class="row gx-2">

				<div class="col-auto">
					<button type="button" class="btn btn-rounded btn-light">공유</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-rounded btn-light">삭제</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-rounded btn-light">주소록 복사</button>
				</div>

			</div>
			<br />
			<div class="d-flex justify-content-start align-items-center">
				<input type="text" class="form-control w-25 rounded-0" style="margin-right: 10px;" placeholder="이름" id="nameInput">
				<input type="text" class="form-control w-25 rounded-0 ms-2" style="margin-right: 10px;" placeholder="이메일" id="emailInput">
				<input type="text" class="form-control w-25 rounded-0 ms-2" style="margin-right: 10px;" placeholder="휴대폰" id="phoneInput">
				<button type="button" class="btn btn-outline-primary rounded-0 ms-2">빠른추가</button>
			</div>
			<div class="col-md-8 col-xl-9 text-end d-flex justify-content-md-start justify-content-center mt-3 mt-md-0">
				<div class="action-btn show-btn">
					<a href="javascript:void(0)" class="delete-multiple bg-danger-subtle btn me-2 text-danger d-flex align-items-center ">
						<i class="ti ti-trash text-danger me-1 fs-5"></i> Delete All Row
					</a>
				</div>
			</div>
			<br />
			<div class="table-responsive">
				<table class="table search-table align-middle text-nowrap">
					<thead class="header-item">
						<th>
							<div class="n-chk align-self-center text-center">
								<div class="form-check">
									<input type="checkbox" class="form-check-input primary" id="contact-check-all" />
									<label class="form-check-label" for="contact-check-all"></label> <span class="new-control-indicator"></span>
								</div>
							</div>
						</th>
						<th>이름</th>
						<th>회사</th>
						<th>부서</th>
						<th>직위</th>
						<th>이메일</th>
						<th>휴대폰</th>
						<th>메모</th>
						<!--위로 옮겨야됨..쓰레기통 모양  -->
						<!-- 						<th>Action</th> -->
					</thead>
					<tbody>

						<!-- end row -->
					</tbody>
				</table>

			</div>
		</div>
	</div>
</div>
</div>
<script src="${pageContext.request.contextPath}/resources/project/js/contact_custom.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/project/js/ajax_custom.js"></script> --%>


<script type="text/javascript">
	
</script>