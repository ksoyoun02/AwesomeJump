-- 일반 문의
INSERT INTO qna(qna_no, mem_no, qna_category, qna_title, qna_content, qna_name, qna_ref, qna_restep, qna_relevel)
VALUES(qna_seq.NEXTVAL, 11, '배송문의', '저번주에 주문했는데 안왔어요', '배송 언제 되나요', '테스트아이디', qna_seq.NEXTVAL, 1, 0);
INSERT INTO qna(qna_no, mem_no, qna_category, qna_title, qna_content, qna_name, qna_ref, qna_restep, qna_relevel)
VALUES(qna_seq.NEXTVAL, 11, '기타문의', '회원 탈퇴 관련 문의', '탈퇴해도 나중에 복구 가능한가요?', '테스트아이디', qna_seq.NEXTVAL, 1, 0);
INSERT INTO qna(qna_no, mem_no, qna_category, qna_title, qna_content, qna_name, qna_ref, qna_restep, qna_relevel)
VALUES(qna_seq.NEXTVAL, 11, '입금문의', '물건이 하나만 왔는데', '환불받고싶어요', '테스트아이디', qna_seq.NEXTVAL, 1, 0);

-- 상품 문의
INSERT INTO pro_qna(pro_qna_no, product_no, mem_no, pro_qna_title, pro_qna_content, pro_qna_name)
VALUES(pro_qna_seq.NEXTVAL, 12, 11, '침대 문의', '내구성이 어떻게 되나요?', '테스트아이디');
INSERT INTO pro_qna(pro_qna_no, product_no, mem_no, pro_qna_title, pro_qna_content, pro_qna_name)
VALUES(pro_qna_seq.NEXTVAL, 19, 11, '소파 가죽이 어떤건가요', '알려주세요', '테스트아이디');

-- 주문 정보
INSERT INTO order_info
VALUES('order_3456887523', 11, 'imp_2345677654', '2층 성인침대1 외 2품목', '21/07/20', 50000, 65445643, '테스트', '010-1234-5678', '테스트', '010-1234-5678', 34566, '광주 북구 경양로 170，한경빌딩 5층 501，(중흥동)', '안전배송 부탁드립니다');
INSERT INTO order_info(order_info_uid, mem_no, order_info_imp_uid, order_info_name, order_info_date, order_info_price, order_info_approval, order_info_mem_name, order_info_mem_phone, order_info_receive_name, order_info_phone, order_info_postcode, order_info_address)
VALUES('order_9876544563', 11, 'imp_9876543453', '1인 가죽소파 외 1품목', '21/07/19', 30000, 26765445, '시험용', '010-8765-4321', '테스트테스트', '010-8368-7425', 98425, '경기 성남시 분당구 내정로 54，765호，(정자동, 한솔마을주공6단지아파트)');

-- 주문 상세 정보
INSERT INTO order_detail
VALUES(order_detail_seq.NEXTVAL, 'order_3456887523', 29, 1, '배송 완료');
INSERT INTO order_detail
VALUES(order_detail_seq.NEXTVAL, 'order_3456887523', 31, 2, '배송 완료');
INSERT INTO order_detail
VALUES(order_detail_seq.NEXTVAL, 'order_3456887523', 38, 1, '배송 진행중');
INSERT INTO order_detail
VALUES(order_detail_seq.NEXTVAL, 'order_9876544563', 19, 1, '주문 접수');
INSERT INTO order_detail
VALUES(order_detail_seq.NEXTVAL, 'order_9876544563', 20, 2, '주문 접수');

commit;