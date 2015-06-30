package edu.nju.cineplex.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.model.Hall;
import edu.nju.cineplex.service.HallService;

@Repository
public class HallAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Autowired 
	HallService hallService;
	

	private String msg;
	private String hallName;
	private int seatRow;
	private int seatColumn;
	
	private Hall hall;
	
	public String addHall(){
		msg="0";
		if(isManager()){
		
			hall = new Hall();
			hall.setName(hallName);
			hall.setSeatcolumn(seatColumn);
			hall.setSeatrow(seatRow);
		
			if(hallService.addHall(hall))
	
				this.msg="1";
			else
				this.msg="有重复名字";
		//System.out.println("0");
		}
		
		
		return SUCCESS;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public int getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}

	public int getSeatColumn() {
		return seatColumn;
	}

	public void setSeatColumn(int seatColumn) {
		this.seatColumn = seatColumn;
	}

	public Hall getHall() {
		return hall;
	}

	public void setHall(Hall hall) {
		this.hall = hall;
	}

	

	

}
