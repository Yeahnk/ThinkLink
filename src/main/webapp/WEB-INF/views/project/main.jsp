<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/css/project/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/css/calendar/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/css/gantt/style.css" />
<form>
	<input type="hidden" id="todoCnt" value="${todoCnt }">
	<input type="hidden" id="doingCnt" value="${doingCnt }">
	<input type="hidden" id="doneCnt" value="${doneCnt }">
</form>
<div class="prjct-content">
	<div class="col-yen-10">
		<div class="nav flex-column nav-pills mb-4 mb-md-0" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			<a class="nav-link" id="v-pills-home-tab" data-bs-toggle="pill" href="javascript:void(0);" onclick="moveToFormPage();" role="tab" aria-controls="v-pills-home" aria-selected="false">
				<i class="fa-solid fa-plus"></i> 새 프로젝트
			</a>
			<br />
			<div class="nav-link">
				<i class="fa-duotone fa-users" style="margin-right: 10px;"></i> 내 프로젝트
			</div>
			<div class="myPrjct">
				<c:forEach var="project" items="${prjctList }">
					<div class="btn-prjct">
						<span class="side-stick yen-${project.prjctColorCode }"></span>
						<a class="nav-link" id="v-pills-my-tab" data-bs-toggle="pill" href="javascript:void(0);" onclick="moveToProjectMain(${project.prjctNo});" role="tab" aria-controls="v-pills-profile" aria-selected="false"> ${project.prjctNm } </a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="col-yen-90">
		<ul class="nav nav-underline prjct-tab" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<a class="nav-link active" id="prjct-home-tab" data-bs-toggle="tab" href="#prjct-home" role="tab" aria-controls="prjct-home" aria-expanded="true" aria-selected="false" tabindex="-1">
					<span>홈</span>
				</a>
			</li>
			<li class="nav-item" role="presentation">
				<a class="nav-link" id="prjct-task-tab" data-bs-toggle="tab" href="#prjct-task" role="tab" aria-controls="prjct-task" aria-selected="false" tabindex="-1">
					<span>업무</span>
				</a>
			</li>
			<li class="nav-item" role="presentation" onclick="fnGanttTab()">
				<a class="nav-link" id="prjct-gantt-tab" data-bs-toggle="tab" href="#prjct-gantt" role="tab" aria-controls="prjct-gantt" aria-selected="true">
					<span>간트차트</span>
				</a>
			</li>
			<li class="nav-item" role="presentation" onclick="fnCalTab()">
				<a class="nav-link" id="prjct-cal-tab" data-bs-toggle="tab" href="#prjct-cal" role="tab" aria-controls="prjct-cal" aria-selected="true">
					<span>캘린더</span>
				</a>
			</li>
			<li class="nav-item" role="presentation" onclick="fnReptTab()">
				<a class="nav-link" id="prjct-report-tab" data-bs-toggle="tab" href="#prjct-report" role="tab" aria-controls="prjct-report" aria-selected="true">
					<span>업무일지</span>
				</a>
			</li>
		</ul>
		<div class="tab-content tabcontent-border p-3" id="myTabContent">
		
		
		
			<!-- 홈 탭 -->
			<div role="tabpanel" class="tab-pane fade active show" id="prjct-home" aria-labelledby="prjct-home-tab">
				<div class="row">
					<!-- 세로줄 1 -->
					<div class="col-yen-20">
						<!-- 업무 상태 -->
						<div class="card w-100">
							<div class="card-body">
								<div>
									<h4 class="card-title fw-semibold mb-1">업무 상태</h4>
									<canvas id="task-status-chart" width="200" height="200"></canvas>
									<div class="col">
										<span class="mb-1 badge yen-red">대기</span>
										<span class="mb-1 badge yen-blue">진행 중</span>
										<span class="mb-1 badge yen-yellow">완료</span>
									</div>
								</div>
							</div>
						</div>
						<!-- / 업무 상태 -->
						<!-- 업무기한 -->
						<div class="card w-100">
							<div class="card-body">
								<div>
									<h4 class="card-title fw-semibold mb-1">마감 기한 다가오는 업무</h4>
									<p class="card-subtitle">Every month</p>
									<div id="dueDateGraph" class="mx-n4">
									</div>
								</div>
							</div>
						</div>
						<!-- /업무기한 -->
					</div>
					<!-- /세로줄 1 -->
					<!-- 세로줄2 -->
					<div class="col-yen-55">
						<!-- 캘린더 -->
						<div class="card w-100">
							<div>
								<div class="row gx-0">
									<div class="col-lg-12">
										<div class="p-4 calender-sidebar app-calendar">
											<div id="calendar-home"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- / 캘린더 -->
					</div>
					<!-- /세로줄2 -->
				<!-- 세로줄3 -->
					<div class="col-yen-25">
						<!-- 프로젝트 개요 -->
						<div class="card w-100">
							<div class="card-body">
								<div class="d-flex align-items-center mb-9">
									<span class="side-stick yen-${project.prjctColorCode }"></span>
									<h5 class="card-title fw-semibold mb-0">${project.prjctNm }</h5>
								</div>
								<div>
									<p>${project.bgnDateString } - ${project.endDateString }</p>
									<p class="mb-0">${project.prjctCn }</p>
								</div>
							</div>
						</div>
						<!-- /프로젝트 개요  -->
						<!-- 참여자 -->
						<div class="card w-100">
							<div class="card-body">
								<h5 class="card-title fw-semibold mb-9">구성원</h5>
								<c:forEach var="empl" items="${emplList }">
									<div class="py-6 d-flex align-items-center">
										<div class="rounded-circle round-40">
											<img class="round-40 tl-profile-img" src="/profile/view/${empl.emplProflPhoto }" alt="user">
										</div>
										<div class="ms-3">
											<h6 class="mb-0 fw-semibold">${empl.emplNm } ${empl.clsfNm }</h6>
											<span class="fs-3">${empl.deptNm }</span>
										</div>
										<div class="ms-auto">
											<i class="fa-sharp fa-regular fa-comment fs-5"></i>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- /참여자 -->
					</div>
					<!-- /세로줄3 -->
					
				</div>
			</div>
			<!-- / 홈탭 -->
			
			
			
			<!-- 업무 탭 -->
			<div class="tab-pane fade datatables card-body" id="prjct-task" role="tabpanel" aria-labelledby="prjct-task-tab">
				<div class="table-responsive">
					<span class="btn yen-${project.prjctColorCode }" onclick="showTaskForm()">새 업무 추가</span>
					<div id="alt_pagination_wrapper" class="dataTables_wrapper">
						<table id="alt_pagination" class="table table-bordered display text-nowrap dataTable" aria-describedby="alt_pagination_info" style="width: 95%">
							<thead>
								<!-- start row -->
								<tr>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 6%;">업무번호</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 30%;">업무명</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 7%;">상태</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 7%;">우선순위</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 7%;">중요도</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 9%;">담당자</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 9%;">시작일자</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 9%;">마감일자</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 9%;">최종수정일자</th>
									<th class="sorting text-center" tabindex="0" aria-controls="alt_pagination" rowspan="1" colspan="1" style="width: 9%;">진척도</th>
								</tr>
								<!-- end row -->
							</thead>
							<tbody>
								<c:forEach var="task" items="${taskList }">
									<tr class="" onclick="showTaskDetail(${task.taskNo })">
										<td class="">${task.taskNo }</td>
										<td class="">${task.taskNm }</td>
										<c:choose>
											<c:when test="${task.taskProgrs eq 0 }">
												<td class="text-center"><span class="mb-1 badge rounded-pill text-bg-success">대기</span></td>
											</c:when>
											<c:when test="${task.taskProgrs eq 100 }">
												<td class="text-center"><span class="mb-1 badge rounded-pill text-bg-info">완료</span></td>
											</c:when>
											<c:when test="${task.taskProgrs ne 0 and task.taskProgrs ne 100}">
												<td class="text-center"><span class="mb-1 badge rounded-pill text-bg-warning">진행중</span></td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${task.taskPriort eq 1 }">
												<td class="text-center"><i class="fa-solid fa-arrow-down text-success"></i>&nbsp;&nbsp;&nbsp;낮음</td>
											</c:when>
											<c:when test="${task.taskPriort eq 2 }">
												<td class="text-center"><i class="fa-solid fa-dash"></i>&nbsp;&nbsp;&nbsp;보통</td>
											</c:when>
											<c:when test="${task.taskPriort eq 3 }">
												<td class="text-center"><i class="fa-solid fa-arrow-up text-danger"></i>&nbsp;&nbsp;&nbsp;높음</td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${task.taskImprtnc eq 1 }">
												<td class="text-center">
													<i class="fa-solid fa-star text-warning"></i>
													<i class="fa-regular fa-star text-body"></i>
													<i class="fa-regular fa-star text-body"></i>
												</td>
											</c:when>
											<c:when test="${task.taskImprtnc eq 2 }">
												<td class="text-center">
													<i class="fa-solid fa-star text-warning"></i>
													<i class="fa-solid fa-star text-warning"></i>
													<i class="fa-regular fa-star text-body"></i>
												</td>
											</c:when>
											<c:when test="${task.taskImprtnc eq 3 }">
												<td class="text-center">
													<i class="fa-solid fa-star text-warning"></i>
													<i class="fa-solid fa-star text-warning"></i>
													<i class="fa-solid fa-star text-warning"></i>
												</td>
											</c:when>
										</c:choose>
										<td class="text-center">${task.emplNm }</td>
										<td class="text-center">${task.taskBeginDtStr }</td>
										<td class="text-center">${task.taskEndDtStr }</td>
										<td class="text-center">${task.taskLastUpddeStr }</td>
										<td class="text-center">${task.taskProgrs }</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- / 업무 탭 -->
			<!-- 간트 탭 -->
			<div class="tab-pane fade" id="prjct-gantt" role="tabpanel" aria-labelledby="prjct-gantt-tab">
				<div id="gantt_div"></div>
				<div id="chart_div"></div>
			</div>
			<!-- / 간트 탭 -->
			<!-- 캘린더 탭 -->
			<div class="tab-pane fade" id="prjct-cal" role="tabpanel" aria-labelledby="prjct-cal-tab" style="height: 80vh;">
				<div class="d-flex">
					<div class="card col-yen-50">
						<div>
							<div class="row gx-0">
								<div class="col-lg-12">
									<div class="p-4 calender-sidebar app-calendar">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 일정 상세 -->
					<div id="schedule-detail-info" class="card-body col-yen-30">
						<!-- 일정 제목 -->
						<div class="schedule-detail-title d-flex flex-row align-items-center">
							<div id="schedule-color-circle" class="round-20 rounded-circle"></div>
							<h2 id="schedule-detail-title-txt" class="fw-semibold my-4"></h2>
						</div>
						<div class="schedule-detail-content col">
							<!-- 일정 날짜 / 시작 시간 -->
							<div class="schedule-detail-info-elem d-flex flex-row align-items-center">
								<i id="schedule-detail-icon-cal-1" class="fa-regular fa-calendar fs-5 mb-0 schedule-detail-icon"></i>
								<h6 id="schedule-detail-time1-txt" class="mb-0 fs-4"></h6>
							</div>
							<!-- 일정 시간 / 끝 시간 -->
							<div class="schedule-detail-info-elem d-flex flex-row align-items-center">
								<i id="schedule-detail-icon-cal-2" class="fa-regular fa-calendar fs-5 mb-0 schedule-detail-icon"></i> <i id="schedule-detail-icon-time" class="fa-regular fa-clock fs-5 mb-0 schedule-detail-icon"></i>
								<h6 id="schedule-detail-time2-txt" class="mb-0 fs-4"></h6>
							</div>
							<!-- 일정 장소 -->
							<div class="schedule-detail-info-elem d-flex flex-row align-items-center">
								<i id="schedule-detail-icon-place" class="fa-light fa-location-dot fs-5 mb-0 schedule-detail-icon"></i>
								<h6 id="schedule-detail-place-txt" class="mb-0 fs-4"></h6>
							</div>
							<!-- 일정 참여자 -->
							<div class="schedule-detail-info-elem d-flex flex-row align-items-center">
								<i id="schedule-detail-icon-part" class="fa-regular fa-user fs-5 mb-0 schedule-detail-icon"></i>
								<div id="schedule-detail-attendee"></div>
							</div>
							<!-- 일정 내용 -->
							<div class="schedule-detail-info-elem schedule-detail-description d-flex flex-row" style="height: 500px;">
								<h6 id="schedule-detail-description-txt" class="mb-3 fs-4"></h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- / 캘린더 탭 -->
			<!-- 업무일지 탭 -->
			<div class="tab-pane fade" id="prjct-report" role="tabpanel" aria-labelledby="prjct-report-tab">
				<div class="d-flex">
					<div class="card col-yen-50">
						<div>
							<div class="row gx-0">
								<div class="col-lg-12">
									<div class="p-4 calender-sidebar app-calendar">
										<div id="calendar-report"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="report-detail-info" class="card-body col-yen-30 mx-xxl-50 mb-7 mt-9">
						<!-- 상세-->
						<div id="reportDetail" class="yen-h-100" style="display: none">
							<div class="py-6 d-flex align-items-center mb-3">
								<div class="rounded-circle round-40">
									<img id="reptWriterImg" class="round-40 tl-profile-img" src="" alt="user">
								</div>
								<div class="ms-3">
									<h6 id="reptWriterNmClsf" class="mb-0 fw-semibold"></h6>
									<span id="reptWriterDept" class="fs-3"></span>
								</div>
							</div>
							<h6 id="reportDetailTitle" class="mb-3 fw-semibold fs-5"></h6>
							<p class="" id="reportDetailCn"></p>
						</div>
						<!-- / 상세 -->
						<!-- 등록 폼 -->
						<div id="reportForm" class="yen-h-100" style="display: none">
							<div class="yen-h-100 flex-sm-column d-flex">
								<div class="mb-4 d-flex justify-content-between align-items-center">
									<h6 id="reportTitle" class="mb-0 fw-semibold mx-2 fs-5">${todayString }_${loginUser.emplNm }_일일업무보고</h6>
									<input id="reportTargetDate" type="date" class="form-control" value="${todayString }" max="${todayString }" style="width: auto;">
								</div>
								<div class="mb-4 yen-fill-y">
									<textarea id="reportFormTextArea" class="form-control p-7 yen-h-100" wrap="hard">
	1. 오늘 계획
	 - 
	
	2. 계획 대비 진행 현황
	 - 
	
	3. 지연 이슈
	 -
	
	4. 이슈 대응 방안
	 -
	
	5. 내일 계획
	 - 
	
	6. 비고
	 - </textarea>
								</div>
								<div class="mb-4">
									<div id="uploadFileBox" class="d-flex flex-sm-column gap-3 mb-3 mx-3">
									</div>
									<input class="form-control" type="file" id="formFile">
								</div>
								<div class="button-group">
									<a href="javascript:checkReportForm()" class="btn btn-primary">등록</a>
									<a href="javascript:hideReportForm()" class="btn btn-outline-primary">취소</a>
								</div>
							</div>
						</div>
						<!-- / 등록 폼 -->
					</div>
				</div>
				<!-- / 업무일지 탭 -->
			</div>

