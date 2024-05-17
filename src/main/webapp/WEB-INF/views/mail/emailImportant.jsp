<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.material-symbols-light--star {
	display: inline-block;
	width: 26px;
	height: 26px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23f5cc00' d='m7.325 18.923l1.24-5.313l-4.123-3.572l5.431-.47L12 4.557l2.127 5.01l5.43.47l-4.122 3.572l1.24 5.313L12 16.102z'/%3E%3C/svg%3E");
}

.material-symbols-light--star-outline {
	display: inline-block;
	width: 25px;
	height: 25px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23525252' d='m8.85 16.825l3.15-1.9l3.15 1.925l-.825-3.6l2.775-2.4l-3.65-.325l-1.45-3.4l-1.45 3.375l-3.65.325l2.775 2.425zm-1.525 2.098l1.24-5.313l-4.123-3.572l5.431-.47L12 4.557l2.127 5.01l5.43.47l-4.122 3.572l1.24 5.313L12 16.102zM12 12.25'/%3E%3C/svg%3E");
}
.solar--paperclip-linear {
  display: inline-block;
  width: 15px;
  height: 15px;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='none' stroke='%23696969' stroke-linecap='round' stroke-width='1.5' d='m7.918 17.807l7.89-7.553a2.253 2.253 0 0 0 0-3.284a2.503 2.503 0 0 0-3.43 0l-7.834 7.498a4.28 4.28 0 0 0 0 6.24c1.8 1.723 4.718 1.723 6.518 0l7.949-7.608c2.652-2.54 2.652-6.656 0-9.196c-2.653-2.539-6.954-2.539-9.607 0L3 10.034'/%3E%3C/svg%3E");
}
</style>


<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h4 class="fw-semibold mb-8">메일</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a class="text-muted text-decoration-none" href="/">홈</a></li>
						<li class="breadcrumb-item" aria-current="page">메일</li>
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

