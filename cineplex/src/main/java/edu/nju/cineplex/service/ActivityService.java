package edu.nju.cineplex.service;

import java.util.List;

import edu.nju.cineplex.model.Question;
import edu.nju.cineplex.model.Schedule;
import edu.nju.cineplex.model.User;

public interface ActivityService {

	public void addActivity(Question question, int movieId, int[] scheduleId);


	public List<Schedule> availabelSchedule();


	List<Question> getAllQuestions();


	List<Question> getAvailable(User user);


	public void attendActivity(User user, int oid);

}
