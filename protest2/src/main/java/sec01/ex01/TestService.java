package sec01.ex01;

import java.util.List;

public class TestService {
	TestDAO testDAO;
	
	public TestService() {
		testDAO = new TestDAO();
	}
	
	public List<TestVO> listStudents(){
		List<TestVO> studentsList = testDAO.listStudents();
		return studentsList;
	}
	
	public void addStudent(TestVO student) {
		testDAO.addStudent(student);
		System.out.println("@@@service@@@" + student);
	}

}
