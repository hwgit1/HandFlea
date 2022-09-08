# ![image](https://user-images.githubusercontent.com/107243294/189022362-bad09398-f1d3-4635-93c9-1d3c153d2f7c.png)

구현 기능

● 메인 페이지 – 비회원 / 회원
비회원 : 메인페이지에서 전체 상품 중 신상품(NEW)와 주문 높은 순(BEST)상품을 볼 수 있고 대분류 및 소분류 선택 시 해당 카테고리만 모여 있는 페이지로 이동가능, 상품 이름으로 검색 가능, 상품 상세 페이지로 이동 가능
회원 : 추가로 채팅과 장바구니, 마이페이지 이용 가능

● 회원 서비스 – 회원가입 / 로그인
기본 정보 입력 및 이메일 중복체크, 비밀번호 확인을 통해 회원가입 할 수 있다.
가입된 정보로 로그인 할 수 있다.

● 채팅
판매자 구매자 간의 원활한 소통을 위한 채팅기능 구현
메시지 밑에 보낸 시간 기록 
상대가 안 읽었을 시 메시지 옆에 1로 표시
채팅 내역에 상대가 보낸 메시지 개수 표시(빨간 동그라미에 숫자 개수 표기)
채팅 내역에 상대가 마지막으로 보낸 메시지 미리 보기 가능

● 상품 상세 페이지
옵션과 수량 선택 후 장바구니, 바로 구매 가능
상품 상세 설명과 상세 사진, 구매한 회원들의 리뷰 확인 가능
리뷰의 사진 클릭시 팝업창(lightbox로 구현)으로 확대가능
문의하기 버튼을 통해 해당 상품 판매자와의 채팅페이지로 이동 가능

● 장바구니 페이지
장바구니에 담긴 상품에 대한 가격 확인 및 수량 변경 가능
장바구니에 담은 상품 선택하여 삭제, 주문 가능

● 주문 페이지
가입된 정보를 기본 수령자 정보로 가져옴(배송지 변경 가능)
배송 메모 선택 가능
결제 정보 확인 후 결제 가능

● 마이 페이지 – 일반 회원 / 판매자 회원
일반 회원 : 주문 내역, 장바구니, Q&A문의 내역, 내가 작성한 후기, 회원정보 변경, 판매자 등록 메뉴 사용 가능, 진행중인 주문, 환불 가능 주문, 장바구니의 건수 확인 가능, 최근 주문 내역 확인 가능
판매자 회원 : 추가로 판매자 메뉴(상품 등록/관리, 판매 내역, 정산)사용 가능, 판매중인 주문 건수와 인출 가능 금액 확인 가능, 최근 판매 내역 확인 가능

● 주문 내역
주문한 상품에 대한 정보(옵션, 수량, 일자, 주문 번호, 금액, 배송정보)와 주문 상태(결제완료, 배송중, 수령완료) 확인 가능
주문 상태가 배송중 상태일 때 수취확인 버튼을 누를 시 사이트에서 보관하던 금액이 판매자에게 이동
-> 개인 간 거래의 취약점인 사기의 위험성을 줄이기 위해 정산금 시스템으로 구매자가 수취확인을 눌렀을 시 사이트에서 판매자에게 정산금이 넘어가도록 구현 판매자는 해당 정산금 인출 가능
구매한 회원은 후기 작성 가능
판매자가 출고하기로 약속한 일자가 지나면 자동으로 환불신청 버튼 생성되어 환불 신청 가능

● 나의 활동 - Q&A문의 내역 / 내가 작성한 후기
로그인한 회원 본인이 작성한 Q&A문의 내역과 후기 확인 가능

● 회원정보 변경 – 일반 회원 / 판매자 회원
회원정보 변경 메뉴 클릭시 비밀번호 입력해야 진입 가능
일반 회원 : 프로필 사진, 비밀번호, 기본 배송지, 휴대폰 번호, 환불계좌(은행명, 계좌번호)변경 가능
판매자 회원 : 추가로 마켓명, 발송지, 인출계좌 변경 가능

● 판매자 등록
마켓명, 배송지 주소(환불 시 필요), 계좌 입력 후 판매자 등록 가능

