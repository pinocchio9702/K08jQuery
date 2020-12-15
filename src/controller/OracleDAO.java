package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OracleDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//기본생성자에 DBCP(커넥션풀)을 통해 DB연결
	public OracleDAO() {
		try {
			Context initctx = new InitialContext();
			Context ctx = (Context)initctx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			con = source.getConnection();
			
			
			System.out.println("DBCP연결 성공(인자생성자)");
		} catch (Exception e) {
			System.out.println("DBCP연결 실패(인자생성자)");
			e.printStackTrace();
		}
	}
	

	public void close() {
		try {
			//연결을 해제하는 것이 아니고 풀에 다시 반납한다.
			if(rs!=null) rs.close();
			if(psmt !=null) psmt.close();
			if(con !=null) con.close();
		}
		catch (Exception e) {
			System.out.println("자원반납시 예외발생");
		}
	}

	//그룹함수 count()를 통해 회원의 존재유무만 판단한다.
	public boolean isMember(String id, String pass) {
		//쿼리문 작성
		String sql = "SELECT COUNT(*) FROM member  WHERE id=? AND pass=?";
		int isMember = 0;
		boolean isFlag = false;

		try {
			//prepare객체를 통해 쿼리문을 전송한다.
			psmt = con.prepareStatement(sql);
			//쿼리문의 인파라미터 설정(DB의 인덱스는 1부터 시작)
			psmt.setString(1, id);
			psmt.setString(2, pass);
			//쿼리문 실행후 결과는 ResultSet객체를 통해 반환받음
			rs = psmt.executeQuery();
			//실행결과를 가져오기 위해 next()를 호출한다.
			rs.next();
			//select절의 첫번쨰 결과값을 얻어오기 위한 getInt()사용
			isMember = rs.getInt(1);
			System.out.println("affected : " + isMember);
			if (isMember == 0) { //회원이 아닌경우
				isFlag = false;
			} else { //회원인 경우(해당 아이디, 패스워드가 일치함)
				isFlag = true;
			}
		} catch (Exception e) {
			//예외가 발생한다면 확인이 불가능함으로 무조건 false를 반환한다.
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
}