<div class="card overflow-hidden chat-application">
	<div class="d-flex align-items-center justify-content-between gap-6 m-3 d-lg-none">
		<button class="btn btn-primary d-flex" type="button" data-bs-toggle="offcanvas" data-bs-target="#chat-sidebar" aria-controls="chat-sidebar">
			<i class="ti ti-menu-2 fs-5"></i>
		</button>
		<form class="position-relative w-100">
			<input type="text" class="form-control search-chat py-2 ps-5" id="text-srh" placeholder="Search Contact">
			<i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
		</form>
	</div>
	<div class="d-flex w-100">
		<div class="left-part border-end w-20 flex-shrink-0 d-none d-lg-block h-auto">
			<div class="px-9 pt-4 pb-3">
				<button class="btn btn-primary fw-semibold py-8 w-100" onclick="location.href='/mail/emailForm'">메일 쓰기</button>
			</div>
			<ul class="list-group mh-n100" data-simplebar>
				<li class="border-bottom my-3"></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/mail/inbox">
						<i class="ti ti-inbox fs-5"></i>받은메일함<span class="mb-1 badge rounded-pill  bg-primary-subtle text-primary" style="margin-top: 5px; margin-left: -5px">${inboxNoRead }</span>
					</a></li>
				<li class="list-group-item border-0 p-0 mx-9"><div class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1">
						<a href="/mail/sent">
							<i class="ti ti-brand-telegram fs-5" style="margin-right: 12px;"></i>보낸메일함
						</a>
						<button type="button" class="btn btn-sm bg-primary-subtle text-primary ms-auto" onclick="location.href='/mail/check'">수신확인</button>
					</div></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/mail/noRead">
						<i class="ti ti-inbox fs-5"></i>안읽은메일함
					</a></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/mail/importantbox">
						<i class="ti ti-star fs-5"></i>중요메일함
					</a></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/mail/toMe">
						<i class="ti ti-inbox fs-5"></i>내게쓴메일함<span class="mb-1 badge rounded-pill  bg-primary-subtle text-primary" style="margin-top: 5px; margin-left: -5px">${toMeNoRead }</span>
					</a></li>
				<li class="border-bottom my-3"></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/mail/reservation" class="d-block ">
						<i class="ti ti-badge fs-5"></i>예약메일함<span class="mb-1 badge rounded-pill  bg-primary-subtle text-primary" style="margin-top: 5px; margin-left: -5px">${reservation }</span>
					</a></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/mail/draft">
						<i class="ti ti-file-text fs-5"></i>임시보관함
					</a></li>
				<li class="border-bottom my-3"></li>
				<li class="list-group-item border-0 p-0 mx-9"><a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="/mail/trash">
						<i class="ti ti-trash fs-5"></i>휴지통<span class="mb-1 badge rounded-pill  bg-primary-subtle text-primary" style="margin-top: 5px; margin-left: -5px">${trashNoRead }</span>
					</a></li>
			</ul>
		</div>
		<!-- 메뉴 옆 오른쪽 구역 시작 -->
		<div class="w-100">
			<div class="min-width-340">
				<div class="border-end user-chat-box h-100">
					<div class="px-4 pt-9 pb-6 d-none d-lg-block">
						<form id="searchForm">
							<input type="hidden" name="page" id="page" />
							<div class="d-flex align-items-center">
								<div class="col-6">
									<div>
										<span class="fs-5 fw-bold"><i class="ti ti-star fs-5"></i> 중요메일함</span> <span>&nbsp;&nbsp;중요메일 ${pagingVO.totalRecord } / 안읽은메일 ${noRead }</span>
									</div>
								</div>
								<div class="col-6">
									<div class="input-group">
										<input type="text" class="form-control form-select-sm" id="selectedMail" value="메일" readonly style="text-align: center; caret-color: transparent;">
										<input type="text" class="form-control" id="searchWord" name="searchWord" value="${searchWord }" placeholder="부서, 직급, 이름, 제목" />
										<button type="button" class="btn bg-primary-subtle text-primary">상세</button>
										<button type="submit" class="btn bg-primary-subtle text-primary">검색</button>
									</div>
								</div>
							</div>
						</form>
					</div>

					<nav class="navbar navbar-expand-sm">
						<div class="container-fluid">
							<div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
								<ul class="navbar-nav">
									<li class="nav-item"><input type="checkbox" class="form-check-input" name="selectAll" id="selectAll"> <label for="selectAll">전체선택</label></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<li class="nav-item"><span id="trash"><label for="trash" style="cursor: pointer;"><i class="ti ti-trash fs-5"></i>삭제</span></label></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<li class="nav-item"><span id="important"><label for="important" style="cursor: pointer;"><i class="ti ti-star fs-5"></i>중요하지 않음</span></label></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<li class="nav-item"><span id="read"><label for="read" style="cursor: pointer;"><i class="ti ti-inbox fs-5"></i>읽음처리</span></label></li>
								</ul>
							</div>
						</div>
					</nav>

					<div class="app-chat">
						<ul class="chat-users mh-n100" data-simplebar>
							<!-- 메일 목록 시작 -->
							<c:set value="${pagingVO.dataList }" var="emailList" />
							<c:choose>
								<c:when test="${empty emailList }">
									<li><a href="javascript:void(0)" class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user" id="chat_user_3" data-user-id="3">
											<div class="form-check mb-0"></div>
											<div class="position-relative w-100 ms-2 text-center">
												<div class="d-flex align-items-center justify-content-between mb-2">
													<h6 class="mb-0"></h6>
												</div>
												<h6 class="text-dark">해당 메일함에 메일이 존재하지 않습니다.</h6>
												<div class="d-flex align-items-center justify-content-between">
													<div class="d-flex align-items-center"></div>
												</div>
											</div>
										</a></li>
								</c:when>
								<c:otherwise>
									<c:forEach items="${emailList }" var="email">
										<li id="${email.emailNo }"><a href="javascript:void(0)" class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user" id="chat_user_3" data-user-id="3">
												<div class="form-check mb-0">
													<input class="form-check-input" type="checkbox" data-sender-no="${email.senderNo}" value="${email.emailNo }" id="select" name="select" />
													<c:choose>
													<c:when test="${email.senderNo eq user.emplNo }"> <!-- 보낸메일 -->
														<c:if test="${email.emailImprtncYn eq 'N'}">
															<span class="material-symbols-light--star-outline" name="imp" id="star${email.emailNo }" onclick="impOne(${email.emailNo },${email.senderNo })"></span>
														</c:if>
														<c:if test="${email.emailImprtncYn eq 'Y'}">
															<span class="material-symbols-light--star" id="star${email.emailNo }" onclick="impOne(${email.emailNo },${email.senderNo })"></span>
														</c:if>
													</c:when>
													<c:otherwise>
														<c:if test="${email.emailReceptionVO.emailRecptnImprtncYn eq 'N'}">
															<span class="material-symbols-light--star-outline" name="imp" id="star${email.emailNo }" onclick="impOne(${email.emailNo },${email.senderNo })"></span>
														</c:if>
														<c:if test="${email.emailReceptionVO.emailRecptnImprtncYn eq 'Y'}">
															<span class="material-symbols-light--star" id="star${email.emailNo }" onclick="impOne(${email.emailNo },${email.senderNo })"></span>
														</c:if>
													</c:otherwise>
													</c:choose>
												</div>
												<div class="position-relative w-100 ms-2">
													<div class="d-flex align-items-center justify-content-between mb-2">
														<h6 class="text-dark">${email.employeeVO.deptNm }&nbsp;${email.employeeVO.emplNm }&nbsp;${email.employeeVO.classOfPositionVO.clsfNm }</h6>
													</div>
													<c:choose>
														<c:when test="${email.senderNo eq user.emplNo and email.emailReceptionVO.receiverNo eq user.emplNo and email.emailReceptionVO.emailRecptnReadYn eq 'N'}">
															<h6 class="mb-0" name="mailNm" style="font-weight: bold;" onclick="location.href='/mail/detail?emailNo=${email.emailNo}&where=${where }'">${email.emailNm}
															<c:if test="${email.atchFileGroupNo ne 0 }">
																&nbsp;<span class="solar--paperclip-linear"></span>
															</c:if>
															</h6>
														</c:when>
														<c:when test="${email.senderNo ne user.emplNo and email.emailReceptionVO.emailRecptnReadYn eq 'N'}">
															<h6 class="mb-0" name="mailNm" style="font-weight: bold;" onclick="location.href='/mail/detail?emailNo=${email.emailNo}&where=${where }'">${email.emailNm}
															<c:if test="${email.atchFileGroupNo ne 0 }">
																&nbsp;<span class="solar--paperclip-linear"></span>
															</c:if>
															</h6>
														</c:when>
														<c:otherwise>
															<h6 class="mb-0" onclick="location.href='/mail/detail?emailNo=${email.emailNo}&where=${where }'">${email.emailNm }
															<c:if test="${email.atchFileGroupNo ne 0 }">
																&nbsp;<span class="solar--paperclip-linear"></span>
															</c:if>
															</h6>
														</c:otherwise>
													</c:choose>
													<div class="d-flex align-items-center justify-content-between">
														<div class="d-flex align-items-center"></div>
														<p class="mb-0 fs-2 text-muted">
															<fmt:formatDate value="${email.emailTrnsmis }" pattern="yyyy.MM.dd a hh:mm:ss" />
														</p>
													</div>
												</div>
											</a></li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<!-- 메일 목록 끝 -->
						</ul>
						<nav aria-label="Page navigation example" id="pagingArea">${pagingVO.pagingHTML }</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- 메뉴 옆 오른쪽 구역 끝 -->
	</div>
