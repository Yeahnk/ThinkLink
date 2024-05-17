<!-- content 영역시작 -->
<div class="card card-body">
			<div class="row">
				<h3>카테고리명</h3>
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
						<!-- <th>Action</th> -->
					</thead>
					<tbody>
						<!-- start row -->
						<tr class="search-items">
							<td>
								<div class="n-chk align-self-center text-center">
									<div class="form-check">
										<input type="checkbox" class="form-check-input contact-chkbox primary" id="checkbox1" />
										<label class="form-check-label" for="checkbox1"></label>
									</div>
								</div>
							</td>
							<td>
								<div class="d-flex align-items-center">
									<img src="${pageContext.request.contextPath}/resources/vendor/images/profile/user-2.jpg" alt="avatar" class="rounded-circle" width="35" />
									<div class="ms-3">
										<div class="user-meta-info">
											<h6 class="user-name mb-0" data-name="Emma Adams">홍길동</h6>
										</div>
									</div>
								</div>
							</td>
							<td>
								<span class="usr-company" data-company="company name">ThinkLink</span>
							</td>
							<td>
								<span class="usr-department" data-dept="dept name">개발팀</span>
							</td>
							<td>
								<span class="usr-position" data-postion="position name">부장</span>
							</td>
							<td>
								<span class="usr-email-addr" data-email="adams@mail.com">adams@mail.com</span>
							</td>
							<td>
								<span class="usr-ph-no" data-phone="휴대폰번호">010-1234-1234</span>
							</td>
							<td>
								<span class="usr-memo" data-memo="메모">나도메모입니다</span>
							</td>

							<!-- 								<td> -->
							<!-- 									<div class="action-btn"> -->
							<!-- 										<a href="javascript:void(0)" class="text-primary edit"> -->
							<!-- 											<i class="ti ti-eye fs-5"></i> -->
							<!-- 										</a> -->
							<!-- 										<a href="javascript:void(0)" class="text-dark delete ms-2"> -->
							<!-- 											<i class="ti ti-trash fs-5"></i> -->
							<!-- 										</a> -->
							<!-- 									</div> -->
							<!-- 								</td> -->
						</tr>
						<!-- end row -->
					</tbody>
				</table>
				<!-- 페이징 -->
				<nav aria-label="...">
					<ul class="pagination justify-content-center mb-0 mt-4">
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 d-flex align-items-center justify-content-center" href="#">
								<i class="ti ti-chevron-left"></i>
							</a></li>
						<li class="page-item active" aria-current="page"><a class="page-link border-0 rounded-circle round-32 mx-1 d-flex align-items-center justify-content-center" href="#">1</a></li>
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 mx-1 d-flex align-items-center justify-content-center" href="#">2</a></li>
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 mx-1 d-flex align-items-center justify-content-center" href="#">3</a></li>
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 mx-1 d-flex align-items-center justify-content-center" href="#">4</a></li>
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 mx-1 d-flex align-items-center justify-content-center" href="#">5</a></li>
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 mx-1 d-flex align-items-center justify-content-center" href="#">...</a></li>
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 mx-1 d-flex align-items-center justify-content-center" href="#">10</a></li>
						<li class="page-item"><a class="page-link border-0 rounded-circle text-dark round-32 d-flex align-items-center justify-content-center" href="#">
								<i class="ti ti-chevron-right"></i>
							</a></li>
					</ul>
				</nav>
			</div>
		</div>