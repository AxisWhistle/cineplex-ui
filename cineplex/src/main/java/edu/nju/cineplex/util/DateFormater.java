package edu.nju.cineplex.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateFormater {
	
	public static String minutesToDuration(int mi){
		int h=mi/60;
		mi=mi%60;
		if (h>0)
			return h+"小时"+mi+"分钟";
		else{
			return mi+"分钟";
		}
	}
	public static int  StringToMinutes(String mi){
		mi=mi.trim()+"~";
		int re=0;
		if(mi.contains("小时")){
			String[] s=mi.split("小时");
			re=re+60*Integer.parseInt(s[0]);
			mi=s[1];
		}if(mi.contains("分钟")){
			String[] s =mi.split("分钟");
			re+=Integer.parseInt(s[0]);
		}
		return re;
	}
	
	public static String CalendarToString(Calendar c){
		String s=c.get(Calendar.YEAR)+"-"+c.get(Calendar.MONTH)+"-"+c.get(Calendar.DATE);
		return s;
	}
	
	public static Calendar StringToCalendar(String s){
		Calendar c = Calendar.getInstance();
		String[] str =s.split("-");
		c.set(c.get(Calendar.YEAR), Integer.parseInt(str[0]));
		c.set(c.get(Calendar.MONTH), Integer.parseInt(str[1])-1);
		c.set(c.get(Calendar.DATE), Integer.parseInt(str[2]));
		return c;
	}

}
