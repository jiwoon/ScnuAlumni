package com.newttl.scnualumni.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.newttl.scnualumni.bean.database.Knowledge;
import com.newttl.scnualumni.bean.database.SignedUser;
import com.newttl.scnualumni.bean.database.UserLocation;


/**
 * 数据库操作类
 * 
 * @author lgc
 *
 * @date 2017年7月3日 下午4:25:16
 */
public class DataBaseUtil {

	private static Connection conn;
//	private static Statement sql;
	
	/**
	 * 链接数据库
	 */
	public DataBaseUtil(){
		//驱动
		String driver="com.mysql.jdbc.Driver";
		// URL指向要访问的数据库名wechat_data
        String url = "jdbc:mysql://127.0.0.1:3306/wechat_data";
        //用户名
        String userName="root";
        //密码
        String password="guochang";
		//加载驱动
        try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.print("DataBaseUtil-ClassNotFoundException::"+"\n"+e.getLocalizedMessage());
			e.printStackTrace();
		}
        //链接数据库
        try {
			conn=DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("DataBaseUtil-SQLException::"+"\n"+e.getLocalizedMessage());
		}
		
        
        /*连接SQL server
	    try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		} catch (ClassNotFoundException e) {
			System.out.print("DataBaseUtil-ClassNotFoundException::"+"\n"+e.getLocalizedMessage());
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection("jdbc:odbc:Sqllgc","sa","sa123abc");
			sql=conn.createStatement();
		} catch (SQLException e) {
			System.out.print("DataBaseUtil-SQLException::"+"\n"+e.getLocalizedMessage());
			e.printStackTrace();
		}
		*/
		
		
	}
	
	/**
	 * 释放 jdbc 资源
	 * 
	 * @param con 数据库链接
	 * @param ps
	 * @param rs 数据库结果集
	 */
	private static void releaseResources(Connection con,PreparedStatement ps,ResultSet rs){
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("releaseResources::\n"+e.toString());
		}
	}
	
	/**
	 * 获取知识问答表中的所有记录
	 * 
	 * @return List<Knowledge>
	 */
	public List<Knowledge> findAllKnowledge(){
		List<Knowledge> knowledges=new ArrayList<Knowledge>();
		String sqlStr = "select * from knowledge";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			rs=ps.executeQuery();
			while (rs.next()) {
				Knowledge knowledge=new Knowledge();
				knowledge.setId(rs.getInt("id"));
				knowledge.setQuestion(rs.getString("question"));
				knowledge.setAnswer(rs.getString("answer"));
				knowledge.setCategory(rs.getInt("category"));
				knowledges.add(knowledge);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("findAllKnowledge::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return knowledges;
	}
	
	/**
	 * 获取上一次聊天记录的类型
	 * @param openId 用户id
	 * @return int 返回类型 1-普通聊天，2-笑话，3-上下文
	 */
	public int getLastCategory(String openId){
		int category=-1;
		String sqlStr="select top 1 chat_category from chat_log where open_id=? order by id desc";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, openId);
			rs=ps.executeQuery();
			if (rs.next()) {
				category=rs.getInt("chat_category");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getLastCategory::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return category;
	}
	
	/**
	 * 根据问答知识id，随机获取一条答案回复用户
	 * @param pid 问答知识id
	 * @return String 返回回答内容
	 */
	public String getOneKnowledgeSub(int pid){
		String knowledgeAnswer="";
		String sqlStr="select top 1 answer from knowledge_sub where pid=? order by rand()";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setInt(1, pid);
			rs=ps.executeQuery();
			if (rs.next()) {
				knowledgeAnswer=rs.getString("answer");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getOneKnowledgeSub::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return knowledgeAnswer;
	}
	
	/**
	 * 随机获取一条笑话
	 * @return
	 */
	public String getJoke(){
		String jokeContent="";
		String sqlStr="SELECT TOP 1 joke_content FROM joke ORDER BY NEWID()";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			rs=ps.executeQuery();
			if (rs.next()) {
				jokeContent=rs.getString("joke_content");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getJoke::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return jokeContent;
	}
	
	/**
	 * 保存聊天记录
	 * @param open_id 用户id
	 * @param create_time 创建时间
	 * @param req_msg 用户发送的消息
	 * @param resp_msg 公众号回复的消息
	 * @param chat_category 聊天消息类型，1-普通聊天，2-笑话，3-上下文
	 * @return
	 */
	public int saveChatLog(String open_id,String create_time,String req_msg,String resp_msg,int chat_category){
		String sqlStr="insert into chat_log(open_id, create_time, req_msg, resp_msg, chat_category) values(?, ?, ?, ?, ?)";
		int insert = -1;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, open_id);
			ps.setString(2, create_time);
			ps.setString(3, req_msg);
			ps.setString(4, resp_msg);
			ps.setInt(5, chat_category);
			insert=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("saveChatLog::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return insert;
	}
	
	/**
	 * 向数据库插入用户发送过来的位置信息
	 * @param openID 用户标识
	 * @param lng 用户的经度
	 * @param lat 用户的维度
	 * @param bd09Lng 转换后的百度坐标系经度
	 * @param bd09Lat 转换后的百度坐标系维度
	 * @return int 插入的位置
	 */
	public int saveUserLocation(String openID,String lng,String lat,String bd09Lng,String bd09Lat){
		String sqlStr = "insert into user_location(open_id, lng, lat, bd09_lng, bd09_lat) values (?, ?, ?, ?, ?)";
		int insertIndex=-1;
		PreparedStatement ps=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, openID);
			ps.setString(2, lng);
			ps.setString(3, lat);
			ps.setString(4, bd09Lng);
			ps.setString(5, bd09Lat);
			insertIndex=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("saveUserLocation::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, null);
		}
		return insertIndex;
	}
	
	/**
	 * 获取用户最后一次发送的地理位置，用于poi用户周边
	 * @param openId 用户唯一标识
	 * @return UserLocation 返回用户位置信息对象
	 */
	public UserLocation getLastLoaction(String openId){
		UserLocation userLocation=null;
		String sqlStr = "select top 1 * from user_location where open_id=? order by id desc";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, openId);
			rs=ps.executeQuery();
			if (rs.next()) {
				userLocation=new UserLocation();
				userLocation.setOpenId(rs.getString("open_id"));
				userLocation.setLng(rs.getString("lng"));
				userLocation.setLat(rs.getString("lat"));
				userLocation.setBd09Lng(rs.getString("bd09_lng"));
				userLocation.setBd09Lat(rs.getString("bd09_lat"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getLastLoaction::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return userLocation;
	}
	
	/**
	 * 查询指定openId的用户是否注册了
	 * @param openId 用户标识
	 * @return false 未注册 | true 已注册
	 */
	public boolean isSigned(String openId){
		boolean signed=false;
		String sqlStr="select * from signed_users where openId=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, openId);
			rs=ps.executeQuery();
			if (rs.next()) {
				signed=true;
			}else {
				signed=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("isSigned::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		
		return signed;
	}
	
	/**
	 * 判断指定openId的用户是否注册
	 * @param openId 用户标识
	 * @return 已注册,则返回用户信息实例SignedUser;未注册,则返回null
	 */
	public SignedUser getSigned(String openId){
		SignedUser signedUser=null;
		String sqlStr="select * from signed_users where openId=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, openId);
			rs=ps.executeQuery();
			if (rs.next()) {
//openId headImgUrl userName college userClass phone QQ eMail city industry hobby profession sex
				signedUser=new SignedUser();
				signedUser.setOpenId(rs.getString("openId"));
				signedUser.setHeadImgUrl(rs.getString("headImgUrl"));
				signedUser.setUserName(rs.getString("userName"));
				signedUser.setCollege(rs.getString("college"));
				signedUser.setUserClass(rs.getString("userClass"));
				signedUser.setPhone(rs.getString("phone"));
				signedUser.setQQ(rs.getString("QQ"));
				signedUser.seteMail(rs.getString("eMail"));
				signedUser.setCity(rs.getString("city"));
				signedUser.setIndustry(rs.getString("industry"));
				signedUser.setHobby(rs.getString("hobby"));
				signedUser.setProfession(rs.getString("profession"));
				signedUser.setSex(rs.getString("sex"));
			}else {
				signedUser=null;
			}
		} catch (SQLException e) {
			signedUser=null;
			e.printStackTrace();
			System.out.println("isSigned::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return signedUser;
	}
	
	/**
	 * 保存用户注册的信息
	 * @param signedUser
	 * @return  int
	 */
	public int saveSignedUser(SignedUser signedUser){
//		openId headImgUrl userName phone QQ eMail city industry hobby profession sex
		String sqlStr = "insert into signed_users(openId, headImgUrl, userName, college, userClass, phone, QQ, eMail, city, industry, hobby, profession, sex) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int insert=-1;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, signedUser.getOpenId());
			ps.setString(2, signedUser.getHeadImgUrl());
			ps.setString(3, signedUser.getUserName());
			ps.setString(4, signedUser.getCollege());
			ps.setString(5, signedUser.getUserClass());
			ps.setString(6, signedUser.getPhone());
			ps.setString(7, signedUser.getQQ());
			ps.setString(8, signedUser.geteMail());
			ps.setString(9, signedUser.getCity());
			ps.setString(10, signedUser.getIndustry());
			ps.setString(11, signedUser.getHobby());
			ps.setString(12, signedUser.getProfession());
			ps.setString(13, signedUser.getSex());
			insert=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("saveUserLocation::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return insert;
	}
	
	/**
	 * 更新用户修改的个人信息
	 * @param signedUser
	 * @return int
	 */
	public int updateSignedUser(SignedUser signedUser){
//		update signed_users set headImgUrl=?, userName=?, phone=?, QQ=?, eMail=?, city=?, industry=?, hobby=?, profession=?, sex=? where openId=?
		String sqlStr="update signed_users set headImgUrl=?, userName=?, college=?, userClass=?, phone=?, QQ=?, eMail=?, city=?, industry=?, hobby=?, profession=?, sex=? where openId=?";
		int update=-1;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, signedUser.getHeadImgUrl());
			ps.setString(2, signedUser.getUserName());
			ps.setString(3, signedUser.getCollege());
			ps.setString(4, signedUser.getUserClass());
			ps.setString(5, signedUser.getPhone());
			ps.setString(6, signedUser.getQQ());
			ps.setString(7, signedUser.geteMail());
			ps.setString(8, signedUser.getCity());
			ps.setString(9, signedUser.getIndustry());
			ps.setString(10, signedUser.getHobby());
			ps.setString(11, signedUser.getProfession());
			ps.setString(12, signedUser.getSex());
			ps.setString(13, signedUser.getOpenId());
			update=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("saveUserLocation::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return update;
	}
	
	/**
	 * 根据姓名查找校友
	 * @param name 校友姓名
	 * @return List<SignedUser> 所有对应名字的校友集合
	 */
	public List<SignedUser> searchSchoolMate(String name){
		String sqlStr="select * from signed_users where userName=?";
		List<SignedUser> signedUsers=new ArrayList<SignedUser>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sqlStr);
			ps.setString(1, name);
			rs=ps.executeQuery();
			while (rs.next()) {
				SignedUser signedUser=new SignedUser();
				signedUser.setOpenId(rs.getString("openId"));
				signedUser.setHeadImgUrl(rs.getString("headImgUrl"));
				signedUser.setUserName(rs.getString("userName"));
				signedUser.setCollege(rs.getString("college"));
				signedUser.setUserClass(rs.getString("userClass"));
				signedUser.setPhone(rs.getString("phone"));
				signedUser.setQQ(rs.getString("QQ"));
				signedUser.seteMail(rs.getString("eMail"));
				signedUser.setCity(rs.getString("city"));
				signedUser.setIndustry(rs.getString("industry"));
				signedUser.setHobby(rs.getString("hobby"));
				signedUser.setProfession(rs.getString("profession"));
				signedUser.setSex(rs.getString("sex"));
				signedUsers.add(signedUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("searchSchoolMate::\n"+e.toString());
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return signedUsers;
	}
	
	/**
	 * 向远程数据库新建数据表
	 * 
	 * @param createSqlStr 创建数据表Sql语句
	 * 
	 *@说明 如: String sql = "CREATE TABLE REGISTRATION " +
     *               "(id INTEGER not NULL, " +
     *               " first VARCHAR(255), " + 
     *               " last VARCHAR(255), " + 
     *               " age INTEGER, " + 
     *               " PRIMARY KEY ( id ))"; 
     *               
     *@return createIndex
	 */
	public static int createTable2RemoteDatabase(String createSqlStr){
		int createIndex=-1;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(createSqlStr);
			createIndex=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("DataBaseUtil-createTable2RemoteDatabase::"+e.toString());
			e.printStackTrace();
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return createIndex;
	}
	
	/**
	 * 增删改数据表
	 * @param strSql SQL语句   
	 * 
	 * @插入语句 "insert into user_location values"+"("+"'"+open_id+"','"+lng+"','"+lat+"','"+bd09_lng+"','"+bd09_lat+"'"+")"
	 * @删除语句 "delete from user_location where open_id"+"="+"'"+number+"'"
	 * @更新语句 "update user_location set bd09_lng = "+newbd09_lng+"where open_id="+"'"+user_open_id+"'"
	 * 
	 * @return insertIndex 操作的位置
	 */
	public  int cruNewData(String strSql){
		int index=0;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(strSql);
			index=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.print("DataBaseUtil-cruNewData-SQLException::"+"\n"+e.getLocalizedMessage());
			e.printStackTrace();
		}finally {
			//释放资源
			releaseResources(conn, ps, rs);
		}
		return index;
	}
	
	
	/**
	 * 顺序查询数据表
	 * 
	 * @param strSql 查询语句
	 * @查询语句 "select * from user_location"
	 * 
	 * @return ResultSet 返回结果集对象实例
	 */
	public static ResultSet queryData(String strSql){
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(strSql);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			System.out.print("DataBaseUtil-queryData-SQLException::"+"\n"+e.getLocalizedMessage());
			e.printStackTrace();
		}
		return rs;
	}
}
