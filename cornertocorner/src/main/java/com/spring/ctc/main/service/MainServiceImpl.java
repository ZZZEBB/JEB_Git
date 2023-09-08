package com.spring.ctc.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ctc.main.dao.MainDAO;

@Service("mainService")
@Transactional(propagation=Propagation.REQUIRED)
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDAO mainDAO;
	
	/*
	 * public List<String> keywordSearch(String keyword) throws Exception {
	 * List<String> list=mainDAO.selectKeywordSearch(keyword); return list; }
	 */

}
