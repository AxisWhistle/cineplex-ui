package edu.nju.cineplex.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.dao.QuestionDao;
import edu.nju.cineplex.model.Question;
@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public void merge(Question question) {
		baseDao.merge(question);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Question> getAllQuestions(){
		return baseDao.getAllList(Question.class);
	}

	@Override
	public List<Question> getAvailable(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
