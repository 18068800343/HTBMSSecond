package hs.bm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hs.bm.bean.BackUpDataBase;
import hs.bm.bean.SysOrgInfo;
import hs.bm.bean.WaitSendMessage;

public class SendMessageDao {
	
	private static SendMessageDao sendMessageDao;
	
	public static SendMessageDao getInstance(){
		if(sendMessageDao==null){
			sendMessageDao=new SendMessageDao();
		}
		return sendMessageDao;
	}
	
	public List<WaitSendMessage> getWaitSendMessage(Date date){
		Format f = new SimpleDateFormat("yyyy-MM-dd");  
		String dateFmt =  f.format(date);
		List<WaitSendMessage> list = new ArrayList<>();
		String sql = " select * from wait_send_message where if_send = '0' and wait_send_time=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		ResultSet rs = dataOperation.executeQuery(sql, new Object[]{dateFmt});
		try {
			while(rs.next()){
				WaitSendMessage waitSendMessage = new WaitSendMessage();
				waitSendMessage.setBridge_id(rs.getString("bridge_id"));
				waitSendMessage.setCode(rs.getString("code"));
				waitSendMessage.setId(rs.getInt("id"));
				waitSendMessage.setIf_send(rs.getString("if_send"));
				waitSendMessage.setMessage_variable(rs.getString("message_variable"));
				waitSendMessage.setPhone_nums(rs.getString("phone_nums"));
				waitSendMessage.setWait_send_time(rs.getDate("wait_send_time"));
				list.add(waitSendMessage);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dataOperation.close();
		return list;
	}
	public int insertWaitSendMessage(WaitSendMessage waitSendMessage){
		Format f = new SimpleDateFormat("yyyy-MM-dd");  
		String time =  f.format(waitSendMessage.getWait_send_time());
		String sql = " insert into wait_send_message(code,message_variable,wait_send_time,if_send,phone_nums) values(?,?,?,?,?)";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,new Object[]{waitSendMessage.getCode(),
						                                     waitSendMessage.getMessage_variable(),
						                                     time,
						                                     waitSendMessage.getIf_send(),
						                                     waitSendMessage.getPhone_nums()});
		dataOperation.close();
		return i;
	}
	public int updateIfSendState(Integer id,String state){
		String sql = " update wait_send_message set if_send = ? where id=?";
		MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection());
		int i = dataOperation.executeUpdate(sql,new Object[]{state,id});
		dataOperation.close();
		return i;
	}
	
	public static void main(String[] args) {
		SendMessageDao.getInstance().updateIfSendState(1,"1");
	}
}
