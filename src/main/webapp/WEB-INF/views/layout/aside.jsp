<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- import css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/css/layout/aside.css" />
<!-- import js -->
<script src="${pageContext.request.contextPath }/resources/project/js/layout/aside.js"></script>

<style>
#btn-organtree button {
    margin: 0;
    padding: 0;
    border: none;
    background: none;
    font: inherit;
    color: inherit;
    cursor: pointer;
}

</style>


<!-- 사이드바 시작 -->

<aside class="left-sidebar with-vertical">
	<div>

		<!-- ---------------------------------- -->
		<!-- 사이드바 메뉴 시작 -->
		<!-- ---------------------------------- -->
		<div class="brand-logo d-flex align-items-center">
			<a href="/" class="text-nowrap logo-img">
				<img src="${pageContext.request.contextPath}/resources/vendor/images/logos/dark-logo.png" class="logo dark-logo" alt="Logo-Dark" />
				<%-- 				<img src="${pageContext.request.contextPath}/resources/vendor/images/logos/dark-logo.png" class="logo light-logo" alt="Logo-light" /> --%>
				<%--                 <img src="${pageContext.request.contextPath}/resources/vendor/images/logos/light-logo.svg" class="logo light-logo" alt="Logo-light" /> --%>
			</a>
			<a href="javascript:void(0)" class="sidebartoggler ms-auto text-decoration-none fs-5 d-block d-xl-none">
				<i class="ti ti-x"></i>
			</a>
		</div>
		<div>


			<nav class="sidebar-nav scroll-sidebar" data-simplebar>
				<ul id="sidebarnav">
					<li class="sidebar-item">
						<a class="sidebar-link" href="/" aria-expanded="false">
							<span> <i class="fa-sharp fa-regular fa-house fa-fw fa"></i>
							</span> <span class="hide-menu">홈</span>
						</a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="/project" aria-expanded="false">
							<span> <i class="fa-sharp fa-regular fa-users fa-fw fa"></i>
							</span> <span class="hide-menu">프로젝트</span>
						</a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="/approval" aria-expanded="false">
							<span><i class="fa-sharp fa-regular fa-file-signature fa-fw fa"></i>
							</span> <span class="hide-menu">전자결재</span>
						</a>
					</li>
					<!-- 메일 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="/mail/inbox" aria-expanded="false">
							<span><i class="fa-sharp fa-regular fa-envelope fa-fw fa"></i>
							</span> <span class="hide-menu">메일</span>
						</a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="/schedule" aria-expanded="false">
							<span><i class="fa-sharp fa-regular fa-calendar-week fa-fw fa"></i>
							</span> <span class="hide-menu">캘린더</span>
						</a>
					</li>
					<!-- 주소록 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="/address/addresstable" aria-expanded="false">
							<span> <i class="fa-sharp fa-regular fa-address-book fa-fw fa"></i>
							</span> <span class="hide-menu">주소록</span>
						</a>
					</li>
					<!-- 자료실 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="/drive" aria-expanded="false">
							<span><i class="fa-sharp fa-regular fa-database fa-fw fa"></i>
							</span> <span class="hide-menu">자료실</span>
						</a>
					</li>
					<!-- 근태 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="/attendance/status" aria-expanded="false">
							<span> <i class="fa-sharp fa-regular fa-briefcase fa-fw fa"></i>
							</span> <span class="hide-menu">근태관리</span>
						</a>
					</li>
					<!-- 예약 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="/myReservation/main" aria-expanded="false">
							<span> <i class="fa-sharp fa-regular fa-car-side fa-fw fa"></i>
							</span> <span class="hide-menu">예약 및 대여</span>
						</a>
					</li>
					<!-- 채팅 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="#" aria-expanded="false" id="open-chat-blank">
							<span><i class="fa-sharp fa-regular fa-comments fa-fw fa"></i>
							</span> <span class="hide-menu">채팅</span>
						</a>
					</li>
					<!-- 메모 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="/note" aria-expanded="false">
							<span><i class="fa-sharp fa-regular fa-note-sticky fa-fw fa"></i>
							</span> <span class="hide-menu">메모</span>
						</a>
					</li>
					<!-- 게시판 -->
					<li class="sidebar-item">
						<a class="sidebar-link" href="/board" aria-expanded="false">
							<span><i class="fa-sharp fa-regular fa-chalkboard fa-fw fa"></i>
							</span> <span class="hide-menu">게시판</span>
						</a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" aria-expanded="false" id="btn-organtree" href="#">
							<span> <i class="fa-sharp fa-regular fa-sitemap fa-fw fa"></i>
							</span> <span class="hide-menu">조직도</span>
						</a>
					</li>
				</ul>
			</nav>

			<!-- 조직도 아이콘 -->
			<button id="btn-organtree-modal" style="display: none;" class="btn" data-bs-toggle="modal" data-bs-target="#organ-tree-modal" data-backdrop="false"></button>
			
			