</div>



<script src="${pageContext.request.contextPath}/resources/vendor/js/apps/chat.js"></script>
<c:if test="${not empty message }">
	<script>
		showToast("${message}", 'info');
		<c:remove var="message" scope="request"/>
	</script>
</c:if>
<script>

var trash = $("#trash"); // 휴지통
var important = $("#important"); // 중요
var read = $("#read"); // 읽음처리

// emailNo 저장할 배열
var selectedValues = [];
// senderNo 저장할 배열
var selectedSenderNos = [];

//체크된 emailNo 배열로 저장
function getSelectedEmails() {
    selectedValues = [];
    var selectedCheckboxes = $('input[name="select"]:checked'); // 선택된 메일 체크박스
    selectedCheckboxes.each(function() {
        selectedValues.push($(this).val());
    });
    return selectedValues;
}

// 체크된 senderNo 배열로 저장
function getSelectedSenderNos() {
    selectedSenderNos = [];
    var selectedCheckboxes = $('input[name="select"]:checked'); // 선택된 메일 체크박스
    selectedCheckboxes.each(function() {
    	selectedSenderNos.push($(this).data("sender-no"));
    });
    return selectedSenderNos;
}


//휴지통 버튼
trash.on("click", function() { 
	
	getSelectedEmails();
	getSelectedSenderNos();
	 
	if(selectedValues.length == 0){
		showToast("메일을 선택해주세요!", 'info');
		return false;
	}
	
	showConfirm(selectedValues.length+"개의 메일을 삭제하시겠습니까?",'','question').then(result=> {
		if(result.isConfirmed){
			$.ajax({
		        url: "deleteEmailArray",
		        method: "POST",
		        data: JSON.stringify({
		        	emailArray : selectedValues,
		        	senderArray : selectedSenderNos
				}),
				contentType : "application/json;charset=utf-8",
		        beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
		        success: function(res) {
		        	  $.each(selectedValues, function(index, value) {
		                  $('input[name="select"][value="' + value + '"]').closest('li').remove();
		              });
		        	  showToast(res, 'success');
		        	// 모든 체크박스의 체크를 해제
		        	  $('input[type="checkbox"]').prop('checked', false);
		        },
		        error: function(xhr, status, res) {
		        	if(!res) {
		        		showToast("메일을 선택해주세요!", 'info');
		        	}else {
		        		showToast(res, 'warning');
		        	}
		        }
		    });
		}	
	});
});

