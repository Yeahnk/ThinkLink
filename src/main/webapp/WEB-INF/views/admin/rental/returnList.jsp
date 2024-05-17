<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container-fluid">
	<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
		<div class="card-body px-4 py-3">
			<div class="row align-items-center">
				<div class="col-9">
					<h4 class="fw-semibold mb-8">Datatable Advanced</h4>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a class="text-muted text-decoration-none" href="../main/index.html">Home</a></li>
							<li class="breadcrumb-item" aria-current="page">Datatable Advanced</li>
						</ol>
					</nav>
				</div>
				<div class="col-3">
					<div class="text-center mb-n5">
						<img src="../assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="datatables">
		<!-- File export -->
		<div class="row">
			<div class="col-12">
				<!-- start File export -->
				<div class="card">
					<div class="card-body">
						<div class="mb-2">
							<h5 class="mb-0">File export</h5>
						</div>
						<p class="card-subtitle mb-3">
							Exporting data from a table can often be a key part of a complex application. The Buttons extension for DataTables provides three plug-ins that provide overlapping functionality for data export. You can refer full documentation from here
							<a href="https://datatables.net/">Datatables</a>
						</p>
						<div class="table-responsive">
							<div id="file_export_wrapper" class="dataTables_wrapper">
								<div class="dt-buttons">
									<button class="dt-button buttons-copy buttons-html5 btn btn-primary mr-1" tabindex="0" aria-controls="file_export" type="button">
										<span>Copy</span>
									</button>
									<button class="dt-button buttons-csv buttons-html5 btn btn-primary mr-1" tabindex="0" aria-controls="file_export" type="button">
										<span>CSV</span>
									</button>
									<button class="dt-button buttons-excel buttons-html5 btn btn-primary mr-1" tabindex="0" aria-controls="file_export" type="button">
										<span>Excel</span>
									</button>
									<button class="dt-button buttons-pdf buttons-html5 btn btn-primary mr-1" tabindex="0" aria-controls="file_export" type="button">
										<span>PDF</span>
									</button>
									<button class="dt-button buttons-print btn btn-primary mr-1" tabindex="0" aria-controls="file_export" type="button">
										<span>Print</span>
									</button>
								</div>
								<br>
								<div id="file_export_filter" class="dataTables_filter" >
									<label>Search:<input type="search" class="" placeholder="" aria-controls="file_export"></label>
								</div>
								<table id="file_export" class="table border w-100 table-striped table-bordered display text-nowrap dataTable" aria-describedby="file_export_info">
									<thead>
										<!-- start row -->
										<tr>
											<th class="sorting sorting_asc" tabindex="0" aria-controls="file_export" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 163.854px;">Name</th>
											<th class="sorting" tabindex="0" aria-controls="file_export" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 269.979px;">Position</th>
											<th class="sorting" tabindex="0" aria-controls="file_export" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 122.396px;">Office</th>
											<th class="sorting" tabindex="0" aria-controls="file_export" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 49.9167px;">Age</th>
											<th class="sorting" tabindex="0" aria-controls="file_export" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 113.292px;">Start date</th>
											<th class="sorting" tabindex="0" aria-controls="file_export" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 108.562px;">Salary</th>
										</tr>
										<!-- end row -->
									</thead>
									<tbody>

										<tr class="odd">
											<td class="sorting_1">Airi Satou</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>33</td>
											<td>2008/11/28</td>
											<td>$162,700</td>
										</tr>
										<tr class="even">
											<td class="sorting_1">Angelica Ramos</td>
											<td>Chief Executive Officer (CEO)</td>
											<td>London</td>
											<td>47</td>
											<td>2009/10/09</td>
											<td>$1,200,000</td>
										</tr>
									</tbody>
									<tfoot>
										<!-- start row -->
										<tr>
											<th rowspan="1" colspan="1">Name</th>
											<th rowspan="1" colspan="1">Position</th>
											<th rowspan="1" colspan="1">Office</th>
											<th rowspan="1" colspan="1">Age</th>
											<th rowspan="1" colspan="1">Start date</th>
											<th rowspan="1" colspan="1">Salary</th>
										</tr>
										<!-- end row -->
									</tfoot>
								</table>
								<div class="dataTables_info" id="file_export_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div> <br>
								<div class="dataTables_paginate paging_simple_numbers" id="file_export_paginate">
									<a class="paginate_button previous disabled" aria-controls="file_export" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="-1" id="file_export_previous">Previous</a>
									<span><a class="paginate_button current" aria-controls="file_export" role="link" aria-current="page" data-dt-idx="0" tabindex="0">1</a>
										<a class="paginate_button " aria-controls="file_export" role="link" data-dt-idx="1" tabindex="0">2</a>
										<a class="paginate_button " aria-controls="file_export" role="link" data-dt-idx="2" tabindex="0">3</a>
										<a class="paginate_button " aria-controls="file_export" role="link" data-dt-idx="3" tabindex="0">4</a>
										<a class="paginate_button " aria-controls="file_export" role="link" data-dt-idx="4" tabindex="0">5</a>
										<a class="paginate_button " aria-controls="file_export" role="link" data-dt-idx="5" tabindex="0">6</a></span>
									<a class="paginate_button next" aria-controls="file_export" role="link" data-dt-idx="next" tabindex="0" id="file_export_next">Next</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end File export -->
			</div>
		</div>
	</div>
