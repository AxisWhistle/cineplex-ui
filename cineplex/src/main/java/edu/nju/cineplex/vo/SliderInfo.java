package edu.nju.cineplex.vo;

public class SliderInfo {
	int id;//
	String imgUrl;//海报图片地址
	String title;//海报信息标题
	String content;//海报信息内容
	String target;//海报对应链接
	public SliderInfo(int id, String imgUrl, String title, String content,
			String target) {
		super();
		this.id = id;
		this.imgUrl = imgUrl;
		this.title = title;
		this.content = content;
		this.target = target;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	
	
}
