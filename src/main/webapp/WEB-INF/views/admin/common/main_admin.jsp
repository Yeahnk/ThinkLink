<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.content-header-t {
	color: #888;
	letter-spacing: -0.5px;
	margin: 0 4px;
	font-size: 13px;
	margin: 0 4px;
}

span.title {
	padding-left: 0px;
	margin-bottom: 16px;
	font-weight: 600;
	font-size: 18px;
}

#tbl tbody th {
	color: #888;
	font-weight: 600;
}

[data-list] li a:hover {
	color: #6d82a6 !important;
}
</style>
<div class="container positon-relative pt-4">
	<div>
		<span class="content-header-t">기본 관리</span>
		<h4 style="line-height: 40px;">서비스 정보</h4>
	</div>
	<div class="p-5 text-center bg-white rounded-3 w-100">
		<div class="w-100">
			<span class="float-start title">기본 정보</span>
		</div>
		<div class="mt-5">
			<table class="table table-responsive table-borderless bg-light" id="tbl">
				<tbody>
					<tr>
						<th>사이트명</th>
						<td>ThinkLink</td>
						<th>담당자</th>
						<td>${employee.emplNm }</td>
					</tr>
					<tr>
						<th>총 계정수</th>
						<td>48개 / 100개</td>
						<th>활동 계정</th>
						<td>48</td>
					</tr>
					<tr>
						<th colspan="2">도입일자</th>
						<td colspan="2">2024.04.26(금) 20:12</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="container positon-relative mt-4">
	<div class="card bg-white">
		<div class="card-body p-5 text-center overflow-hidden" style="height: 415px;">
			<div class="row">
				<div class="col-lg-6 col-md-3">
					<h1 class="float-start">차트1</h1>
					<div class="">
					
					</div>
				</div>
				<div class="col-lg-6 col-md-3">
					<h1 class="float-start">차트2</h1>
				</div>
			</div>
		</div>
	</div>
</div>