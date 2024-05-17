<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<div class="card">
		<div class="card-body">
			<table class="table text-center">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="selectAll" name="selectAll" value="selectAll" />
						</th>
						<th>파일명</th>
						<th>확장자</th>
						<th>파일크기</th>
						<th>파일업로드일자</th>
						<th>다운로드</th>
					</tr>
				</thead>
				<tbody id="fileArea">
					<c:set var="attachFileList" value="${attachFileGroup.attachFileList }" />
					<c:forEach var="attachFile" items="${attachFileList }">
						<fmt:formatDate var="atchFileDate" value="${attachFile.atchFileDate }" pattern="yy-MM-dd HH:mm" />
						<tr>
							<td>
								<input type="checkbox" name="select" value="${attachFile.atchFileNo }" />
							</td>
							<td>${attachFile.atchFileOrnlFileNm }</td>
							<td>${attachFile.atchFileExtsn }</td>
							<td>${attachFile.atchFileFancysize }</td>
							<td>${atchFileDate }</td>
							<td>
								<a href="/download?path=${attachFile.atchFilePath }">
									<iconify-icon icon="solar:download-square-bold" width="2rem" height="2rem"></iconify-icon>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Launch demo modal</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-12">
							<p class="m-1">대상폴더선택</p>
							<select>
								<option>0</option>
								<option>1</option>
								<option>2</option>
							</select>
							<hr />
							<div class="row">
								<div class="col-sm-12">파일첨부</div>
								<div class="col-12 col-sm-12">
									<input type="file" class="btn btn-secondary fw-bold" name="files" id="files" value="파일 선택" multiple />
									<button type="button" class="btn btn-secondary" id="deleteBtn">삭제</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table" id="tbl">
								<thead>
									<tr>
										<th>
											<input type="checkbox" id="selectAll" name="selectAll" value="selectAll" />
										</th>
										<th>파일명</th>
										<th>확장자</th>
										<th>파일크기</th>
										<th>파일업로드일자</th>
									</tr>
								</thead>
								<tbody id="modalFileArea">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="uploadBtn">업로드</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<form id="fileFrm" method="post" action="/upload">
	<sec:csrfInput />
</form>

<script>
	const byteUnits = [ "KB", "MB", "GB" ];
	var fileArray = [];
	let deleteBtn = $('#deleteBtn');
	let files = document.getElementById('files');
	let fileArea = document.getElementById('fileArea');
	let modalFileArea = document.getElementById('modalFileArea');
	let formData = new FormData();
	let cnt = 1;
	let selectAll = document.getElementById('selectAll');
	
	selectAll.addEventListener('change', function() {
		let select = document.getElementsByName('select');
		for(let i in select) {
			select[i].checked = selectAll.checked;
		}
	});
	
	fileArea.addEventListener('change', function() {
		isSelectAll();
	});
	
	modalFileArea.addEventListener('change', function(){
		isSelectAll();
	});
	
	files.addEventListener('change',function(e) {
		let fileCnt = e.target.files.length;
		
		for (let i = 0; i < fileCnt; i++) {
			let file = e.target.files[i];
			
			let name = file.name;
			let size = getByteSize(file.size);
			let ext = name.substring(name.lastIndexOf('.')+1, name.length).toLowerCase();

			let html = '<tr>';
			html += '<td><input type="checkbox" name="select" value="'+cnt+'"/></td>';
			html += '<td>' + name + '</td>';
			html += '<td>' + ext + '</td>';
			html += '<td>' + size + '</td>';
			html += '<td>이건뭐?</td>';
			html += '</tr>';

			modalFileArea.insertAdjacentHTML('beforeend', html);
			cnt++;
			
			fileArray.push(file);
		}
	});
	
	deleteBtn.on('click', function() {
		let checkedFiles =  document.querySelectorAll('input[type="checkbox"]:checked');
		
		for(let i = 0; i < checkedFiles.length; i++) {
			let name = checkedFiles[i].parentElement.nextElementSibling.textContent;
			
			for(let j = 0; j < fileArray.length; j++) {
				if(fileArray[j].name === name) {
					fileArray.splice(j, 1);
					break;
				}
			}
			
			checkedFiles[i].parentElement.parentElement.remove();
			cnt--;
		}
	});
	
	uploadBtn.addEventListener('click', function(e) {
		
		for(let i in fileArray) {
			formData.append('files', fileArray[i]);
		}
		
		$.ajax({
			type : 'post',
			url : '/upload',
			data : formData,
			processData : false,
			contentType : false,
			success : function(res) {
				console.log(res);
				formData = new FormData();
				fileArray = [];
			}
		});
	});
	
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
	
	function getByteSize(size) {
		for (let i = 0; i < byteUnits.length; i++) {
			size = Math.floor(size / 1024);
			if (size < 1024)
				return size.toFixed(1) + byteUnits[i];
		}
	}
	
</script>