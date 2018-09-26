package hs.bm.bean;

public class Filemanage {

	/**文件编号*/
	private String file_id;
	/**用户编号*/
	private String user_name;
	/**文件名*/
	private String file_name;
	/**文件别名*/
	private String file_nickname;
	/**文件上传时间*/
	private String file_date;
	/**文件大小*/
	private int file_size;
	/**文件类别*/
	private String file_type;
	/**文件备注*/
	private String file_note;
	/***/
	private String file_extension;

	public void setFile_id(String file_id){
		this.file_id=file_id;
	}

	public String getFile_id(){
		return file_id;
	}

	public void setUser_name(String user_name){
		this.user_name=user_name;
	}

	public String getUser_name(){
		return user_name;
	}

	public void setFile_name(String file_name){
		this.file_name=file_name;
	}

	public String getFile_name(){
		return file_name;
	}

	public void setFile_nickname(String file_nickname){
		this.file_nickname=file_nickname;
	}

	public String getFile_nickname(){
		return file_nickname;
	}

	public void setFile_date(String file_date){
		this.file_date=file_date;
	}

	public String getFile_date(){
		return file_date;
	}

	public void setFile_size(int file_size){
		this.file_size=file_size;
	}

	public int getFile_size(){
		return file_size;
	}

	public void setFile_type(String file_type){
		this.file_type=file_type;
	}

	public String getFile_type(){
		return file_type;
	}

	public void setFile_note(String file_note){
		this.file_note=file_note;
	}

	public String getFile_note(){
		return file_note;
	}

	public void setFile_extension(String file_extension){
		this.file_extension=file_extension;
	}

	public String getFile_extension(){
		return file_extension;
	}

}
