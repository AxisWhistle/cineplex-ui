package edu.nju.cineplex.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="discount")
public class Discount {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;


	private double charge;//对应每年应上交的会费金额
	
	
	private int level;//会员卡级别
	private String title;//级别头衔
	private double disaccount;//折扣值
	private double muticredit;//积分加倍值
	
	
	//级别对应的会员
	@OneToMany(mappedBy="disaccount")
	@LazyCollection(LazyCollectionOption.EXTRA)
	private Set<Member> members;
	
	public Discount(){
		members=new HashSet<Member>();
	}
	
	public void addMember(Member member){
		members.add(member);
	}
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getDisaccount() {
		return disaccount;
	}
	public void setDisaccount(double disaccount) {
		this.disaccount = disaccount;
	}
	public Set<Member> getMember() {
		return members;
	}
	public void setMember(Set<Member> members) {
		this.members = members;
	}

	

	public double getCharge() {
		return charge;
	}

	public void setCharge(double charge) {
		this.charge = charge;
	}

	public double getMuticredit() {
		return muticredit;
	}

	public void setMuticredit(double muticredit) {
		this.muticredit = muticredit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}
	
}
