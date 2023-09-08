package sec03.brd05;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.apache.commons.io.FileUtils;

@WebServlet("/board/*")
public class BoardController05 extends HttpServlet {

	private static String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	BoardService05 boardService05;
	ArticleVO05 articleVO05;
	
	public void init(ServletConfig config) throws ServletException {
		boardService05 = new BoardService05();
		articleVO05 = new ArticleVO05();
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
			List<ArticleVO05> articlesList = new ArrayList<ArticleVO05>();
			
			if(action == null) {
				articlesList = boardService05.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board04/listArticles04.jsp";
				
			}else if(action.equals("/listArticles.do")) {
				articlesList = boardService05.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board04/listArticles04.jsp";
				
			} else if (action.equals("/articleForm.do")){
				nextPage = "/board04/articleForm04.jsp";
				
			} else if (action.equals("/addArticle.do")) {
				
				int articleNO = 0;
				
				Map<String, String> articleMap = upload(request, response);
				
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");
				
				articleVO05.setParentNO(0);
				articleVO05.setId("cat");
				articleVO05.setTitle(title);
				articleVO05.setContent(content);
				articleVO05.setImageFileName(imageFileName);
				articleNO = boardService05.addArticle(articleVO05);
				if(imageFileName != null && imageFileName.length() != 0) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
					destDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					srcFile.delete();
					
				}
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + "	alert('새 글을 추가했습니다.');"	+ "location.href = '" + request.getContextPath() + "/board/listArticles.do';" + "</script>");
				
				return;
			} else if (action.equals("/viewArticle.do")){
				String articleNO = request.getParameter("articleNO");
				articleVO05 = boardService05.viewArticle(Integer.parseInt(articleNO));
				request.setAttribute("article", articleVO05);
				nextPage = "/board04/viewArticle04.jsp";
			} else if (action.equals("/modArticle.do")) {
				Map<String, String> articleMap = upload(request, response);
				int articleNO = Integer.parseInt(articleMap.get("articleNO"));
				articleVO05.setArticleNO(articleNO);
				
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");
				
				articleVO05.setParentNO(0);
				articleVO05.setId("cat");
				articleVO05.setTitle(title);
				articleVO05.setContent(content);
				articleVO05.setImageFileName(imageFileName);
				
				boardService05.modArticle(articleVO05);
				if(imageFileName != null && imageFileName.length() != 0) {
					String originalFileName = articleMap.get("originalFileName");
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
					destDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + originalFileName);
					
					oldFile.delete();
				}
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + "   alert('글을 수정했습니다.');" + " location.href = '" + request.getContextPath() + "/board/viewArticle.do?articleNO = " + articleNO + "';" + "</script>");
				return;
			} else {
				nextPage = "/board04/listArticles04.jsp";
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
