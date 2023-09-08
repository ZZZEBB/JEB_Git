package sec01.ex01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;

import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;

public class TestDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactroy;
	
	public TestDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactroy = (DataSource)envContext.lookup("jdbc/servletex");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List listStudents() {
		List studentsList = new ArrayList();
		try {
			con = dataFactroy.getConnection();
			
			String query = "select id, userName, univ, STR_TO_DATE(birth, '%Y%m%d') as birth, email from test_member order by id";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				int id = rs.getInt("id");
				String userName = rs.getString("userName");
				String univ = rs.getString("univ");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				
				TestVO student = new TestVO();
				student.setId(id);
				student.setUserName(userName);
				student.setUniv(univ);
				student.setBirth(birth);
				student.setEmail(email);
				
				studentsList.add(student);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentsList;
	}
	public void addStudent(sec01.ex01.TestVO student) {
		
		try {
			con = dataFactroy.getConnection();
			
			int id = student.getId();
			String userName = student.getUserName();
			String univ = student.getUniv();
			String birth = student.getBirth();
			String email = student.getEmail();
			
			String query = "insert into test_member(id, userName,univ,birth,email)" + " values(?,?,?,?,?)";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, id);
			pstmt.setString(2, userName);
			pstmt.setString(3, univ);
			pstmt.setString(4, birth);
			pstmt.setString(5, email);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
