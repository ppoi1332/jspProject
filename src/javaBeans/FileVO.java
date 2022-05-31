package javaBeans;

public class FileVO {

	long number;
	String title;
	String file_Name;
	String id;
	long count;
	String context;
	
	public FileVO() {}
	
	public FileVO(String title, String file_Name, String id, String context) {
		this.title = title;
		this.file_Name = file_Name;
		this.id = id;
		this.context = context;
	}
	
	public FileVO(long number, String title, String file_Name, String id, long count) {
		this.number = number;
		this.title = title;
		this.file_Name = file_Name;
		this.id = id;
		this.count = count;
	}
	
	public FileVO(long number, String title, String file_Name, String id, String context, long count) {
		this.number=number;
		this.title = title;
		this.file_Name = file_Name;
		this.id = id;
		this.context = context;
		this.count=count;
	}
	
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFile_Name() {
		return file_Name;
	}
	public void setFile_Name(String file_Name) {
		this.file_Name = file_Name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
}
