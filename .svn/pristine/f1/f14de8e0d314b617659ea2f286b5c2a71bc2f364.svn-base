var CSRFheader = $("meta[name='_csrf_header']").attr('content');
var CSRFtoken = $("meta[name='_csrf']").attr('content');

$(document).ready(function() {
	
	// 이미지 업로드
	$("input[type='file']").on("change", function(){
		
		// 이미지 존재 시 삭제
		if($(".imgDeleteBtn").length > 0) {
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		console.log("fileList : " + fileList);
		console.log("fileObj : " + fileObj);
		
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType : " + fileObj.type);
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		} 
		
		for(let i = 0; i < fileList.length; i++){
			formData.append("uploadFile", fileList[i]);
			console.log("fileList : " + fileList[i]);
		}
		
		$.ajax({
			url: '/admin/uploadProductImg',
			processData: false,
			contentType: false,
			data: formData,
			beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
			type: 'POST',
			dataType: 'json',
			success : function(result) {
				console.log("ajax return result value : " + result);
				showUploadImage(result);
			},
			error : function(result) {
				alert("이미지 파일만 첨부 가능합니다.");
			}
		});
		
	});
	
	/* let regex = new RegExp("/\.(bmp|gif|jpg|jpeg|png)$/"); */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 10 * 1024 * 1024;
	
	function fileCheck(fileName, fileSize) {
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	
	// 이미지 출력
	function showUploadImage(uploadResultArr) {
		
		// 전달받은 데이터 검증
		if(!uploadResultArr || uploadResultArr.length == 0) {return}
		
		let uploadResult = $("#uploadResult");
		
		/* let obj = uploadResultArr[0]; */
		let obj = uploadResultArr;
		
		console.log("showUploadImage uploadResultArr name : " + obj[0].pro_image_name);
		console.log("showUploadImage uploadResultArr type : " + obj[0].pro_image_type);
		console.log("showUploadImage uploadResultArr path : " + obj[0].pro_image_path);
		console.log("showUploadImage uploadResultArr uuid : " + obj[0].pro_image_uuid);
		
		
		let str = "";
		
		/* for(let i = 0; i < obj.length; i++){
			let fileCallPath = obj.uploadPath + "/thumb_" + obj.uuid + "_" + obj.fileName;
			fileCallPath += obj[i].pro_image_path.replace(/\\/g, '/') + "/thumb_" + obj.uuid + "_" + obj.fileName;
		} */
		
		for(let i = 0; i < obj.length; i++){
			
			str = "";
			
			let fileCallPath = encodeURIComponent(obj[i].pro_image_path.replace(/\\/g, '/') + "/" + obj[i].pro_image_uuid + "_" + obj[i].pro_image_name);
			
			str += "<div id='result_card'>";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			console.log("fileCallPath : " + fileCallPath);
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList["+ i +"].pro_image_name' value='" + obj[i].pro_image_name + "'>";
			str += "<input type='hidden' name='imageList["+ i +"].pro_image_uuid' value='" + obj[i].pro_image_uuid + "'>";
			str += "<input type='hidden' name='imageList["+ i +"].pro_image_path' value='" + obj[i].pro_image_path + "'>";
			str += "<input type='hidden' name='imageList["+ i +"].pro_image_type' value='" + obj[i].pro_image_type + "'>";
			str += "</div>";
			
		uploadResult.append(str);
		}
	}
			
	// 이미지 삭제 버튼 클릭 시
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	// 파일 삭제 메서드
	function deleteFile() {
		
		targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data: {fileName : targetFile},
			beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
			dataType: 'text',
			type: 'POST',
			success : function(result) {
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result) {
				console.log(result);
				
				alert("파일 삭제를 실패하였습니다.");
			}
		});
	}
});