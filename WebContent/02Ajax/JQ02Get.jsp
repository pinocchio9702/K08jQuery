<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css">
<script src="../common/jquery/jquery-3.5.1.js"></script>
<title>JQ02Get.jsp</title>
<script>
	/*
	 jquery에서 제공하는 Ajax관련 메소드
	 2. $get()
	 :HTTP get방식을 통해 서버로부터 데이터를
	 받을때 사용하는 메소드
	 형식] $.get(url, param, callback);
	 -url : 정보를 요청할 경로 및 파일명
	 -param : 서버로 전송할 파라민터로 JSON형태로
	 기술한다.
	 -callback : 요청이 성공했을때 실행되는 콜백(Callback)
	 메소드. 콜백 메소드가 호출될때 전달되는 파라미터를 통해
	 성공혹은 실패여부를 판달할 수 있다.
	 ※ 서버로 요청시 파라미터가 없는 경우 생략가능함
	 */
	$(function() {
		$('#btnXml').click(
				function() {
					//요청 url, 콜백메소드
					$.get('./common/02NameCard.xml', function(data) {
						//alert(data);
						//요청 성공시 xml파일의 내용을 파라미터를 통해 전달해준다.
						console.log(data);
						//콜백해준 내용을 대상으로 파싱(Pasing)을 진행한다.
						/*
						find()을 통해 xml파일의 엘리먼트를 찾는다.
						attr()을 통해 엘리먼트의 속성에 접근한다.
						text()를 통해 태그사이의 값에 접근한다. 
						 */
						$(data).find("명함").each(
								function() {
									var html = "<div>이름 :"
											+ $(this).find("성명").attr("이름")
											+ "</div>";
									html += "<div>주소 :"
											+ $(this).find("주소").text()
											+ "</div>";
									html += "<div>직위 :"
											+ $(this).find("직위").text()
											+ "</div>";
									html += "<div>이메일 :"
											+ $(this).find("email").text()
											+ "</div>";
									html += "<div>핸드폰 :"
											+ $(this).find("Mobile").text()
											+ "</div>";
									html += "<div>전화번호 :"
											+ $(this).find("TEL").text()
											+ "</div>";
									html += "<div>카피라이트 :"
											+ $(this).find("copyright").text()
											+ "</div>";
									//html()로 기존의 내용을 갱신한다.
									$('#xmlDisplay').html(html);

									/*
									해당 영역의 내용을 empty()로 삭제한후 append()로
									내용을 추가한다. html()과 동일한 기능이 수행된다.
									 */
									//$('xmlDisplay').empty();
									//$('xmlDisplay').append(html);
								});
					});
				});
		/*
		서버로 요청시 파라미터가 필요한 경우 JSON으로 만들어서 
		사용하게 된다. 만약 폼값이 많아서 기술이 힘들경우
		serialize()를 통해 자동으로 JSON형태로 만들어 준다.
		 */
		$('#btnJSP').click(function() {
			$.get('./common/02PrintToday.jsp', {
				'msg' : $(this).text(), //해당버튼의 텍스트를 읽어온다.
				'varStr' : 'jQuery좋아요'
			}, function(data) {
				alert(data);
				$('#jspDisplay').html(data);
			});
		});

	});
	function locationGo(link) {
		window.open(link, '', 'width=500, height=500')
	}
</script>
</head>
<body>
	<div>
		<h2>$.get() 메소드 사용하기</h2>

		<h3>xml파일 읽어오기</h3>
		<button onclick="locationGo('./common/02NameCard.xml');">
			NameCard.xml바로가기</button>

		<button id="btnXml">XML데이터 읽어오기</button>

		<div class="displayDiv" id="xmlDisplay">XML데이터 정보를 디스플레이합니다.</div>


		<h3>jsp파일에서 읽어오기</h3>
		<button
			onclick="locationGo('common/02PrintToday.jsp?msg=안녕하세요&varStr=jQuery조아효');">
			PrintToday.jsp바로가기</button>
		<button id="btnJSP">JSP결과 읽어오기</button>
		<div class="disDisplay" id="jspDisplay">JSP결과를 디스플레이 합니다.</div>
	</div>
</body>

</html>