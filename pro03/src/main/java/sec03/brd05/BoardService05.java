package sec03.brd05;

import java.util.List;

import sec03.brd01.ArticleVO;

public class BoardService05 {
	BoardDAO05 boardDAO05;
	
	public BoardService05() {
		boardDAO05 = new BoardDAO05();
	}
	
	public List<ArticleVO05> listArticles(){
		List<ArticleVO05> articlesList = boardDAO05.selectAllArticles();
		return articlesList;
	}
	
	public int addArticle(ArticleVO05 article) {
		return boardDAO05.insertNewArticle(article);
	}
	
	public ArticleVO05 viewArticle(int articleNO) {
		ArticleVO05 article = null;
		article = boardDAO05.selectArticle(articleNO);
		return article;
	}
	
	public void modArticle(ArticleVO05 article) {
		boardDAO05.updateArticle(article);
	}
}
