package edu.nju.cineplex.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="user")
public class User {
	@Id
	private String id;//用户名
	private String password;//密码
	private char gid;//用户群;0表示manager,1表示服务员,2表示会员
	@OneToOne(mappedBy="user",cascade=CascadeType.ALL)
	private Member member;
	
	@OneToMany(mappedBy="user",cascade=CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.EXTRA)
	private Set<Ticket> tickets;
	
	public User(){
		tickets=new HashSet<Ticket>();
	}
	
	public void addTicket(Ticket ticket){
		tickets.add(ticket);
	}
	
	public Set<Ticket> getTickets() {
		return tickets;
	}
	public void setTickets(Set<Ticket> tickets) {
		this.tickets = tickets;
	}
	
//	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public char getGid() {
		return gid;
	}
	public void setGid(char gid) {
		this.gid = gid;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	
	

}
