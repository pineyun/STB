package com.kosta.project.reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.kosta.project.util.DBUtil;

public class WishDAO {
	
	static final String ReplyGet = "UPDATE TBL_USER_WISH "
			+ "SET WISH_CHECK = WISH_CHECK + 1"
			+ "WHERE USER_ID ='admin'"
			+ "AND PRODUCT_ID =1";
	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int result;

	
	/*
	 * public int writeReply(int userId, int productId) {
	 * 
	 * Connection connection = null; pst = null; rs = null; try { connection =
	 * DBUtil.getConnection(); pst = conn.prepareStatement(ReplyWrite);
	 * pst.setInt(1, reply.getProduct_ID()); pst.setString(2, reply.getUser_ID());
	 * pst.setString(3, reply.getReply_CONTENT()); return result =
	 * pst.executeUpdate(); } catch (Exception e) { e.printStackTrace(); } finally {
	 * try { if (rs != null) rs.close(); if (pst != null) pst.close(); if (conn !=
	 * null) conn.close(); } catch (Exception e2) { e2.printStackTrace(); } } return
	 * -1; }
	 */
}
