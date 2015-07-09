package edu.nju.cineplex.vo;


import edu.nju.cineplex.model.Movie;
import edu.nju.cineplex.util.DateFormater;

public class MovieInfo {
	
	int id;
    String cover;//封面url（暂时是1条url，如果有时间做成多张图片的那种吧，url在前端分析一下，多个图片链接用;隔开）
    String name;//影片名称
    String introduction;//影片介绍
    String actor;//主演,可能有多个，用;隔开
    String type;//影片类型，可能有多个，用;隔开
    String duration;//影片时长,单位为分钟
    String director;//导演, 可能有多个，用;隔开
    String language;//语言
    String onTime;//上线日期
    String offTime;
    
    public MovieInfo(Movie m){
    	id=m.getId();
    	cover=m.getCover();
    	name=m.getName();
    	introduction=m.getIntroduction();
    	actor=m.getActor();
    	type=m.getType();
//    	duration=m.getDuration();
    	duration=DateFormater.minutesToDuration(m.getDuration());
    	director=m.getDirector();
    	language = m.getLanguage();
//    	Date timeDate = m.getOnTime();
//    	SimpleDateFormat s= new SimpleDateFormat("yyyy-MM-dd");
    	onTime=DateFormater.CalendarToString(m.getOnTime());
    	offTime=DateFormater.CalendarToString(m.getOffTime());
//    	System.out.println(onTime);
    }
    
    public Movie toMovie(){
    	Movie m = new Movie();
    	m.setCover(cover);
    	m.setName(name);
    	m.setIntroduction(introduction);
    	m.setActor(actor);
    	m.setType(type);
    	m.setDuration(DateFormater.StringToMinutes(duration));
    	m.setDirector(director);
    	m.setLanguage(language);
    	m.setOnTime(DateFormater.StringToCalendar(onTime));
    	m.setOffTime(DateFormater.StringToCalendar(offTime));
    	
    	return m;
    }
    
	public MovieInfo(int id, String cover, String name, String introduction,
			String actor, String type, String duration, String director,
			String language, String onTime) {
		super();
		this.id = id;
		this.cover = cover;
		this.name = name;
		this.introduction = introduction;
		this.actor = actor;
		this.type = type;
		this.duration = duration;
		this.director = director;
		this.language = language;
		this.onTime = onTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getOnTime() {
		return onTime;
	}
	public void setOnTime(String onTime) {
		this.onTime = onTime;
	}
    

}
