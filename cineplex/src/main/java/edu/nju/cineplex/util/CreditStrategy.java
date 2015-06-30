package edu.nju.cineplex.util;

public class CreditStrategy {
	
	public static int calCredit(double price){
		int temp=(int)Math.floor(price);
		temp=temp/10;
		return temp*10;
	}
	
	public static double calPrice(int credit){
		double temp=credit/50.0;
		
		return temp*10;
	}

	public static int calConvert(double parseDouble) {
		// TODO Auto-generated method stub
		int credit=(int) Math.floor(parseDouble*5);
		
		return credit;
	}

}
