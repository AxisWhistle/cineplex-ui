package edu.nju.cineplex.vo;

public class MovieInfo {
	
	int id;
    String cover;//封面url（暂时是1条url，如果有时间做成多张图片的那种吧，url在前端分析一下，多个图片链接用;隔开）
    String name;//影片名称
    String introduction;//影片介绍
    String actor;//主演,可能有多个，用;隔开
    String type;//影片类型，可能有多个，用;隔开
    int duration;//影片时长,单位为分钟
    String director;//导演, 可能有多个，用;隔开
    String language;//语言
    String onTime;//上线日期
    
    
	public MovieInfo(int id, String cover, String name, String introduction,
			String actor, String type, int duration, String director,
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
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
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
