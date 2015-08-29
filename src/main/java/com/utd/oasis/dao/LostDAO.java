package com.utd.oasis.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;
import javax.xml.ws.BindingType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
 






import com.utd.oasis.dao.DbConnection;
import com.utd.oasis.data.LostItem;
import com.utd.oasis.data.User;

public class LostDAO {
	private DbConnection db;
	private Connection con;

	private String query;
	private PreparedStatement statement;
	private ResultSet rs;
	
	private DataSource dataSource;
	 
	public LostDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public User userLogin(User user){
		 
		String sql = "SELECT * FROM user_login WHERE user_id = ? and pwd=?";
        boolean flag=false;
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmailID());
			ps.setString(2, user.getPassword());
			ResultSet rs = ps.executeQuery();
			int count = 0;
			User us=new User();
			while (rs.next()) {
				count++;
				System.out.println(rs.getString("name"));
                us.setFirstName(rs.getString("name"));   
			}
			if (count > 0) 
			{
				flag=true;
			}
			rs.close();
			ps.close();
			return us;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
	}
	/*public boolean userLogin(User user) throws SQLException {
     query = "INSERT INTO borrower(card_no,fname,lname,address,phone) VALUES('" + String.valueOf(new_card_no) + "','" + fname + "','" + lname + "','" + address + "','" + ph + "')";
                    statement = con.prepareStatement(query);

                    statement.executeUpdate();

                    con.close();

		db = new DbConnection();
		con = db.getConnection();
		query = "select * from user_login where user_id=" + user.getEmailID()
				+ " and pwd =" + user.getPassword() + ";";
	
		
	 
		query = "select * from user_login;";
		PreparedStatement statement = con.prepareStatement(query);

		rs = statement.executeQuery();
		int count = 0;
		while (rs.next()) {
			count++;
			System.out.println(rs.getString("user_id"));

		}
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}*/
	/*public static void main(String[] args) throws SQLException {
		Login l=new Login();
		l.userLogin(new User());
		
	}*/
	public Boolean insertValues(String userid, String name, String description,
			String location) {
		// TODO Auto-generated method stub

		   boolean flag=false;
			Connection conn = null;
		try {
			
		 //System.out.println("sdfdsfdsasdfasdfsas");
					conn = dataSource.getConnection();


                  String  query = "select max(item_id) as itemid from lost_items;";
                    Statement stmts = conn.createStatement();
                    rs = stmts.executeQuery(query);
                    int itemid=0;
                    while (rs.next()) {

                    	itemid = rs.getInt("itemid");

                    }
System.out.println(itemid);
                    itemid = itemid + 1;

		String sql = "INSERT INTO lost_items VALUES("+itemid+ ",'" + name + "','" + description + "','" + userid + "','" + location + "')";
	    
     
			PreparedStatement ps = conn.prepareStatement(sql);
		    ps.executeUpdate();
	
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return true;
	}
	
	
	public Boolean insertFoundValues(String userid, String name, String description,
			String location) {
		// TODO Auto-generated method stub

		   boolean flag=false;
			Connection conn = null;
		try {
			
		 //System.out.println("sdfdsfdsasdfasdfsas");
					conn = dataSource.getConnection();


                  String  query = "select max(item_id) as itemid from found_items;";
                    Statement stmts = conn.createStatement();
                    rs = stmts.executeQuery(query);
                    int itemid=0;
                    while (rs.next()) {

                    	itemid = rs.getInt("itemid");

                    }
System.out.println(itemid);
                    itemid = itemid + 1;

		String sql = "INSERT INTO found_items VALUES("+itemid+ ",'" + name + "','" + description + "','" + userid + "','" + location + "')";
	    
     
			PreparedStatement ps = conn.prepareStatement(sql);
		    ps.executeUpdate();
	
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return true;
	}
	public String getItems() throws JsonGenerationException, JsonMappingException, IOException {
		// TODO Auto-generated method stub
		String sql = "SELECT item_id, item_name, item_desc, lost_location, name, contact_num FROM lost_items AS l,user_login AS u where l.user_id=u.user_id; ";
        boolean flag=false;
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ResultSet rs = ps.executeQuery();
			int count = 0;
			//User us=new User();
			//item_id | item_name | item_desc  | user_id   | lost_location
			String temp="[";
			ArrayList<LostItem> list=new ArrayList<LostItem>();
			while (rs.next()) {
			System.out.println("Hello");
              LostItem lo=new LostItem();
              lo.setItemId(rs.getInt("item_id"));
              lo.setItemName(rs.getString("item_name"));
              lo.setItemDesc( rs.getString("item_desc"));
              lo.setUserLocation(rs.getString("lost_location"));
              lo.setContact(rs.getInt("contact_num"));
              lo.setName(rs.getString("name"));
              ObjectMapper mapper = new ObjectMapper();
  			
				temp=temp+mapper.writeValueAsString(lo)+",";
				
			}
			temp=temp.substring(0,temp.length()-1);
			temp=temp+"]";
			System.out.println(temp);
			
		
			rs.close();
			ps.close();
			return temp;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
	
	}
	
	
	public String getFoundItems() throws JsonGenerationException, JsonMappingException, IOException {
		// TODO Auto-generated method stub
		String sql = "SELECT item_id, item_name, item_desc, found_location, name, contact_num FROM found_items AS l,user_login AS u where l.user_id=u.user_id; ";
        boolean flag=false;
		Connection conn = null;
 
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ResultSet rs = ps.executeQuery();
			int count = 0;
			//User us=new User();
			//item_id | item_name | item_desc  | user_id   | lost_location
			String temp="[";
			ArrayList<LostItem> list=new ArrayList<LostItem>();
			while (rs.next()) {
			System.out.println("Hello");
              LostItem lo=new LostItem();
              lo.setItemId(rs.getInt("item_id"));
              lo.setItemName(rs.getString("item_name"));
              lo.setItemDesc( rs.getString("item_desc"));
              lo.setUserLocation(rs.getString("found_location"));
              lo.setContact(rs.getInt("contact_num"));
              lo.setName(rs.getString("name"));
              ObjectMapper mapper = new ObjectMapper();
  			
				temp=temp+mapper.writeValueAsString(lo)+",";
				
			}
			temp=temp.substring(0,temp.length()-1);
			temp=temp+"]";
			System.out.println(temp);
			
		
			rs.close();
			ps.close();
			return temp;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
	
	}
	public Boolean updateLost(String userid, String id, String name,
			String description, String location) {
		// TODO Auto-generated method stub

		Connection conn = null;
		try {
		String sql = "UPDATE lost_items set item_name="+name+",item_desc="+description+",lost_location="+location+" where item_id="+id;
	    
     
			PreparedStatement ps = conn.prepareStatement(sql);
		    ps.executeUpdate();
	
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return true;

	}
	public Boolean updateFound(String userid, String id, String name,
			String description, String location) {
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
		String sql = "UPDATE found_items set item_name="+name+",item_desc="+description+",found_location="+location+" where item_id="+id;
	    
     
			PreparedStatement ps = conn.prepareStatement(sql);
		    ps.executeUpdate();
	
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {}
			}
		}
		return true;
	}

}
