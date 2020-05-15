<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="boardre.*"%>

<%
	request.setCharacterEncoding("UTF-8");
System.out.println("------ List.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>List.jsp</title>

<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}

.dataRow:hover {
	background: #eeeeee;
}

#search {
	border: 1px solid crimson;
	text-align: center;
}
</style>
<script>
	// 스크립트

	$(function() {
		$(".dataRow").click(function() {
			console.log("row click");
			var no = this.childNodes[0].nextElementSibling.innerText.trim();
			console.log(no);
			//location.href = "View.jsp?no=" + no;
			console.log("----");
		});
	});

	function list_home() {
		location.href = "List.jsp";
	}

	function check() {
		if (document.searchForm.keyWord.value == '') {
			alert("검색어를 입력 하시요")
			document.searchForm.keyWord.focus()
			return false;
		}//if
		document.searchForm.submit();//서버로 전송
	}// check() end

	function list() {
		document.listForm.action = "List.jsp";
		document.listForm.submit();//서버로 전송
	}//list() end

	function read(value1) {//value1 글번호
		document.readForm.action = "View.jsp";//글내용 보기 
		document.readForm.num.value = value1;//글번호값 넣기
		document.readForm.submit();//서버로 전송 Content.jsp 로 간다 
	}
</script>
</head>
<body>
	<!-- 내용 -->

	<%
		int nowPage = 0;//현재페이지
		int nowBlock = 0;//현재블럭

		int totalRecord = 0;//전체 글 갯수
		int numPerPage = 10;//페이지 당 글 갯수
		int totalPage = 0;//전체 페이지 수

		int totalBlock = 0;//전체 블럭 갯수 
		int pagePerBlock = 5;//블럭당 페이지 수 10개

		int beginPerPage = 0;//시작 페이지 ( 페이지의 시작 )    57

		String keyField = "";//키 필드 
		String keyWord = "";//검색 단어 
		Vector<BoardDTO> vec = null;

		if (request.getParameter("keyWord") != null) {
			//검색어가 있을때
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}

		if (request.getParameter("reload") != null) {
			//전체글 리스트 
			if (request.getParameter("reload").equals("true")) {
				keyField = "";//키 필드 
				keyWord = "";//검색 단어 
			}
		}

		boardre.BoardDAO dao = new boardre.BoardDAO();
		vec = dao.getBoardList(keyField, keyWord);//dao메서드호출
		totalRecord = vec.size();//총 글갯수

		if (request.getParameter("page") != null) {
			nowPage = Integer.parseInt(request.getParameter("page"));
		}//if

		beginPerPage = nowPage * numPerPage;//시작 페이지 계산
		//             0 * 10 = 0   ( 0~9)
		//             1 * 10 = 10  (10~19)
		//             2 * 10 = 20  (20~29)
		//             3 * 10 = 30  (30~39)
		//             4 * 10 = 40  (40~49)

		totalPage = (int) (Math.ceil((double) totalRecord / numPerPage));//올림값,전체페이지
		totalBlock = (int) (Math.ceil((double) totalPage / pagePerBlock));//전체 블럭계산

		System.out.println("beginPerPage " + beginPerPage);
		System.out.println("nowPage " + nowPage);
		System.out.println("numPerPage " + numPerPage);
		System.out.println("totalPage " + totalPage);
		System.out.println("totalBlock " + totalBlock);

		if (request.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		}
	%>



	<div class="container">
		<h2 onclick="list_home()">List.jsp</h2>

		<div class="table">


			<%
				if (vec.isEmpty()) {
					out.println("등록된 글이 없습니다 ");
				} else {
			%>
			<table class="table">
				<tr>
					<td colspan="5" align="center">Total:<%=totalRecord%>&nbsp;&nbsp;
						(<font color="blue"><%=nowPage + 1%>/<%=totalPage%></font>)
					</td>
				</tr>

				<thead>
					<tr>
						<th>번호</th>
						<th>글제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조횟수</th>
					</tr>
				</thead>



				<%
					for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
							if (i == totalRecord) {
								break;
							}//for 탈출

							BoardDTO dto = vec.get(i);

							String name = dto.getName();
							String subject = dto.getSubject();
							String email = dto.getEmail();
							String regdate = dto.getRegDate();

							int depth = dto.getDepth();
							int num = dto.getNum();
							int count = dto.getCount();
				%>


				<tr class="dataRow">
					<!-- 글번호 -->
					<!-- <td><%=totalRecord - i%> </td>  -->
					<td><%=totalRecord - i%></td>

					<!-- 글제목 -->
					<td>
						<%
							//답글 들여쓰기
									if (depth > 0) {
										for (int j = 0; j < depth; j++) {
											//	out.println("&nbsp;&nbsp;");
											out.println("<strong>┗</strong>");
										}//for
									}//if
						%> <!-- 글제목을 클릭하면 글내용보기로 가기  **********--> <!--  --> <!--  --> <a
						href="javaScript:read('<%=num%>')"><%=subject%></a>
					</td>

					<!-- 이름을 클릭하면 메일보내기 -->
					<td><a href="mailto:<%=email%>"><%=name%></a></td>

					<td><%=regdate%></td>
					<td><%=count%></td>

				</tr>
				<%
					}//for end
				%>



				<!-- 페이지 처리 start ........................... -->
				<tr>
					<td colspan="5" style="text-align: center">

						<ul class="pagination">
							<!-- 1. 이전 n개 -->
							<li>
								<!-- ----이전 n개 start----- --> <%
 	if (totalRecord != 0) {// 글이 존재하면
 			if (nowBlock > 0) {// 이전 블럭
 %> <%-- 이전블럭 --%> <a
								href="List.jsp?nowBlock=<%=nowBlock - 1%>&
		 page=<%=((nowBlock - 1) * pagePerBlock + 9)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
									≪<%=pagePerBlock%>
							</a> <%
 	}//if
 %> <!-- ----이전 n개 end----- -->
							</li>

							<!-- 2. 탭 목록 -->
							<%
								//페이지 처리
										for (int i = 0; i < pagePerBlock; i++) {
							%>
							<li>
								<!-- --> <a
								href="List.jsp?nowBlock=<%=nowBlock%>&page=<%=(nowBlock * pagePerBlock) + i%>">
									<%=(nowBlock * pagePerBlock) + i + 1%>
							</a> <!-- --> <!-- --> <%
 	if (((nowBlock * pagePerBlock) + i + 1) == totalPage) {
 					//3*10=30+4+1==35
 					//마지막 페이지 인가
 					break;//for 탈출 
 				}//if
 			}//for
 %>
							</li>

							<!-- 3. 다음 n개  -->
							<li>
								<!-- ----다음 n개 start----- --> <%
 	//다음블럭  
 			if (totalBlock > nowBlock + 1) {
 %> <!--  --> <!--  --> <!--  --> <a
								href="List.jsp?nowBlock=<%=nowBlock + 1%>&page=<%=(nowBlock + 1) * pagePerBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
									〉〉<%=pagePerBlock%>
							</a> <%
 	}//if 다음블럭 end
 		}//if end
 %> <!-- ----다음 n개 end----- -->
							</li>




						</ul> <!-- 페이지 카운터 end............ -->
					</td>
				</tr>
				<!-- 페이지 처리 end ........................... -->
				<!-- 페이지 처리 end ........................... -->

				<tr>
					<td colspan="5">
						<div class="pull-right">
							<!--  -->
							<!--  -->
							<a href="Post.jsp" class="btn btn-primary">글쓰기</a>
							<!--  -->
							<!--  -->
							<!--  -->
							<a href="javaScript:list()" class="btn btn-warning">리스트 처음으로</a>
							<!--  -->
						</div>
					</td>
				</tr>
			</table>
			<%
				}//else end
			%>




			<!-- searchform -->
			<div id="search">
				<form name="searchForm" action="List.jsp" method="post"
					class="form-inline">


					<div class="form-group">
						<select name="keyField" id="keyField" class="form-control">
							<option value="subject">글제목</option>
							<option value="name">글쓴이</option>
							<option value="content">글내용</option>
						</select>
					</div>

					<div class="form-group">
						<input type="text" name="keyWord" size="20" class="form-control">
					</div>

					<input type="hidden" name="page" value="0">


					<button type="button" onClick="check()" class="btn btn-success">검색</button>



				</form>
			</div>
			<!-- searchform  end -->


		</div>
		<!--  class="table" end-->
	</div>
	<!-- class="container" end-->

	<!--  -->

	<%--listForm  자바스크립트를 함께 사용 --%>
	<form name="listForm" method="post">
		<!--  -->
		<input type="hidden" name="reload" value="true">
		<!--  -->
		<input type="hidden" name="page" value="0">
		<!--  -->
		<input type="hidden" name="nowBlock" value="0">
		<!--  -->
	</form>

	<%--readForm  자바스크립트를 함께 사용 --%>
	<form name="readForm" method="post">
		<!-- num값은 javascript 에서 넣었음 -->
		<input type="hidden" name="num" value="">
		<!--  -->
		<input type="hidden" name="page" value="<%=nowPage%>">
		<!--  -->
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<!--  -->
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<!--  -->
	</form>


</body>
</html>





