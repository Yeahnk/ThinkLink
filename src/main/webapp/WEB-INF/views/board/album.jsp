<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h4 class="fw-semibold mb-8">Blog</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a class="text-muted text-decoration-none" href="../main/index.html">Home</a></li>
						<li class="breadcrumb-item" aria-current="page">Board</li>
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

<div class="row">
	<div class="d-flex justify-content-end mb-3">
		<div class="me-4 text-center">
			<a href="/board?type=album">
				<i class="fa-solid fa-images fa-2xl"></i>
				<p style="margin: 0">앨범</p>
			</a>
		</div>
		<div class="me-2 text-center">
			<a href="/board?type=list">
				<i class="fa-solid fa-list fa-2xl"></i>
				<p style="margin: 0">리스트</p>
			</a>
		</div>
	</div>
</div>

<div class="row">
<c:set value="${pagingVO.dataList }" var="boardList" />
	<c:choose>
		<c:when test="${empty boardList }">
			<tr>
				<td colspan="5">조회하신 게시글이 존재하지 않습니다</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${boardList }" var="board">
				<div class="col-md-6 col-lg-3">
					<div class="card rounded-2 overflow-hidden hover-img">
						<div class="position-relative">
							<a href="/board/view">
								<img src="${pageContext.request.contextPath}/resources/vendor/images/blog/blog-img11.jpg" class="card-img-top rounded-0" alt="...">
							</a>
							<span class="badge text-bg-light fs-2 rounded-4 lh-sm mb-9 me-9 py-1 px-2 fw-semibold position-absolute bottom-0 end-0">2 min Read</span>
							<img src="${pageContext.request.contextPath}/resources/vendor/images/profile/user-3.jpg" alt="" class="img-fluid rounded-circle position-absolute bottom-0 start-0 mb-n9 ms-9" width="40" height="40" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Walter Palmer">
						</div>
						<div class="card-body p-4">
							<h4>작성자</h4>
							<span class="badge text-bg-light fs-2 rounded-4 py-1 px-2 lh-sm  mt-3">${board.bbsNo }</span>
							<a class="d-block my-4 fs-5 text-dark fw-semibold" href="/board/detail?bbscttNo=${board.bbscttNo }">${board.bbscttTitle }</a>
							<div class="d-flex align-items-center gap-4">
								<div class="d-flex align-items-center gap-2">
									<i class="ti ti-eye text-dark fs-5">${board.bbscttRdcnt }</i>
								</div>
								<div class="d-flex align-items-center gap-2">
									<i class="ti ti-message-2 text-dark fs-5"></i>
								</div>
								<div class="d-flex align-items-center fs-2 ms-auto">
									<i class="ti ti-point text-dark">${board.rgsde }</i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

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