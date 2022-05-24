package javaBeans;

import java.sql.Date;

public class SoldierVO {
	
	long number;
	String id;
	long division_code;
	long position_code;
	String in_day;
	String out_day;
	long year_code;
	
	public SoldierVO(String id, long division_code, long position_code, String in_day, String out_day, long year_code) {
		this.id = id;
		this.division_code = division_code;
		this.position_code = position_code;
		this.in_day = in_day;
		this.out_day = out_day;
		this.year_code = year_code;	
	}
	
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getDivision_code() {
		return division_code;
	}
	public void setDivision_code(long division_code) {
		this.division_code = division_code;
	}
	public long getPosition_code() {
		return position_code;
	}
	public void setPosition_code(long position_code) {
		this.position_code = position_code;
	}
	public String getIn_day() {
		return in_day;
	}
	public void setIn_day(String in_day) {
		this.in_day = in_day;
	}
	public String getOut_day() {
		return out_day;
	}
	public void setOut_day(String out_day) {
		this.out_day = out_day;
	}
	public long getYear_code() {
		return year_code;
	}
	public void setYear_code(long year_code) {
		this.year_code = year_code;
	}	
}
