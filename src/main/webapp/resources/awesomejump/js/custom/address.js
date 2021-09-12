// 다음 주소찾기
function execDaumPostcode(modalType, element_wrap) {
	
	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = '';
			var extraAddr = '';

			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}

			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				document.getElementById(modalType + "_extraAddress").value = extraAddr;

			} else {
				document.getElementById(modalType + "_extraAddress").value = '';
			}

			document.getElementById(modalType + "_postcode").value = data.zonecode;
			document.getElementById(modalType + "_address").value = addr;
			document.getElementById(modalType + "_detailAddress").focus();

			element_wrap.style.display = 'none';
			document.body.scrollTop = currentScroll;
		},
		onresize: function(size) {
			element_wrap.style.height = size.height + 'px';
		},
		onclose: function(state) {
			if (state === 'COMPLETE_CLOSE') {
				document.getElementById(modalType + "_detailAddress").value = "";
			}
		},
		width: '100%',
		height: '100%'
	}).embed(element_wrap);

	element_wrap.style.display = 'block';	
}

// 배송지 추가 다음 주소찾기 기능
function newAddress_execDaumPostcode() {
	execDaumPostcode("newAddress", document.getElementById('newAddress_wrap'));
	$("#newAddressbtnFoldWrap").click(function() {
		$(this).parent().toggle();
	});
}

// 배송지 수정 다음 주소찾기 기능
function modifyAddress_execDaumPostcode() {
	execDaumPostcode("modifyAddress", document.getElementById('modifyAddress_wrap'));
	$("#modifyAddressbtnFoldWrap").click(function() {
		$(this).parent().toggle();
	});
}

// 정규식
const getAddress = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|_\-~@#&(),.\/\s]+$/);
const getPhone = RegExp(/^\d{2,3}-\d{3,4}-\d{4}$/);

