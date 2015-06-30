package edu.nju.cineplex.model.VO;

public class Seat {
	
	private int	 rownum;
	private int colnum;
	private boolean avail;//0可选，1不可选
	public Seat(int i, int j) {
		this.setColnum(j);
		this.setRownum(i);
		this.setAvail(true);
		
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getColnum() {
		return colnum;
	}
	public void setColnum(int colnum) {
		this.colnum = colnum;
	}
	public boolean isAvail() {
		return avail;
	}
	public void setAvail(boolean avail) {
		this.avail = avail;
	}



}
