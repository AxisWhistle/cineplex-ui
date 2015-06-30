package edu.nju.cineplex.util;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.cineplex.service.SystemService;

public class MemberCheck {
	
	@Autowired
	SystemService systemService;
	Calendar calendar;
	
	public void check(){
		
		
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		
		//System.out.println(calendar.get(0));// new Date()为获取当前系统时间
		calendar = Calendar.getInstance();
		memberValid();
		//calendar.set(0, calendar.get(0)+1);
		System.out.println("ok");
	}
	
	public void memberValid(){
		systemService.memberValid(calendar);
		
	}

}