<!-- 			<div class="fixed-organ-tree p-3 mx-4 mb-2 btn btn-light rounded mt-3 col"> -->
<!-- 				<button id="btn-organtree" class="btn"> -->
<!-- 					<div class="hstack gap-3"> -->
<!-- 						<div class="john-img"> -->
<!-- 							<i class="fa-sharp fa-regular fa-sitemap fa-fw fa-xl fa"></i> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<h6 class="mb-0 fs-4 fw-semibold">조직도</h6> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</button> -->
<!-- 			</div> -->

			<!-- 프로필 카드 -->
<!-- 			<div class="fixed-profile p-3 mx-4 mb-2 bg-secondary-subtle rounded mt-3"> -->
<!-- 				<div class="hstack gap-3"> -->
<!-- 					<div class="john-img"> -->
<%-- 						<img src="${pageContext.request.contextPath}/resources/vendor/images/profile/user-1.jpg" class="rounded-circle" width="40" height="40" alt="" /> --%>
<!-- 					</div> -->
<!-- 					<div class="john-title"> -->
<!-- 						<h6 class="mb-0 fs-4 fw-semibold">Mathew</h6> -->
<!-- 						<span class="fs-2">Designer</span> -->
<!-- 					</div> -->
<!-- 					<button class="border-0 bg-transparent text-primary ms-auto" tabindex="0" type="button" aria-label="logout" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="logout"> -->
<!-- 						<i class="ti ti-power fs-6"></i> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<!-- ---------------------------------- -->
			<!-- Start Vertical Layout Sidebar -->
			<!-- ---------------------------------- -->
		</div>
</aside>

<!-- 조직도 모달 -->
<div class="modal fade" id="organ-tree-modal" data-backdrop="false" tabindex="-1" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
	<div id="modal-organTree" class="modal-organixationtree modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header d-flex align-items-center">
				<div class="organization-tree-search">
					<i class="fa-solid fa-magnifying-glass"></i>
					<input class="organization-tree-search-box" type="text" placeholder="이름/부서/직책/전화번호로 검색">
				</div>
			</div>
			<div class="modal-body organ-tree dropdown">
				<!-- 조직도 시작 -->
				<ul id="dept-D301" aria-expanded="false" class="collapse in">
				</ul>
				<!-- 조직도 끝 -->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- 조직도 모달 끝 -->

<!--  Sidebar End -->
<script>
let chatOpen = $('#open-chat-blank');
chatOpen.on('click', fnOpenChat);

function fnOpenChat(e) {
	e.preventDefault();
	let width = 1575;
	let height = 830; 
	let left = Math.ceil((window.screen.width - width) / 2);
	let top = Math.ceil((window.screen.height - height) / 2);
	
	let popupChat = window.open('/chat', '사내 채팅', 'width='+width+',height='+height+',left='+left+',top='+top+',menubar=1,resizable=no,scrollbars=no,location=no');
}
</script>