// 중요하지않음 버튼
important.on("click", function() {
	
	getSelectedEmails();
	getSelectedSenderNos();
	
	$.ajax({
        url: "unimportantEmailArray",
        method: "POST",
        data: JSON.stringify({
        	emailArray : selectedValues,
        	senderArray : selectedSenderNos
		}),
		contentType : "application/json;charset=utf-8",
        beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
        success: function(res) {
        	  $.each(selectedValues, function(index, value) {
        		// 요소의 클래스를 변경
        		  $('input[name="select"][value="' + value + '"]').closest('li').remove();
              });
        	  showToast(res, 'success');
        	// 모든 체크박스의 체크를 해제
        	  $('input[type="checkbox"]').prop('checked', false);
        },
        error: function(xhr, status, res) {
        	if(!res) {
        		showToast("메일을 선택해주세요!", 'info');
        	}else {
        		showToast(res, 'warning');
        	}
        }
    });
});

//읽음처리 버튼
read.on("click", function() {
	
	getSelectedEmails();
		
	$.ajax({
        url: "readEmailArray",
        method: "POST",
        data: JSON.stringify({
        	emailArray : selectedValues,
		}),
		contentType : "application/json;charset=utf-8",
        beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
        success: function(res) {
        	  $.each(selectedValues, function(index, value) {
        		  $('input[name="select"][value="' + value + '"]').closest('li').find('[name="mailNm"]').css('font-weight', '');
              });
        	  showToast(res, 'success');
			// 모든 체크박스의 체크를 해제
        	  $('input[type="checkbox"]').prop('checked', false);
        },
        error: function(xhr, status, res) {
        	if(!res) {
        		showToast("메일을 선택해주세요!", 'info');
        	}else {
        		showToast(res, 'warning');
        	}
        }
    });
});



$(function(){
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click","a",function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});

// 체크박스 전체 선택
selectAll.addEventListener('change', function() {
	let select = document.getElementsByName('select');
	for(let i in select) {
		select[i].checked = selectAll.checked;
	}
});

// 체크박스 전체 선택
function isSelectAll() {
	let select = document.getElementsByName('select');
	
	select.forEach(selected => {
		selected.addEventListener('click', function(e) {
			var allChecked = true;
			
			select.forEach(function(checkbox) {
	            if (!checkbox.checked) {
	                allChecked = false;
	            }
	        });
			
	        selectAll.checked = allChecked;
		});
	});
}

//별표시 눌러 중요표시 체크, 해제
function impOne(emailNo, senderNo) {
	
	//emailNo 저장할 배열
	var selectedValues = [];
	selectedValues.push(emailNo);
	// senderNo 저장할 배열
	var selectedSenderNos = [];
	selectedSenderNos.push(senderNo);
	
	var starElement = $("#star"+emailNo);
	var starClass = starElement.hasClass("material-symbols-light--star"); // 중요표시 되어있음

	if(starClass) { // 중요표시 되어있을 때 누르면 중요표시 없애기
		
		$.ajax({
			url:"unimportantEmailArray",
			type:"post",
			data: JSON.stringify({
	        	emailArray : selectedValues,
	        	senderArray : selectedSenderNos
			}),
			contentType : "application/json;charset=utf-8",
	        beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
	        success: function(res, status, xhr) {
				if(xhr.status === 200) {
					$("#" + emailNo).remove();
				}else {
					showToast("중요표시 해제가 실패되었습니다!", 'warning');
				}
			}
		});
	}else { // 중요표시 되어있지 않을 때 누르면 중요표시 하기
		
		$.ajax({
			url:"importantEmailArray",
			type:"post",
			data: JSON.stringify({
	        	emailArray : selectedValues,
	        	senderArray : selectedSenderNos
			}),
			contentType : "application/json;charset=utf-8",
	        beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
	        success: function(res, status, xhr) {
				if(xhr.status === 200) {
	        	// 요소의 클래스를 변경
	        	 	starElement.removeClass('material-symbols-light--star-outline').addClass('material-symbols-light--star');
				}else{
					showToast("중요메일함 추가가 실패되었습니다!", 'warning');
				}
			}
		});
	}
}

</script>