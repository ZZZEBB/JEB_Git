package sec03.brd02;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/*@WebServlet("/board/*")*/
public class BoardController02 extends HttpServlet {

	private static String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	BoardService02 boardService02;
	ArticleVO02 articleVO02;
	
	public void init(ServletConfig config) throws ServletException {
		boardService02 = new BoardService02();
		articleVO02 = new ArticleVO02(); 
		System.out.println("init 메서드 호출");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nextPage ="";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action: " + action);
		try {
			List<ArticleVO02> articlesList = new ArrayList<ArticleVO02>();
			
			if(action == null) {
				articlesList = boardService02.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board02/listArticles02.jsp";
				
			}else if(action.equals("/listArticles.do")) {
				articlesList = boardService02.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board02/listArticles02.jsp";
				
			} else if (action.equals("/articleForm.do")){
				nextPage = "/board02/articleForm02.jsp";
				
			} else if (action.equals("/addArticle.do")) {
				
				Map<String, String> articleMap = upload(request, response);
				
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");
				
				articleVO02.setParentNO(0);
				articleVO02.setId("cat");
				articleVO02.setTitle(title);
				articleVO02.setContent(content);
				articleVO02.setImageFileName(imageFileName);
				
				boardService02.addArticle(articleVO02);
				nextPage = "/board/listArticles.do";
			} else {
				nextPage = "/board02/listArticles02.jsp";
			}
			
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> articleMap = new HashMap<String, String>();
		String encoding = "utf-8";
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + " = " + fileItem.getString(encoding));
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				} else {
					System.out.println("파라미터명 : " + fileItem.getFieldName());
					/*System.out.println("파일명 : " + fileItem.getName());*/
					System.out.println("파일크기 : " + fileItem.getSize() + "bytes");
					/*articleMap.put(fileItem.getFieldName(), fileItem.getName());*/
					if(fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						
						String fileName = fileItem.getName().substring(idx + 1);
						System.out.println("파일명 : " + fileName);
						
						articleMap.put(fileItem.getFieldName(), fileName);
						//익스플로러에서는 업로드 파일의 경로 제거후 map에 파일명 저장
						File uploadFile = new File(currentDirPath + "\\" +fileName);
						fileItem.write(uploadFile);
					} //end if
				} //end if
			} //end for
		} catch (Exception e) {
				e.printStackTrace();
		}
		return articleMap;
	}
	
	public void destroy() {
		System.out.println("destroy 메서드 실행");
	}

}
