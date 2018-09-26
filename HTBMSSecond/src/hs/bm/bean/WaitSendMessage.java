package hs.bm.bean;

import java.util.Date;

public class WaitSendMessage {
	private Integer id;
	private String code;
	private String message_variable;
	private Date wait_send_time;
	private String bridge_id;
	private String if_send;
	private String phone_nums;
	public WaitSendMessage() {
		super();
	}
	public WaitSendMessage(Integer id, String code, String message_variable, Date wait_send_time, String bridge_id,
			String if_send, String phone_nums) {
		super();
		this.id = id;
		this.code = code;
		this.message_variable = message_variable;
		this.wait_send_time = wait_send_time;
		this.bridge_id = bridge_id;
		this.if_send = if_send;
		this.phone_nums = phone_nums;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage_variable() {
		return message_variable;
	}
	public void setMessage_variable(String message_variable) {
		this.message_variable = message_variable;
	}
	public Date getWait_send_time() {
		return wait_send_time;
	}
	public void setWait_send_time(Date wait_send_time) {
		this.wait_send_time = wait_send_time;
	}
	public String getBridge_id() {
		return bridge_id;
	}
	public void setBridge_id(String bridge_id) {
		this.bridge_id = bridge_id;
	}
	public String getIf_send() {
		return if_send;
	}
	public void setIf_send(String if_send) {
		this.if_send = if_send;
	}
	public String getPhone_nums() {
		return phone_nums;
	}
	public void setPhone_nums(String phone_nums) {
		this.phone_nums = phone_nums;
	}
	
}