<button id="btn-modal-task-detail" class="btn mb-1 bg-primary-subtle text-primary px-4 fs-4 " data-bs-toggle="modal" data-bs-target="#task-detail" style="display: none;">일감 상세 모달 버튼</button>

<!-- 일감 상세 모달 -->
<div class="modal fade" id="task-detail" tabindex="-1" aria-labelledby="bs-example-modal-lg" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-task-detail modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<div class="task-detail-title">
					<h5 class="modal-task-title h4" id="modaltaskDetailLabel"></h5>
					<span id="task-detail-side-stick" class="side-stick"></span>
					<h5 class="modal-task-prjct-title h6" id="modaltaskDetailLabelPrjct"></h5>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="task-detail-info">
					<div id="task-detail-empl-elem" class="task-detail-info-elem">
						<i id="task-detail-icon-part" class="fa-regular fa-user fs-5 mb-0 task-detail-icon"></i>
						<div id="task-detail-empl"></div>
					</div>
					<div id="task-detail-bgndt-elem" class="task-detail-info-elem">
						<i id="task-detail-icon-bgndt" class="fa-regular fa-calendar fs-5 mb-0 task-detail-icon"></i>
						<div id="task-detail-bgndt"></div>
					</div>
					<div id="task-detail-enddt-elem" class="task-detail-info-elem">
						<i id="task-detail-icon-enddt" class="fa-regular fa-calendar-check fs-5 mb-0 task-detail-icon"></i>
						<div id="task-detail-enddt"></div>
					</div>
					<div id="task-detail-priort-elem" class="task-detail-info-elem">
						<i class="fa-regular fa-circle-exclamation fs-5 mb-0 task-detail-icon"></i>
						<div id="task-detail-priort"></div>
					</div>
					<div id="task-detail-imprtnc-elem" class="task-detail-info-elem">
						<i class="fa-regular fa-star fs-5 mb-0 task-detail-icon"></i>
						<div id="task-detail-imprtnc"></div>
					</div>
					<div id="task-detail-progrs-elem" class="task-detail-info-elem">
						<i class="fa-duotone fa-spinner-third fs-5 mb-0 task-detail-icon"></i>
						<div id="task-detail-progrs"></div>
					</div>
				</div>
				<p id="task-detail-cn" class="task-detail-info-elem"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn bg-danger-subtle text-danger " data-bs-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- / 일감 상세 모달 -->