// 배송지 추가 Listener
$("#newAddress_receiver_phone").blur(function() {
	$("#va-newAddress_receiver_phone").text("");
	$(this).val($(this).val().replace(/[^0-9]/g, "").replace("--", "-")
		   .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"));
});
$("#newAddress_postcodeBtn").click(function() {
	$("#va-newAddress").text("");
});

// 배송지 추가
$("#newAddressBtn").click(function() {
	
	var addressObj = {
		nickname: $("#newAddress_nickname").val(),
		receiver_name: $("#newAddress_receiver_name").val(),
		receiver_phone: $("#newAddress_receiver_phone").val(),
		postcode: $("#newAddress_postcode").val(),
		address: $("#newAddress_address").val(),
		detailAddress: $("#newAddress_detailAddress").val(),
		extraAddress: $("#newAddress_extraAddress").val()
	};
		
	if (checkAddress(addressObj)) {
		$("#newAddressForm").submit();
	}
});

// 유효성 검사
function checkAddress (addressObj) {
	
	if (addressObj.postcode == "" ||
		addressObj.address  == ""
	    ) {
		$("#va-newAddress, #va-modifyAddress").text("우편번호 찾기를 눌러 주소를 입력해주세요.").shake();
		return false;		
	}

	if ($.trim(addressObj.nickname)      == "" ||
	    $.trim(addressObj.receiver_name) == "" ||
		$.trim(addressObj.detailAddress) == "" ||
		addressObj.receiver_phone        == ""
	    ) {
		alert("참고항목 제외 모든 칸이 입력되어야 합니다.");
		return false;
	}
	
	if (!getPhone.test(addressObj.receiver_phone)) {
		$("#va-newAddress_receiver_phone, #va-modifyAddress_receiver_phone").text("올바르지 않은 형식의 전화번호 입니다.").shake();
		return false;
	}
	
	if (!getAddress.test(addressObj.nickname)      ||
		!getAddress.test(addressObj.receiver_name) ||
		!getAddress.test(addressObj.detailAddress) ||
			( addressObj.extraAddress != "" &&
			  !getAddress.test(addressObj.extraAddress) ) 
	    ) {
		alert("입력란에 _ - ~ @ # & ( ) , . / 이외의 특수 문자는 사용 하실 수 없습니다.");
		return false;
	}

	return true;	
}

// 배송지 수정 모달 팝업
$(".address").on("click", "#addressModifyBtn", function() {
	
	var addressNo = $(this).data("addressNo");
	var addressNickname = $(this).data("addressNickname");
	var addressReceiverName = $(this).data("addressReceiverName");
	var addressReceiverPhone = $(this).data("addressReceiverPhone");
	var addressPostcode = $(this).data("addressPostcode");

	var addressDetail = $(this).data("addressDetail");
	var addressList = addressDetail.split("，");
	if (addressList[2] == null) {
		addressList.push("");
	}
	
	// 배송지 모달 생성	
	var addressModifyDiv = 
	`
	<div class="modal fade p-0" id="addressModifyModal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog"
    aria-labelledby="#addressModifyModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <form action="address/modifyAddress" method="POST" id="modifyAddressForm">
			<input type="hidden" value="${CSRFtoken}" name="_csrf">
			<input type="hidden" value="${addressNo}" name="address_no">
            <div class="modal-header">
              <h5 class="modal-title" id="addressModifyModalLabel">배송지 수정</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <div class="form-group row">
                  <label for="address_nickname" class="offset-lg-2 col-lg-2 col-form-label">배송지명</label>
                  <div class="col-lg-6">
                    <input type="text" class="form-control" id="modifyAddress_nickname" name="address_nickname" value="${addressNickname}">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="address_receiver_name" class="offset-lg-2 col-lg-2 col-form-label">주문자명</label>
                  <div class="col-lg-6">
                    <input type="text" class="form-control" id="modifyAddress_receiver_name" name="address_receiver_name" value="${addressReceiverName}">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="address_receiver_phone" class="offset-lg-2 col-lg-2 col-form-label">연락처</label>
                  <div class="col-lg-6">
                    <input type="text" class="form-control" id="modifyAddress_receiver_phone" name="address_receiver_phone" value="${addressReceiverPhone}">
                    <p id="va-modifyAddress_receiver_phone" class="form-text text-danger"></p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-4 col-sm-6 offset-lg-2">
                    <input class="form-control" type="text" id="modifyAddress_postcode" placeholder="우편번호" name="address_postcode" value="${addressPostcode}" readonly>
                  </div>
                  <div class="col-lg-4 col-sm-6">
                    <input class="btn btn-primary w-100" type="button" onclick="modifyAddress_execDaumPostcode()" id="modifyAddress_postcodeBtn" value="우편번호 찾기"><br>
                  </div>
                  <div class="col-lg-8 col-12 offset-lg-2 mt-4">
                    <input class="form-control" type="text" id="modifyAddress_address" placeholder="주소" name="addressList" value="${addressList[0]}" readonly><br>
                  </div>
                  <div class="col-lg-4 col-sm-6 offset-lg-2">
                    <input class="form-control" type="text" id="modifyAddress_detailAddress" name="addressList" value="${addressList[1]}" placeholder="상세주소">
                  </div>
                  <div class="col-lg-4 col-sm-6">
                    <input class="form-control" type="text" id="modifyAddress_extraAddress" name="addressList" value="${addressList[2]}" placeholder="참고항목">
                  </div>
                </div>
                <div class="col-lg-8 offset-lg-2">
                  <p id="va-modifyAddress" class="form-text text-danger"></p>
                </div>
              </div>
              <div class="col-lg-8 offset-lg-2 postcode-wrapper">
                <div id="modifyAddress_wrap" style="display: none; border: 1px solid; height: 300px; margin: 5px 0; position: relative">
                  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="modifyAddressbtnFoldWrap"
                    style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" alt="접기 버튼">
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" id="modifyAddressCloseBtn" onclick="modifyAddressModalClose();">취소</button>
              <button type="button" class="btn btn-primary" id="modifyAddressBtn">저장</button>
            </div>
          </form>
        </div>
      </div>
    </div>
	`;
	
	$(".address").append(addressModifyDiv);
	$("#addressModifyModal").modal("toggle");
	
	// 배송지 수정 Listener	
	$("#modifyAddress_receiver_phone").blur(function() {
		$("#va-modifyAddress_receiver_phone").text("");
		$(this).val($(this).val().replace(/[^0-9]/g, "").replace("--", "-")
			   .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"));
	});
	$("#modifyAddress_postcodeBtn").click(function() {
		$("#va-modifyAddress").text("");
	});
	
	// 배송지 수정
	$("#modifyAddressBtn").click(function() {
	
		var addressObj = {
			nickname: $("#modifyAddress_nickname").val(),
			receiver_name: $("#modifyAddress_receiver_name").val(),
			receiver_phone: $("#modifyAddress_receiver_phone").val(),
			postcode: $("#modifyAddress_postcode").val(),
			address: $("#modifyAddress_address").val(),
			detailAddress: $("#modifyAddress_detailAddress").val(),
			extraAddress: $("#modifyAddress_extraAddress").val()
		};
	
		if (checkAddress(addressObj)) {
			$("#modifyAddressForm").submit();
		}
			
	});
});

// 배송지 수정 모달 닫으면 div 삭제
function modifyAddressModalClose() {
	$("#addressModifyModal").modal("toggle");
	setTimeout(() => $("#addressModifyModal").remove(), 500);
}

// 배송지 삭제
$(".address").on("click", "#addressDeleteBtn", function() {
	
	var addressNo = $(this).siblings("#addressModifyBtn").data("addressNo");
	
	var deleteAddressForm = $("<form></form>");
	deleteAddressForm.attr("method", "POST");
	deleteAddressForm.attr("action", "/address/deleteAddress");

	deleteAddressForm.append($("<input/>", { type: "hidden", name: "_csrf", value: CSRFtoken}));
	deleteAddressForm.append($("<input/>", { type: "hidden", name: "address_no", value: addressNo}));
	
	deleteAddressForm.appendTo("body").submit();
});