package edu.nju.cineplex.dao;

import java.util.List;

import edu.nju.cineplex.model.Question;

public interface QuestionDao {

	//public void merge(Question question);

	public void merge(Question question);
	
	public List<Question> getAllQuestions();

	public List<Question> getAvailable(int id);

}
