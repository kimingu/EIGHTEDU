<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#ingu {
	color: black;
	font-size: 24px;
}

#koo {
	color: rgb(154, 157, 160);
	font-size: 20px;
}

#koo:hover {
	color: black;
}

#line {
	border: 1px solid lightgray;
	width: 50%;
	height: 600px;
	margin-top: 10px;
}

#line2 {
	border: 1px solid lightgray;
	width: 20%;
	height: 600px;
	margin-top: 10px;
	margin-left: 20px;
}

#info {
	background: black;
	padding: 1px 5px;
	color: white;
	margin: 0px 3px 0px 0px;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
}

#info-line {
	margin: 10px;
	width: 700px;
}

#info-line2 {
	margin: 10px;
}

#subject {
	margin: 10px;
	margin-top: 1px;
	font-size: 20px;
	border-bottom: 2px solid #ccc;
	transition: all .2s ease-in-out;
	border-radius: 0;
	border: 0;
}

#board-content {
	border: 1px solid white;
	margin: 10px;
	margin-top: 1px;
}

input-title:focus {
	border-color: #F9800B;
}

#center {
	width: 80%;
	height: 1000px;
}

#koko {
	position: relative;
	width: 16.5%;
	padding-right: 15px;
	padding-left: 15px;
}

#insert-btn {
	margin-top: 320px;
}
</style>

</head>

<body>
	<%@ include file="../common/menuBar.jsp"%>
	<form action="<%=contextPath%>/insert.no" method="post">


<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-white sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" id="ingu">
              <span data-feather="home"></span>
             고객센터 
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath%>/list.no?n_name=공지사항"id="koo">
              <span data-feather="file"></span>
              공지사항      
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath%>/list.no?n_name=qna" id="koo">
              <span data-feather="shopping-cart"></span>
      Q & A
            </a>
          </li>
        </ul>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath%>/list.no?n_name=문의내역" id="koo">
              <span data-feather="file-text"></span>
              문의하기
                 
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://open.kakao.com/o/s7Qic8Db" id="koo">
              <span data-feather="file-text"></span>
              실시간 상담 
             
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/views/customerPage/howToCome.jsp" id="koo">
              <span data-feather="file-text"></span>
              찾아오시는 길 
                 <hr>
            </a>
          </li>
          <li class="nav-item">
           
          </li>
        </ul>
      </div>
    </nav>


				<div id="line">

					<div id="info-line" style="width: 97%;">
						<span id="info">안내</span> <span>글 작성시 첨부파일을 사용하시면 좀 더 빠른 문의
							해결이 가능합니다.</span>
						<hr>
					</div>

					<div id="notice-title">
						<input type="text" class="input-title" id="subject" name="n_title"
							placeholder="제목을 입력하세요." style="width: 97%;">
					</div>

					
					<div id="board-content">
						<textarea id="summernote" name="n_content" >
						</textarea>

					</div>

					<script>
						$(document).ready(function() {

							$('#summernote').summernote({
								
								

								height : 435, // 에디터의 높이 

								minHeight : null,

								maxHeight : null,

								focus : true,

								lang : 'ko-KR',
								
									 onImageUpload: function(files, editor, welEditable) {
							                sendFile(files[0], editor, welEditable);
							            }
						



							});

						});

						var postForm = function() {

							var contents = $('textarea[name="contents"]').html(
									$('#summernote').code());

						}
		</script>


				</div>


				<div id="line2">
					<div id="info-line2">
						<span>게시판 선택</span>
						<div>
							<select style="width: 100%" id="insertnotice"
								name="select_n_name" onchange="optionChange()">								
								<% if(loginUser.getUserId().equals("master")){ %>
								<option value="——">——</option>
								<option value="공지사항">공지사항</option>
								<option value="qna">Q&A</option>
								<option value="문의내역">문의내역</option>
								<%} else { %>
								<option value="——">——</option>
								<option value="문의내역">문의내역</option>
								<%} %>
							</select>
						</div>
					</div>
					<hr>
					<div id="info-line2">
						<span>카테고리 선택</span>
						<div>
							<select id="insertCategory" name="select_m_code"
								style="width: 100%">
								<option>——</option>
								<option>——</option>
								<option>——</option>
								<option>——</option>
								<option>——</option>
								<option>——</option>
							</select>
							
							<script>
								function optionChange() {
									var notice = [ "——", "주요공지", "일반공지","진행중이벤트", "완료된이벤트", "에잇에듀뉴스" ];
									var noticeVal = ["——", "301", "302", "303", "304", "305"];
									
									var qna = [ "——", "회원관련", "결제관련", "강의관련","환불관련", "탈퇴관련" ];
									var qnaVal = ["——", "311", "312", "313", "314", "315"];
									
									var inquiry = [ "——", "미접수문의", "완료된문의", "미해결문의" ];
									var inquiryVal = ["——", "321", "322", "323"];

									var selectOption = $('#insertnotice').val();

									var changeOption;
									var optionVal;
									
									if (selectOption == "공지사항") {
										changeOption = notice;
										optionVal = noticeVal;
									} else if (selectOption == "qna") {
										changeOption = qna;
										optionVal = qnaVal;
									} else if (selectOption == "문의내역" && <%=!loginUser.getUserId().equals("master")%>){
										changeOption = ["미접수문의"];
										optionVal = ["321"];
									} else if (selectOption == "문의내역") {
										changeOption = inquiry;
										optionVal = inquiryVal;
									} else{
										changeOption = ["——","——","——","——","——","——"];
										optionVal = ["——","——","——","——","——","——"];
									}

									$('#insertCategory').empty();

									for (var i = 0; i < changeOption.length; i++) {
										var option = $("<option" + " value='" + optionVal[i] + "'>"+changeOption[i]+"</option>");
										$('#insertCategory').append(option);
									}
								}
							</script>
						</div>
						<hr>

			
					</div>
					<div id="insert-btn" align="center">
						<hr>
						<button id="submit" type="submit">등록하기</button>
						<button type="button" onclick="javascript:history.back();">취소하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- FOOTER -->
	<div id="footer-wrapper">
		<div id="footer1"></div>
		<div id="footer2"></div>
		<div id="footer3">
			<a href="<%=contextPath %>/list.no?n_name=공지사항"> 공지사항 </a> <a href="<%=contextPath %>/list.no?n_name=문의내역"> 문의하기 </a> 
			<a href="https://open.kakao.com/o/s7Qic8Db">실시간 상담</a> <a href="<%=contextPath %>/list.no?n_name=qna"> 자주 찾는 질문 </a> <a href="<%=contextPath %>/views/customerPage/howToCome.jsp"> 찾아오시는 길 </a> 
			<a href="<%=contextPath %>/leclist.le"> 강의보기 </a> <a href="<%=contextPath %>/mainList.bo"> 커뮤니티 </a>
			<p>업체 및 기관 : 주식회사 에잇에듀 | 개인 : EIGHT.co</p>
			<p>Copyright ⓒ www.eightedu.com</p>
		</div>
		</div>
</body>
</html>