● 판매자 메뉴 – 상품등록 / 관리
상품등록 가능 : 상품명, 카테고리 대분류 소분류 선택, 단가, 배송비, 주문 옵션, 상품 준비 기간(수제품 특성상 준비기간 필요), 썸네일 이미지와 상품 설명 이미지 첨부, 상세 설명 등 입력 후 등록
-> 플리마켓 특성상 다양한 물건이 업로드 되고 고객의 Needs에 따라 옵션이 다양해질 수 있는점을 착안하여 판매자가 옵션을 ‘선택’하는 것이 아닌 직접 입력 할 수 있고 개수도 지정할 수 있도록 구현
상품수정 가능 등록할 때 기입한 모든 것 수정 가능
상품삭제 가능

● 판매자 메뉴 – 판매내역
주문 번호, 상품명, 옵션/수량, 운송장 번호, 배송 상태 환불 여부 확인 가능
상품명 클릭시 해당 주문에 대한 주문 정보 확인 및 택배사, 운송장 번호 등록 가능(등록 시 상품 상태 배송중으로 업데이트)

● 판매자 메뉴 – 정산
인출 가능 금액, 전체 판매 완료 내역(건수), 정산 내역(건수) 확인 가능
인출 가능 금액 한도 내에서 인출 가능
인출 및 입금(구매자 수취확인 시 입금)내역 확인 가능

● Q&A – 회원 / 관리자
회원 : Q&A 작성 및 수정 삭제 가능(본인이 쓴 글만 수정 삭제 가능)
, Q&A게시판 목록에서 답변상태(답변 대기, 답변 완료) 확인 가능
관리자 : 들어온 문의에 대해 답변 가능, 답변 대기 목록과 답변 완료 목록으로 구분해 놓음

● 회원 관리
판매자 등록한 회원의 판매자 권한 회수 가능
가입한 모든 회원의 리스트 확인 가능

● 환불 처리
회원이 환불 신청한 주문에 대하여 환불 승인 가능

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

시연 영상

로그인 -> 회원가입

https://user-images.githubusercontent.com/107243294/189022714-616a3cbf-a1e9-44c1-9755-6cff87f74133.mp4

<br>
카테고리(대분류, 소분류), 검색, 상품 상세, 후기 리스트

https://user-images.githubusercontent.com/107243294/189022877-94cdd07f-c297-49bd-8a47-d01d84dc2c6e.mp4

<br>
채팅

https://user-images.githubusercontent.com/107243294/189023463-b12c173b-4202-45bb-8adf-1f153a53519a.mp4

<br>
장바구니 -> 주문

https://user-images.githubusercontent.com/107243294/189022954-2df8ac2d-b1cd-4aee-b631-1c392f98436e.mp4

<br>
바로구매 -> 주문 내역

https://user-images.githubusercontent.com/107243294/189023044-dd8331a2-e611-4f11-b22a-bf8ef15e5974.mp4

<br>
상품 후기

https://user-images.githubusercontent.com/107243294/189023113-4a8fdb8a-bdda-488b-9522-4b034661f4e9.mp4

<br>
일반회원 정보 변경 및 탈퇴

https://user-images.githubusercontent.com/107243294/189023191-799d6fc6-502e-4223-a0c2-46dcd31e5fad.mp4

<br>
판매자 등록 및 정보 수정

https://user-images.githubusercontent.com/107243294/189023260-c1e98358-789c-455f-87d2-103ece3e1f86.mp4

<br>
상품 등록

https://user-images.githubusercontent.com/107243294/189023319-90d0c3b6-f09d-4edb-8bc7-42812bf72394.mp4

<br>
상품 수정 삭제

https://user-images.githubusercontent.com/107243294/189023357-8df07665-fa30-42e9-a845-e023dd8300ea.mp4

<br>
배송정보 등록, 인출

https://user-images.githubusercontent.com/107243294/189023401-df7d66c4-5fce-441d-b688-94c535fd910b.mp4

<br>
Q&A(회원 및 관리자)

https://user-images.githubusercontent.com/107243294/189023605-3c4cd0b9-64d1-44f9-a5dd-a959d084d7ff.mp4

<br>
환불신청 및 환불처리

https://user-images.githubusercontent.com/107243294/189023666-f80d157e-83e7-4420-8f36-c3ddda5b441a.mp4

<br>
회원관리 -> 판매자 권한 회수

https://user-images.githubusercontent.com/107243294/189023776-63d70010-88bc-4022-b0f9-3fecfecd197c.mp4



