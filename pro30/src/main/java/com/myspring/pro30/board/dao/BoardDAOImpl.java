package com.myspring.pro30.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.board.vo.ImageVO;

@Repository("boardDAO")
public class BoardDAOImpl  implements BoardDAO {

   @Autowired
   private SqlSession sqlSession;

   @Override
   public List selectAllArticlesList() throws DataAccessException {
      List<ArticleVO> articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
      return articlesList;
   }

   @Override
   public int insertNewArticle(Map articleMap) throws DataAccessException {
      int articleNO = selectNewArticleNO();
      articleMap.put("articleNO", articleNO);
      sqlSession.insert("mapper.board.insertNewArticle", articleMap);
      return articleNO;
   }
   
   @Override
   public int insertNewReply(Map articleMap) throws DataAccessException {
      int articleNO = selectNewArticleNO();
      articleMap.put("articleNO", articleNO);
      sqlSession.insert("mapper.board.insertNewReply", articleMap);
      return articleNO;
   }

   @Override
   public ArticleVO selectArticle(int articleNO) throws DataAccessException {
      return sqlSession.selectOne("mapper.board.selectArticle", articleNO);
   }

   @Override
   public void updateArticle(Map articleMap) throws DataAccessException {
      sqlSession.update("mapper.board.updateArticle", articleMap);
      
   }

   @Override
   public void deleteArticle(int articleNO) throws DataAccessException {
      sqlSession.delete("mapper.board.deleteArticle", articleNO);
      
   }

   @Override
   public List selectImageFileList(int articleNO) throws DataAccessException {
      List<ImageVO> imageFileList = null;
      imageFileList = sqlSession.selectList("mapper.board.selectImageFileList", articleNO);
      return imageFileList;
   }
   
   private int selectNewArticleNO() throws DataAccessException {
      return sqlSession.selectOne("mapper.board.selectNewArticleNO");
   }
   
   private int selectNewImageFileNO() throws DataAccessException {
      return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
   }
   
   
   
}