// 정규식
const getName = RegExp(/^[a-zA-Z가-힣]{1}[a-zA-Z0-9가-힣]{3,19}$/);
const getPwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/);

// 닉네임 변경 시 유효성 확인 및 폼 전송
const originalNickname = $("input[name='nickname']").val();
$("#nickname-modify").click(function() {

	var nickname = $("input[name='nickname']").val();

	if (originalNickname === nickname) {
		$(".nickcheck-result").text("기존의 닉네임과 동일합니다.").shake();
		return false;
	}

	if (!getName.test($("input[name='nickname']").val())) {
		$(".nickcheck-result").html("닉네임은 특수문자 제외 4글자 이상<br> 20글자 이하로 작성되어야 하며 <br> 첫 글자는 숫자가 올 수 없습니다.").shake();
		$("input[name='nickname']").focus();
		return false;
	}

	var nickCheckResult = false;
	$.ajax({
		type: "POST",
		url: "members/nickcheck",
		contentType: "text/plain",
		dataType: "json",
		data: nickname,
		async: false,
		beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
		success: (data) => {
			if (data.checkResult == "1") {
				$(".nickcheck-result").text("이미 사용중인 닉네임 입니다.").shake();
			} else {
				nickCheckResult = true;
			}
		}
	});
	
	if (nickCheckResult === false) { return false; }

	var nicknameForm = $("<form></form>");

	nicknameForm.attr("method", "POST");
	nicknameForm.attr("action", "members/nickmodify");

	nicknameForm.append($("<input/>", { type: "hidden", name: "_csrf", value: CSRFtoken }));
	nicknameForm.append($("<input/>", { type: "hidden", name: "nickname", value: nickname }));
	nicknameForm.appendTo("body").submit();
});

// 업로드 이미지 파일 정규식
var checkImage = RegExp(/\.(bmp|gif|jpg|jpeg|png)$/);
var maxSize = 10 * 1024 * 1024;

// 업로드 이미지 파일 용량 및 확장자 확인
function checkExtension(fileName, fileSize) {

	if (!checkImage.test(fileName)) {
		alert("이미지 파일만 등록할 수 있습니다.");
		return false;
	}
	if (fileSize >= maxSize) {
		alert("이미지 사이즈는 10MB를 넘을 수 없습니다.");
		return false;
	}

	return true;
}

// 이미지 유효성 검사 후 폼 전송
$("#uploadBtn").click(function() {

	var inputImage = $("input[name='uploadedImage']");
	var image = inputImage[0].files[0];

	if (image === undefined) {
		alert("이미지를 선택 해주세요.");
		return false;
	}
	
	if (!checkExtension(image.name, image.size)) {
		return false;
	}
	
	$("#uploadImageForm").submit();
});

// 비밀번호 변경
$("#modify-mem_pw").blur(function() {
	$("#vm-mem_pw").text("비밀번호는 6자리 이상 20자리 이하 영문과 숫자를 반드시 포함해야 합니다.")
				   .removeClass("text-danger");
});
$("#modify-mem_new_pw").blur(function() {
	$("#vm-mem_new_pw").text("");
});
$("#modify-mem_confirm_new_pw").blur(function() {
	$("#vm-mem_confirm_new_pw").text("");
});

$("#modifyPasswordBtn").click(function() {
	var email = $("#mem_email").val();
	var currentPassword = $("#modify-mem_pw").val();
	var newPassword = $("#modify-mem_new_pw").val();
	var confirmNewPassword = $("#modify-mem_confirm_new_pw").val();
	
	if (!getPwd.test(newPassword)) {
		$("#vm-mem_new_pw").text("비밀번호가 올바르지 않습니다.").shake();
		$("#modify-mem_new_pw").focus();
		return false;
	}
	if (newPassword != confirmNewPassword) {
		$("#vm-mem_confirm_new_pw").text("비밀번호가 일치하지 않습니다").shake();
		$("#modify-mem_confirm_new_pw").val("").focus();
		return false;
	}
	
	var passwordCheckResult = false;
	$.ajax({
		url: "/members/passwordcheck",
		type : "POST",
		async: false,
		data : JSON.stringify({
			mem_pw: currentPassword,
			mem_email: email
		}),
		contentType: 'application/json',
		dataType: "json",
		beforeSend: (xhr) => xhr.setRequestHeader(CSRFheader, CSRFtoken),
		success: (data) => {
			if (data.checkResult === 0) {
				$("#modify-mem_pw").focus();
				$("#vm-mem_pw").text("계정의 비밀번호가 일치하지 않습니다.")
							   .attr("class", "text-danger").shake();	
			}
			if (data.checkResult === 1) {
				passwordCheckResult = true;
			}
		}
	});
	
	if (passwordCheckResult === false) { return false; }
	
	if (currentPassword == newPassword) {
		$("#vm-mem_new_pw").text("현재 비밀번호와 동일합니다.").shake();
		$("#modify-mem_confirm_new_pw").val("");
		$("#modify-mem_new_pw").val("").focus();
		return false;
	}
	
	$("form[name='changepw']").submit();
});

$("#memberLeaveBtn").click(function() {
	var leaveForm = $("<form></form>");

	leaveForm.attr("method", "POST");
	leaveForm.attr("action", "/members/leavemember");

	leaveForm.append($("<input/>", { type: "hidden", name: "_csrf", value: CSRFtoken}));
	leaveForm.append($("<input/>", { type: "hidden", name: "leaveConfirm", value: 1}));
	leaveForm.appendTo("body").submit();
});