<button id="btn-modal-task-form" class="btn mb-1 bg-primary-subtle text-primary px-4 fs-4 " data-bs-toggle="modal" data-bs-target="#task-form" style="display: none;">일감 등록 모달 버튼</button>

<!-- 일감 등록 모달 -->
<div class="modal fade" id="task-form" tabindex="-1" aria-labelledby="bs-example-modal-lg" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-task-detail modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<div class="task-detail-title">
					<h5 class="modal-task-title h4" id="modaltaskDetailLabel">새 업무 추가</h5>
					<span id="task-detail-side-stick" class="side-stick yen-${project.prjctColorCode }"></span>
					<h5 class="modal-task-prjct-title h6" id="modaltaskDetailLabelPrjct">${project.prjctNm }</h5>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="task-detail-info">
					<div id="task-detail-empl-elem" class="task-detail-info-elem border-bottom mb-sm-6">
						<input type="text" id="taskTitle" class="task-form no-border fs-6" placeholder="업무명을 입력하세요.">
					</div>
					<div id="task-detail-empl-elem" class="task-detail-info-elem">
						<i id="task-detail-icon-part" class="fa-regular fa-user fs-5 mb-0 task-detail-icon"></i>
						<select id="select-task-empl" class="form-control form-select" data-placeholder="Choose a Category" tabindex="1">
							<option value="" disabled selected>담당자</option>
							<c:forEach var="empl" items="${emplList }">
								<option value="${empl.emplNo }">${empl.deptNm} ${empl.emplNm }</option>
							</c:forEach>
						</select>
					</div>
					<div id="task-detail-bgndt-elem" class="task-detail-info-elem">
						<i id="task-detail-icon-bgndt" class="fa-regular fa-calendar fs-5 mb-0 task-detail-icon"></i>
						<input id="bgnde" type="date" class="form-control form-date-task" data-placeholder="업무 시작일" required aria-required="true" onchange="bgndeChanged()" name="schdulBgnde" >
					</div>
					<div id="task-detail-enddt-elem" class="task-detail-info-elem">
						<i id="task-detail-icon-enddt" class="fa-regular fa-calendar-check fs-5 mb-0 task-detail-icon"></i>
						<input id="bgnde" type="date" class="form-control form-date-task" data-placeholder="업무 종료일" required aria-required="true" onchange="bgndeChanged()" name="schdulBgnde" >
					</div>
					<div id="task-detail-priort-elem" class="task-detail-info-elem">
						<i class="fa-regular fa-circle-exclamation fs-5 mb-0 task-detail-icon"></i>
						<select id="select-task-priort" class="form-control form-select" data-placeholder="Choose a Category" tabindex="1">
							<option value="" disabled selected>우선순위</option>
							<option value="3">높음</option>
							<option value="2">보통</option>
							<option value="1">낮음</option>
						</select>
					</div>
					<div id="task-detail-imprtnc-elem" class="task-detail-info-elem">
						<i class="fa-regular fa-star fs-5 mb-0 task-detail-icon"></i>
						<select id="select-task-imprtnc" class="form-control form-select" data-placeholder="Choose a Category" tabindex="1">
							<option value="" disabled selected>중요도</option>
							<option value="3">높음</option>
							<option value="2">보통</option>
							<option value="1">낮음</option>
						</select>
					</div>
				</div>
				<textarea id="taskFormTextArea" class="form-control p-7 yen-h-100" wrap="hard">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn bg-danger-subtle text-danger " data-bs-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- / 일감 등록 모달 -->
