<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
//폼값을 받음
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
//jsp에서 JSON객체 혹은 배열을 생성하기 위해 확장 라이브러리를 설치한 후
//해장 객체를 생성한다.
JSONObject jsonObj = new JSONObject();
/*
JSP에서 JSON객체 혹은 배열을 생성하기 위해 확장라이브러리를 설치한후
해당 객체를 생성한다.
	JSONObject클래스 : JSON객체를 생성한다.
		key, value를 사용하는 Map컬렉션과 사용법이 동일하다.
	JSONArray클래스 : JSON 배열을 생성하낟.
		index를 사용하는 list컬렉션과 사용법이 동일하다.
*/
if(user_id.equals("kosmo") && user_pw.equals("1234"))
{
	/*
		SJON객체를 생성하기 위해 put()을 사용한다.
	*/
	jsonObj.put("user_id", user_id);
	jsonObj.put("user_name", "홍길동");
	jsonObj.put("user_pw", user_pw);
	jsonObj.put("result", 1);//성공시 1로 생성한다.
	
}
else{
	//로그인 실패시 다른 정보 없이 result만 0으로 생성한다.
	jsonObj.put("result", 0);
}
//json객체를 String으로 변환한 후 화면에 출력한다.
String jsonTxt = jsonObj.toJSONString();
out.println(jsonTxt);
%>
