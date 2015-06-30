package edu.nju.cineplex.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


@Entity
@Table(name="options")
public class Options {
	/**
	 * 问题选项,多个对应一个question=》表option
	 * 
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="qid")
	private Question question;
	private String content;
	private String flag;
	
	
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(name="answer",joinColumns={@JoinColumn(name="oid")},
		inverseJoinColumns={@JoinColumn(name="mid")})
	@LazyCollection(LazyCollectionOption.EXTRA)
	private Set<Member> members;
	
	
	public Options(){
		members=new HashSet<Member>();
	}
	
	public void addMember(Member member){
		members.add(member);
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}
	

}
