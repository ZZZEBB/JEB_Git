package sec01.ex01;

public class TestVO {
	int id;
	String userName;
	String univ;
	String birth;
	String email;
	
	public TestVO() {
	}
	
	//id값은 자동증가생성
	public TestVO(String userName, String univ, String birth, String email) {
		this.userName = userName;
		this.univ = univ;
		this.birth = birth;
		this.email = email;
	}
	
	public TestVO(int id, String userName, String univ, String birth, String email) {
		this.id = id;
		this.userName = userName;
		this.univ = univ;
		this.birth = birth;
		this.email = email;
		
		 System.out.println("@@@VO@@@" + id); 
		 System.out.println("@@@VO@@@" + userName);
		 System.out.println("@@@VO@@@" + univ);
		 System.out.println("@@@VO@@@" + birth);
		 System.out.println("@@@VO@@@" + email);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUniv() {
		return univ;
	}

	public void setUniv(String univ) {
		this.univ = univ;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
