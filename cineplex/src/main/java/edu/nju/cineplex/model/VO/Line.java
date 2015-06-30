package edu.nju.cineplex.model.VO;

import java.util.ArrayList;
import java.util.List;

public class Line {
	
	private int row;
	private List<Seat> seats;
	
	public Line(int row){
		this.row=row;
		seats=new ArrayList<Seat>();
	}
	
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public List<Seat> getSeats() {
		return seats;
	}
	public void setSeat(List<Seat> seat) {
		this.seats = seat;
	}
	public void addSeat(Seat seat){
		this.seats.add(seat);
	}

}
