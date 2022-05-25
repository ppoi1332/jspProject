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
	String division;
	String position;
	String year;
	
	public SoldierVO(String id, long division_code, long position_code, String in_day, String out_day, long year_code) {
		this.id = id;
		this.division_code = division_code;
		this.position_code = position_code;
		this.in_day = in_day;
		this.out_day = out_day;
		this.year_code = year_code;	
	}
	
	public SoldierVO(String id, String division, String position, String in_day, String out_day, String year) {
		this.id = id;
		this.division = division;
		this.position = position;
		this.in_day = in_day;
		this.out_day = out_day;
		this.year = year;	
	}
	
	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
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
	
	@Override
	public String toString() {
		return  id + in_day + out_day + division + position + year ;
	}
}
