package user;
/*
 * XxxDAO 클래스 (Xxx는 테이블명)
 * DAO(Data Access Object)의 약자로 
 * 데이터 베이스의 data에 접근하기 위한 객체이다.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.JDBCUtil;

public class UserDAO {
	//DB 관련 참조 변수 선언 
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//SQL 명령어 
	private final String USER_GET 
		= "select id, password from users where id=? and password=?";
	
	//로그인 인증 처리 메소드 구현
	public UserDO getUser(UserDO userObj) {
		UserDO user = null;
		
		try {
			System.out.println("===>JDBC로 getUser()메소드 처리됨");
			
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(USER_GET);
			pstmt.setString(1, userObj.getId());
			pstmt.setString(2, userObj.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserDO(); //UserDO객체 생성
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			 JDBCUtil.close(rs, pstmt, conn);
		}
		return user;
	}
}
