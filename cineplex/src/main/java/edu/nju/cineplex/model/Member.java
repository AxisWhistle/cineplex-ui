package edu.nju.cineplex.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


@Entity
@Table(name="member")
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	private String name;//会员名字
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="uid")
	private User user;//对应账号
	private Date birthday;//绳梯
	
	private Date active;//激活日期
	private Date resumn;//暂停日期
	private Date register;
	@ManyToOne
	@JoinColumn(name="cid")
	private City city;//居住地
	private char gender;//性别
	private int credit=0;//积分
	private double balance=0;//账户余额
	private double total=0;//总充值额度
	
	private int state=0;//会员卡状态，0未激活，1已激活，2暂停，3停止，4取消
	
	@OneToMany(mappedBy="member")
	@LazyCollection(LazyCollectionOption.EXTRA)
	private Set<Recharge> recharges;//充值记录
	
	@OneToMany(mappedBy="member",cascade=CascadeType.ALL)
	
	@LazyCollection(LazyCollectionOption.EXTRA)
	private Set<Consume> consumes;//消费记录
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="did")
	private Discount disaccount;//会员卡级别折扣
	
	@ManyToMany(mappedBy="members",cascade=CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private Set<Options> options;
	
	public Member(){
		recharges=new HashSet<Recharge>();
		consumes=new HashSet<Consume>();
		options=new HashSet<Options>();
	}
	public void addRecharge(Recharge recharge){
		recharges.add(recharge);
	}
	
	public Set<Options> getOptions() {
		return options;
	}
	public void setOptions(Set<Options> options) {
		this.options = options;
	}
	public void addConsume(Consume consume){
		consumes.add(consume);
	}
	public void addOption(Options option){
		options.add(option);
	}
	public Set<Consume> getConsumes() {
		return consumes;
	}
	public void setConsumes(Set<Consume> consumes) {
		this.consumes = consumes;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Date getActive() {
		return active;
	}
	public void setActive(Date active) {
		this.active = active;
	}
	public Date getResumn() {
		return resumn;
	}
	public void setResumn(Date resumn) {
		this.resumn = resumn;
	}
	
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getId() {
		return id;
	}
	public Set<Recharge> getRecharges() {
		return recharges;
	}
	public void setRecharges(Set<Recharge> recharges) {
		this.recharges = recharges;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public Discount getDisaccount() {
		return disaccount;
	}
	public void setDisaccount(Discount disaccount) {
		this.disaccount = disaccount;
	}
	public Date getRegister() {
		return register;
	}
	public void setRegister(Date register) {
		this.register = register;
	}
	
	
}