</div>

<!-- Import Js Files -->
<script src="https://cdn.datatables.net/2.0.5/js/dataTables.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
<script src="../../../resources/project/js/source/index.global.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/libs/bootstrap-table/dist/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/libs/bootstrap-table/dist/bootstrap-table-locale-all.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/libs/bootstrap-table/dist/bootstrap-table-vue.esm.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/libs/bootstrap-table/dist/bootstrap-table-vue.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/libs/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/js/datatable/datatable-basic.init.js"></script>
<script src="${pageContext.request.contextPath }/resources/project/js/gantt/dataDays.js"></script>
<script src="${pageContext.request.contextPath }/resources/project/js/gantt/dataDaysEnh.js"></script>
<script src="${pageContext.request.contextPath }/resources/project/js/gantt/dataHours.js"></script>
<script src="${pageContext.request.contextPath }/resources/project/js/gantt/jquery.fn.gantt.js"></script>
<script src="${pageContext.request.contextPath }/resources/project/js/gantt/jquery.fn.gantt.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <script src="../../../resources/project/js/source/index.global.min.js"></script> -->

<script src="${pageContext.request.contextPath }/resources/project/js/project/project_main.js"></script>

<script>

const prjctNo = '${project.prjctNo}';

const todoCnt = '${todoCnt}';
const doingCnt = '${doingCnt}';
const doneCnt = '${doneCnt}';

const prjctSchdulList = JSON.parse('${PrjctSchdulList}');
const dueDateData = JSON.parse('${dueDateJson}');

const taskList = JSON.parse('${taskListJson}');

const reportCalendarList = JSON.parse('${reportCalendarListJson}');

$(function () {

	var taskMap = JSON.parse('${taskMapJson}');
	var highstTaskList = '${taskList}';

});
</script>