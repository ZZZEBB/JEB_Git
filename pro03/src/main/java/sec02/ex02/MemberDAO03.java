package sec02.ex02;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberDAO03 {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MemberDAO03() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/servletex");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberVo03> listMembers() {
		List<MemberVo03> membersList = new ArrayList();
		try {
			conn = dataFactory.getConnection();
			
			String query = "select * from t_member order by joinDate desc";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				MemberVo03 memberVo03 = new MemberVo03(id, pwd, name ,email, joinDate);
				membersList.add(memberVo03);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return membersList;
	}
	
	public void addMember(MemberVo03 m) {
		try {
			conn = dataFactory.getConnection();
			
			String id = m.getId();
			String pwd = m.getPwd();
			String name = m.getName();
			String email = m.getEmail();
			
			String query = "insert into t_member(id, pwd, name, email)" + "values(?, ?, ?, ?)";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberVo03 findMember(String _id) {
		MemberVo03 memInfo = null;
		try {
			conn = dataFactory.getConnection();
			
			String query = "select * from t_member where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, _id);
			System.out.println(query);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");
			String email = rs.getString("email");
			Date joinDate = rs.getDate("joinDate");
			
			memInfo = new MemberVo03(id, pwd, name, email, joinDate);
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memInfo;
	}
	
	public void modMember(MemberVo03 memberVo03) {
		String id = memberVo03.getId();
		String pwd = memberVo03.getPwd();
		String name = memberVo03.getName();
		String email = memberVo03.getEmail();
		try {
			conn = dataFactory.getConnection();
			
			String query = "update t_member set pwd=?, name=?, email=? where id=?";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setNString(4, id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void delMember(String id) {
		try {
			conn = dataFactory.getConnection();
			
			String query = "delete from t_member where id=?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
