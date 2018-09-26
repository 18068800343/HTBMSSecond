package hs.bm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.authz.annotation.RequiresGuest;

import hs.bm.bean.BrgCardAdminId;
import hs.bm.bean.BrgGpsStatistic;
import hs.bm.bean.BrgHealthStatistic;
import hs.bm.bean.BrgStaticStatistic;
import hs.bm.bean.BrgSystem;
import hs.bm.bean.BrgWeightStatistic;
import hs.bm.bean.BrgWindStatistic;
import hs.bm.bean.Connect;
import hs.bm.util.ToJSONStr;
import hs.bm.vo.FileTimeSize;
import hs.bm.vo.ManageSectionBridge;

public class GetFileSizeDao {
	public static boolean flag=false;
	private static GetFileSizeDao getFileSizeDao;
	public static GetFileSizeDao getInstance(){
		if(getFileSizeDao==null){
			getFileSizeDao=new GetFileSizeDao();
		}
		return getFileSizeDao;
	}
    public Map<String, List<FileTimeSize>> GetFileSize(int second){
    	Map<String, List<FileTimeSize>> map=new HashMap<String, List<FileTimeSize>>();
    	List<FileTimeSize> lf=new ArrayList<FileTimeSize>();
    	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
    	String sql="SELECT file_size,file_time from brg_weight_statistic where TO_SECONDS(NOW())-TO_SECONDS(file_time)<=?";
    	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{second});
    	FileTimeSize f1=new FileTimeSize();
    	FileTimeSize f2=new FileTimeSize();
    	long l1=0;
    	long l2=0;
    	try {
			while (rs.next()) {
				long l=rs.getLong("file_size");
				l1+=l;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	f1.setSys("w");
    	f1.setFilesize(l1);
    	f1.setSecond(second);
    	sql="SELECT file_size,file_time from brg_health_statistic where TO_SECONDS(NOW())-TO_SECONDS(file_time)<=?";
    	rs=dataOperation.executeQuery(sql,new Object[]{second});
    	try {
			while (rs.next()) {
				long l=rs.getLong("file_size");
				l2+=l;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	f2.setFilesize(l2);
    	f2.setSecond(second);
    	f2.setSys("h");
    	lf.add(f1);
    	lf.add(f2);
    	dataOperation.close();
    	map.put("data", lf);
    	return map;
    	
    }
    public List<BrgWeightStatistic> GetWeightData(String brg_id){
    	List<BrgWeightStatistic> lf=new ArrayList<BrgWeightStatistic>();
   	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	String sql="SELECT a.*,b.bridge_no from brg_weight_statistic as a,brg_card_admin_id as b where a.bridge_id=? and a.bridge_id=b.bridge_id order by start_time desc";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	try {
		while (rs.next()) {
			BrgWeightStatistic bw=new BrgWeightStatistic();
			bw.setFile_time(rs.getString("file_time").substring(0, 19));
			bw.setFile_size(rs.getInt("file_size"));
			bw.setStart_time(rs.getString("start_time"));
			bw.setEnd_time(rs.getString("end_time"));
			bw.setBridge_id(rs.getString("bridge_id"));
			bw.setBridge_no(rs.getString("bridge_no"));
			bw.setData_file(rs.getString("data_file"));
			bw.setIs_download(rs.getInt("is_download"));
			lf.add(bw);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   	dataOperation.close();
   	return lf;
    }
    public List<BrgHealthStatistic> GetHealthData(String brg_id){
    	List<BrgHealthStatistic> lf=new ArrayList<BrgHealthStatistic>();
   	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	String sql="SELECT a.*,b.bridge_no from brg_health_statistic as a,brg_card_admin_id as b where a.bridge_id=? and a.bridge_id=b.bridge_id order by start_time desc";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	try {
		while (rs.next()) {
			BrgHealthStatistic bw=new BrgHealthStatistic();
			bw.setFile_time(rs.getString("file_time").substring(0, 19));
			bw.setFile_size(rs.getInt("file_size"));
			bw.setStart_time(rs.getString("start_time"));
			bw.setEnd_time(rs.getString("end_time"));
			bw.setBridge_id(rs.getString("bridge_id"));
			bw.setBridge_no(rs.getString("bridge_no"));
			bw.setData_file(rs.getString("data_file"));
			bw.setIs_download(rs.getInt("is_download"));
			lf.add(bw);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   	dataOperation.close();
   	return lf;
    }
    
    public List<BrgGpsStatistic> GetGpsDataS(String brg_id){
    	List<BrgGpsStatistic> lf=new ArrayList<BrgGpsStatistic>();
   	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	String sql="SELECT a.*,b.bridge_no from brg_gps_statistic as a,brg_card_admin_id as b where a.bridge_id=? and a.bridge_id=b.bridge_id order by start_time desc";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	try {
		while (rs.next()) {
			BrgGpsStatistic bw=new BrgGpsStatistic();
			bw.setFile_time(rs.getString("file_time").substring(0, 19));
			bw.setFile_size(rs.getInt("file_size"));
			bw.setStart_time(rs.getString("start_time"));
			bw.setEnd_time(rs.getString("end_time"));
			bw.setBridge_id(rs.getString("bridge_id"));
			bw.setBridge_no(rs.getString("bridge_no"));
			bw.setData_file(rs.getString("data_file"));
			bw.setIs_download(rs.getInt("is_download"));
			lf.add(bw);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   	dataOperation.close();
   	return lf;
    }
    public List<BrgGpsStatistic> GetGpsData(String brg_id,String bridge_name){
    	MyDataOperation dataOperation1 = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
    	String sql1="SELECT brg_pass_no from brg_system  where id=? ";
    	String name = "";
    	ResultSet rs1=dataOperation1.executeQuery(sql1,new Object[]{bridge_name});
    	try {
    		while (rs1.next()) {
    			name = rs1.getString("brg_pass_no");
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	dataOperation1.close();
    	String gps = null;
    	
    	switch (name) {
		case "通道一":
			gps = "GPS1";
			break;
		case "通道二":
			gps = "GPS2";
			break;
		case "通道三":
			gps = "GPS3";
			break;
		case "通道四":
			gps = "GPS4";
			break;
		case "通道五":
			gps = "GPS5";
			break;
		}
    	
    	
    	List<BrgGpsStatistic> lf=new ArrayList<BrgGpsStatistic>();
    	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	String sql="SELECT a.*,b.bridge_no from brg_gps_statistic as a,brg_card_admin_id as b where a.bridge_id=? and a.bridge_id=b.bridge_id order by start_time desc";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	
   	try {
		while (rs.next()) {
			String dataFile = rs.getString("data_file");
			
			if(dataFile.startsWith(gps)) {
				BrgGpsStatistic bw=new BrgGpsStatistic();
				bw.setFile_time(rs.getString("file_time").substring(0, 19));
				bw.setFile_size(rs.getInt("file_size"));
				bw.setStart_time(rs.getString("start_time"));
				bw.setEnd_time(rs.getString("end_time"));
				bw.setBridge_id(rs.getString("bridge_id"));
				bw.setBridge_no(rs.getString("bridge_no"));
				bw.setData_file(rs.getString("data_file"));
				bw.setIs_download(rs.getInt("is_download"));
				lf.add(bw);
				
			}
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   	dataOperation.close();
   	return lf;
    }
    
    public List<BrgStaticStatistic> GetStaticData(String brg_id){
    	List<BrgStaticStatistic> lf=new ArrayList<BrgStaticStatistic>();
   	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	String sql="SELECT a.*,b.bridge_no from brg_static_statistic as a,brg_card_admin_id as b where a.bridge_id=? and a.bridge_id=b.bridge_id order by start_time desc";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	try {
		while (rs.next()) {
			BrgStaticStatistic bw=new BrgStaticStatistic();
			bw.setFile_time(rs.getString("file_time").substring(0, 19));
			bw.setFile_size(rs.getInt("file_size"));
			bw.setStart_time(rs.getString("start_time"));
			bw.setEnd_time(rs.getString("end_time"));
			bw.setBridge_id(rs.getString("bridge_id"));
			bw.setBridge_no(rs.getString("bridge_no"));
			bw.setData_file(rs.getString("data_file"));
			bw.setIs_download(rs.getInt("is_download"));
			lf.add(bw);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   	dataOperation.close();
   	return lf;
    }
    
    public List<BrgWindStatistic> GetWindData(String brg_id){
    	List<BrgWindStatistic> lf=new ArrayList<BrgWindStatistic>();
   	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	String sql="SELECT a.*,b.bridge_no from brg_wind_statistic as a,brg_card_admin_id as b where a.bridge_id=? and a.bridge_id=b.bridge_id order by start_time desc";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	try {
		while (rs.next()) {
			BrgWindStatistic bw=new BrgWindStatistic();
			bw.setFile_time(rs.getString("file_time").substring(0, 19));
			bw.setFile_size(rs.getInt("file_size"));
			bw.setStart_time(rs.getString("start_time"));
			bw.setEnd_time(rs.getString("end_time"));
			bw.setBridge_id(rs.getString("bridge_id"));
			bw.setBridge_no(rs.getString("bridge_no"));
			bw.setData_file(rs.getString("data_file"));
			bw.setIs_download(rs.getInt("is_download"));
			lf.add(bw);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   	dataOperation.close();
   	return lf;
    }
    
    public List<BrgSystem> getBrgSystemsById(String brg_id,String bgco){
     List<BrgSystem> lf=new ArrayList<BrgSystem>();
	 long time=new Date().getTime();
	 time=time-3600000;
	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	 String sql="SELECT	brg_system.id,brg_system.`mode`,brg_system.bridge_id,brg_system.out_time,"
   			+ " brg_system.brg_pass_no,brg_system.monitor_starttime,brg_card_admin_id.bridge_name "
   			+ " FROM	brg_system LEFT JOIN brg_card_admin_id "
   			+ " ON brg_system.bridge_id = brg_card_admin_id.bridge_id where brg_system.bridge_id like ? and brg_system.brg_pass_no is not null and brg_system.brg_pass_no != '' order by brg_system.sort  ";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	try {
		while (rs.next()) {
			BrgSystem bw=new BrgSystem();
			bw.setBrg_pass_no(rs.getString("brg_pass_no"));
			bw.setId(rs.getString("id"));
			bw.setBridge_id(rs.getString("bridge_id"));
			bw.setBrg_name(rs.getString("bridge_name"));
			bw.setOut_time(bgco);
			lf.add(bw);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   	dataOperation.close();
   	return lf;
    }
    
    public ArrayList<BrgSystem> getAllSystemBtOneBridge(String brg_id) {
    	ArrayList<BrgSystem> list = new ArrayList<BrgSystem>();
   	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
   	 String sql = " SELECT DISTINCT mode FROM  brg_system WHERE bridge_id=? ";
   	ResultSet rs=dataOperation.executeQuery(sql,new Object[]{brg_id});
   	try {
		while (rs.next()) {
			BrgSystem entity = new BrgSystem();
			entity.setMode(rs.getString("mode"));
			list.add(entity);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
   		dataOperation.close();
		return list;
    }
    
    public int GetFileInTime(int s,String type){
    	if(!flag){
    		return 1;
    	}
    	String sql="select count(*) from brg_weight_statistic where file_time >? and file_time <= ?";
    	if(type.toLowerCase().contains("weight")){
    		sql="select count(*) from brg_weight_statistic where file_time >? and file_time <= ?";
    	}else{
    		sql="select count(*) from brg_health_statistic where file_time >? and file_time <= ?";
    	}
    	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
    	 Date d1=new Date();
    	 Date d2=new Date();
    	 d2.setTime(d1.getTime() - s * 1000);
    	 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	 ResultSet rs=dataOperation.executeQuery(sql,new Object[]{format.format(d2),format.format(d1)});
    	 //System.out.println(format.format(d2)+"-----"+format.format(d1));
    	 int i=0;
    	   	try {
    			while (rs.next()) {
    				i=rs.getInt(1);
    			}
    		} catch (SQLException e) {
    			e.printStackTrace();
    		}
    	   	dataOperation.close();
    	   	return i;
    }
    
    public String getMonitor_startTime(String brg_id,String mode){
    	String str = "";
    	if ("weight".equals(mode)) {
			mode = "w";
		}else if("health".equals(mode)) {
			mode = "s";
		}else if("gps".equals(mode)) {
			mode = "g";
		}else if("gpss".equals(mode)) {
			mode = "g";
		}
    	String sql = " SELECT monitor_starttime FROM brg_system WHERE bridge_id=? AND mode =? ";
    	 MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
    	ResultSet rs=dataOperation.executeQuery(sql, new String[]{brg_id,mode});
    	try {
			while (rs.next()) {
				str = rs.getString("monitor_starttime");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	dataOperation.close();
		return str;
    	
    }
    public List<BrgSystem> getBrgSystems(String mode){
    	List<BrgSystem> list = new ArrayList<>();
    	String sql = " select DISTINCT * from brg_system where mode=?";
    	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
    	ResultSet rs=dataOperation.executeQuery(sql, new String[]{mode});
    	try {
			while (rs.next()) {
				BrgSystem brgSystem  = new BrgSystem();
				brgSystem.setBridge_id(rs.getString("bridge_id"));
				brgSystem.setDir_name(rs.getString("dir_name"));
				brgSystem.setId(rs.getString("id"));
				brgSystem.setMode(rs.getString("mode"));
				brgSystem.setMonitor_starttime(rs.getString("monitor_starttime"));
				brgSystem.setOut_time(rs.getString("out_time"));
				list.add(brgSystem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	dataOperation.close();
		return list;
    }
    public int updateBrgSystemOutTime(String bridge_id,String out_time,String mode){
    	List<BrgSystem> list = new ArrayList<>();
    	String sql = " update brg_system set out_time=? where bridge_id=? and mode=? ";
    	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
    	int i=dataOperation.executeUpdate(sql, new String[]{out_time,bridge_id,mode});
    	dataOperation.close();
		return i;
    }
    public BrgSystem getBrgSystemByBrgId(String bridge_id){
    	List<BrgSystem> list = new ArrayList<>();
    	String sql = " select * from brg_system where bridge_id=?";
    	MyDataOperation dataOperation = new MyDataOperation(MyDataSource.getInstance().getConnection(),false);
    	ResultSet rs=dataOperation.executeQuery(sql, new String[]{bridge_id});
    	try {
			while (rs.next()) {
				BrgSystem brgSystem  = new BrgSystem();
				brgSystem.setBridge_id(rs.getString("monitor_starttime"));
				brgSystem.setDir_name(rs.getString("dir_name"));
				brgSystem.setId(rs.getString("id"));
				brgSystem.setMode(rs.getString("mode"));
				brgSystem.setMonitor_starttime(rs.getString("monitor_starttime"));
				brgSystem.setOut_time(rs.getString("out_time"));		
				list.add(brgSystem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	dataOperation.close();
		return list.size()==0 ? null : list.get(0) ;
    }
    public int addBrgSystem(String bridge_id,String mode){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="insert into brg_system(id,bridge_id,dir_name,mode) values(?,?,?,?);";
    	if(mode.toLowerCase().equals("s")){
    		sql="insert into brg_system(id,bridge_id,dir_name,mode) values(?,?,"
    				+ "(select CONCAT(bridge_no,'S') FROM brg_card_admin_id where bridge_id=?),?);";
    	}else{
    		sql="insert into brg_system(id,bridge_id,dir_name,mode) values(?,?,"
    				+ "(select CONCAT(bridge_no,'W') FROM brg_card_admin_id where bridge_id=?),?);";
    	}
    	
    	String id=UUID.randomUUID().toString();
		int i=mdo.executeUpdate(sql, new String[]{id,bridge_id,bridge_id,mode});
		mdo.close();
		return i;
    }
    
    public int addBrgSystemWind(String bridge_id,String mode){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="insert into brg_system(id,bridge_id,dir_name,mode,monitor_starttime) values(?,?,(select CONCAT(bridge_no,'F') FROM brg_card_admin_id where bridge_id=?),?,?)";
    	String id=UUID.randomUUID().toString();
		int i=mdo.executeUpdate(sql, new String[]{id,bridge_id,bridge_id,mode,sdf.format(new Date())});
		mdo.close();
		return i;
    }
    
    
    public int addBrgSystemGPS(String bridge_id,String mode){
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="insert into brg_system(id,bridge_id,dir_name,mode,monitor_starttime) values(?,?,(select CONCAT(bridge_no,'G') FROM brg_card_admin_id where bridge_id=?),?,?)";
    	int i=0;
		i=mdo.executeUpdate(sql, new String[]{UUID.randomUUID().toString(),bridge_id,bridge_id,mode,sdf.format(new Date())});
		if(i>0){
			for(int j=0;j<4;j++){
				String sql1="insert into brg_system(id,bridge_id,dir_name,mode,monitor_starttime,brg_pass_no) values(?,?,(select CONCAT(bridge_no,'_0"+(j+1)+"G') FROM brg_card_admin_id where bridge_id=?),?,?,?)";
				System.out.println(sql1);
				i=mdo.executeUpdate(sql1, new String[]{UUID.randomUUID().toString(),bridge_id,bridge_id,mode,sdf.format(new Date()),"通道"+(j+1)});
			}
		}
		mdo.close();
		return i;
    }
    
    public List<Connect> initWeightTree(){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("动态称重");
    	con.setType("weight");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT bs.*,bh.bridge_id as bgid,bh.end_time from "
    			+ "(select a.bridge_id,a.dir_name,b.bridge_name from "
    			+ "brg_system as a,brg_card_admin_id as b where a.bridge_id=b.bridge_id and mode='w') "
    			+ "as bs LEFT JOIN (SELECT a.bridge_id,a.end_time from "
    			+ "(SELECT * from brg_weight_statistic ORDER BY end_time DESC) "
    			+ "as a GROUP BY a.bridge_id) as bh ON bs.bridge_id=bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				co.setType("bridge");
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initWeightTree2(String orgid){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("动态称重");
    	con.setType("weight");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND b.zone_id LIKE ?\n" +
    			"		AND MODE = 'w'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_weight_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,new String[] {orgid});
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				co.setType("bridge");
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    public List<Connect> initHealthTree(){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("健康监测");
    	con.setType("health");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND MODE = 's'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_health_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initHealthTree2(String orgid){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("健康监测");
    	con.setType("health");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND b.zone_id LIKE ?\n" +
    			"		AND MODE = 's'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_health_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,new String[] {orgid});
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initWindTree(){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("风速风向");
    	con.setType("wind");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND MODE = 'f'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_wind_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initWindTree2(String orgid){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("风速风向");
    	con.setType("wind");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND b.zone_id LIKE ?\n" +
    			"		AND MODE = 'f'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_wind_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,new String[] {orgid});
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initGPSTree(){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("GPS");
    	con.setType("gps");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			" 			a.brg_pass_no,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND MODE = 'g'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_gps_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				co.setName_no(rs.getString("brg_pass_no"));
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initGPSTreeOne(){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("GPS");
    	con.setType("gps");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			" 	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			" 			a.brg_pass_no,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n " +
    			"		AND MODE = 'g'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_gps_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id ";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				if(rs.getString("brg_pass_no")==null||"".equals(rs.getString("brg_pass_no"))){
					Connect co=new Connect();
					co.setId(rs.getString("bridge_id"));
					co.setName(rs.getString("bridge_name"));
					co.setType("bridge");
					co.setName_no(rs.getString("brg_pass_no"));
					String end_time=rs.getString("end_time");
					if(rs.getString("bgid")==null||end_time==null){
						co.setBgco("0");
					}else{
						long et=sdf.parse(end_time).getTime();
						if(et<time){
							co.setBgco(end_time);
						}else{
							co.setBgco("1");
						}
					}
					lc.add(co);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initGPSTree2(String orgid){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("GPS");
    	con.setType("gps");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			" 			a.brg_pass_no,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND b.zone_id LIKE ?\n" +
    			"		AND MODE = 'g'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_gps_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,new String[] {orgid});
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				String end_time=rs.getString("end_time");
				co.setName_no(rs.getString("brg_pass_no"));
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initStaticTree(){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("静态监测");
    	con.setType("static");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND MODE = 'j'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_static_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<Connect> initStaticTree2(String orgid){
    	List<Connect> lc1=new ArrayList<Connect>();
    	Connect con=new Connect();
    	con.setName("静态监测");
    	con.setType("static");
    	List<Connect> lc=new ArrayList<Connect>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT\n" +
    			"	bs.*, bh.bridge_id AS bgid,\n" +
    			"	bh.end_time\n" +
    			"FROM\n" +
    			"	(\n" +
    			"		SELECT\n" +
    			"			a.bridge_id,\n" +
    			"			a.dir_name,\n" +
    			"			b.bridge_name\n" +
    			"		FROM\n" +
    			"			brg_system AS a,\n" +
    			"			brg_card_admin_id AS b\n" +
    			"		WHERE\n" +
    			"			a.bridge_id = b.bridge_id\n" +
    			"		AND b.zone_id LIKE ?\n" +
    			"		AND MODE = 'j'\n" +
    			"	) AS bs\n" +
    			"LEFT JOIN (\n" +
    			"	SELECT\n" +
    			"		a.bridge_id,\n" +
    			"		a.end_time\n" +
    			"	FROM\n" +
    			"		(\n" +
    			"			SELECT\n" +
    			"				*\n" +
    			"			FROM\n" +
    			"				brg_static_statistic\n" +
    			"			ORDER BY\n" +
    			"				end_time DESC\n" +
    			"		) AS a\n" +
    			"	GROUP BY\n" +
    			"		a.bridge_id\n" +
    			") AS bh ON bs.bridge_id = bh.bridge_id";
    	long time=new Date().getTime();
    	time=time-3600000;
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	ResultSet rs=mdo.executeQuery(sql,new String[] {orgid});
    	try {
			while (rs.next()) {
				Connect co=new Connect();
				co.setId(rs.getString("bridge_id"));
				co.setName(rs.getString("bridge_name"));
				co.setType("bridge");
				String end_time=rs.getString("end_time");
				if(rs.getString("bgid")==null||end_time==null){
					co.setBgco("0");
				}else{
					long et=sdf.parse(end_time).getTime();
					if(et<time){
						co.setBgco(end_time);
					}else{
						co.setBgco("1");
					}
				}
				lc.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	con.setChildren(lc);
    	lc1.add(con);
    	return lc1;
    	
    }
    
    public List<BrgWeightStatistic> getWeightList(String bridge_id){
    	List<BrgWeightStatistic> lb=new ArrayList<BrgWeightStatistic>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="select * from brg_weight_statistic where brg_id=?";
    	ResultSet rs=mdo.executeQuery(sql,new String[]{bridge_id});
    	try {
			while (rs.next()) {
				BrgWeightStatistic bs=new BrgWeightStatistic();
				bs.setBridge_id(rs.getString("bridge_id"));
				bs.setData_file(rs.getString("data_file"));
				bs.setEnd_time(rs.getString("end_time"));
				bs.setFile_size(rs.getInt("file_size"));
				bs.setFile_time(rs.getString("file_time"));
				bs.setMemo(rs.getString("memo"));
				bs.setR_id(rs.getString("r_id"));
				bs.setStart_time(rs.getString("start_time"));
				lb.add(bs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return lb;
    }
    public boolean checkDir(String bridge_id,String mode){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="select * from brg_system where dir_name=(select CONCAT(bridge_no,'W') FROM brg_card_admin_id where bridge_id=?)";
    	if(mode.toLowerCase().equals("s")){
    		sql="select * from brg_system where dir_name=(select CONCAT(bridge_no,'S') FROM brg_card_admin_id where bridge_id=?)";
    	}
    	ResultSet rs=mdo.executeQuery(sql,new String[]{bridge_id});
    	try {
			if (rs.next()) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return true;
    }
    
    public boolean checkDirWind(String bridge_id,String mode){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="select * from brg_system where dir_name=(select CONCAT(bridge_no,'F') FROM brg_card_admin_id where bridge_id=?)";
    	ResultSet rs=mdo.executeQuery(sql,new String[]{bridge_id});
    	try {
			if (rs.next()) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return true;
    }
    
    public boolean checkDirGPS(String bridge_id,String mode){
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="select * from brg_system where dir_name=(select CONCAT(bridge_no,'G') FROM brg_card_admin_id where bridge_id=?)";
    	ResultSet rs=mdo.executeQuery(sql,new String[]{bridge_id});
    	try {
			if (rs.next()) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return true;
    }
    
    public List<ManageSectionBridge> initManageSection(){
    	List<ManageSectionBridge> lc=new ArrayList<>();
    	Connection conn=MyDataSource.getInstance().getConnection();
    	MyDataOperation mdo=new MyDataOperation(conn,false);
    	String sql="SELECT b.org_id,b.org_name,c.section_id,"
    			+ "c.section_name,a.bridge_id,a.bridge_name from "
    			+ "brg_card_admin_id as a,sys_org_info as b,"
    			+ "sys_section_info as c where a.manage_id=b.org_id "
    			+ "and a.section_id=c.section_id ORDER BY org_name,section_name,bridge_name";
    	ResultSet rs=mdo.executeQuery(sql,null);
    	try {
			while (rs.next()) {
				String manage_id=rs.getString("org_id");
				String manage_name=rs.getString("org_name");
				String section_id=rs.getString("section_id");
				String section_name=rs.getString("section_name");
				String bridge_id=rs.getString("bridge_id");
				String bridge_name=rs.getString("bridge_name");
				ManageSectionBridge msb=new ManageSectionBridge();
				msb.setStruct_name(bridge_name);
				msb.setStruct_id(bridge_id);
				msb.setManage_id(manage_id);
				msb.setManage_name(manage_name);
				msb.setSection_id(section_id);
				msb.setSection_name(section_name);
				lc.add(msb);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			mdo.close();
		}
    	return lc;
    }
	public static void main(String[] args) {
		System.out.println(ToJSONStr.getJSON(GetFileSizeDao.getInstance().GetWeightData("G15320981K0030"), null));
	}

}
