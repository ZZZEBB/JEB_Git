package sec01.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;

import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;


public class MemberDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactroy;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactroy = (DataSource)envContext.lookup("jdbc/servletex");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List listMember() {
		List memberList = new ArrayList();
		try {
			con = dataFactroy.getConnection();
			
			String query = "select * from t_member order by joinDate desc";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				MemberVo memberVo = new MemberVo(id, pwd, name ,email, joinDate);
				memberList.add(memberVo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	public void addMember(MemberVo m) {
		try {
			con = dataFactroy.getConnection();
			String id = m.getId();
			String pwd = m.getPwd();
			String name = m.getName();
			String email = m.getEmail();
			
			String query = "INSERT INTO t_member(id,pwd,name,email)" + "VALUES(?,?,?,?)";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeQuery();
			
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
