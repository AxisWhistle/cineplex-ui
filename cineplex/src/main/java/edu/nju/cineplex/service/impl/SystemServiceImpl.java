package edu.nju.cineplex.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import javax.swing.text.html.Option;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.cineplex.dao.MemberDao;
import edu.nju.cineplex.dao.MovieDao;
import edu.nju.cineplex.model.*;
import edu.nju.cineplex.service.*;
import edu.nju.cineplex.util.CreditStrategy;

@Service
public class SystemServiceImpl implements SystemService {
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MovieDao movieDao;
	
	
	
	@Override
	public void memberValid(Calendar calendar) {
		Calendar up=Calendar.getInstance();
		up.setTimeInMillis(calendar.getTimeInMillis());
		
		calendar.add(Calendar.YEAR, -1);
		Date date=new Date(calendar.getTimeInMillis());
		
		System.out.println(date.toString());
		List<Member> members=memberDao.memberToCheck(date);
		List<Member> result=new ArrayList<Member>();
		for(Member member:members){
			if(member.getState()==1){//已经激活，需要缴费
				Discount dis=member.getDisaccount();
				double price=dis.getCharge();//需要缴纳的费用
				if(member.getBalance()>=price){//缴费
					Consume consume=new Consume();
					consume.setDate(up);
					consume.setMoney(price);
					consume.setInfo("系统自动缴纳会费");
					consume.setMember(member);
					
					consume.setCredit(CreditStrategy.calCredit(price));
					member.addConsume(consume);
					member.setBalance(member.getBalance()-price);
					member.setActive(new Date(up.getTimeInMillis()));
					member.setCredit(consume.getCredit()+member.getCredit());
					
					
				}else{//暂停
					member.setResumn(new Date(up.getTimeInMillis()));
					member.setState(2);
				}
				result.add(member);
			}else if(member.getState()==2){//已经暂停的，将其停止
				member.setState(3);
				member.setActive(null);
				member.setResumn(null);
				member.setDisaccount(memberDao.getDefaultLevel());
				result.add(member);
			}
			memberDao.update(member);
			
		}
		//memberDao.merge(result);
		
	}



	@Override
	public void activityAuto(Calendar calendar) {
		List<Movie> movies=movieDao.getMoviesOffAt(calendar);
		
		for(Movie movie:movies){
			Set<Question> questions=movie.getQuestions();
			for(Question question:questions){
				
				Set<Options> options=question.getOptions();
				//选项最多的更新
				int a=0;
				Options option=null;
				for(Options op:options){
					if(op.getMembers().size()>a){
						a=op.getMembers().size();
						option=op;
					}
					
				}
				for(Member member:option.getMembers()){
					double mul=member.getDisaccount().getMuticredit();
					member.setCredit(question.getCredit()*(int)Math.floor(mul)+member.getCredit());
					memberDao.update(member);
				}
			}
		}
		
		
		
	}


}
