package sec03.brd02;

import java.util.List;

public class BoardService02 {
	BoardDAO02 boardDAO02;
	
	public BoardService02() {
		boardDAO02 = new BoardDAO02();
	}
	
	public List<ArticleVO02> listArticles(){
		List<ArticleVO02> articlesList = boardDAO02.selectAllArticles();
		return articlesList;
	}
	
	public void addArticle(ArticleVO02 article) {
		boardDAO02.insertNewArticle(article);
	}
}
