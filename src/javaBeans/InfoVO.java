package javaBeans;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class InfoVO {

	String id;
	String passwd;
	String name;
	Date birth;
	String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
		try {
			this.birth = (Date) fm.parse(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
