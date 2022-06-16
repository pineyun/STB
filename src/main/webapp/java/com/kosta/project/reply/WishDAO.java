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
	
	 

	static final String SQL_WISH_INSERT = "INSERT INTO TBL_USER_WISH VALUES (WISH_seq.nextVal, sysdate, ?, ?, 1)"
			+ "";

	
	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int result;

	
	public int likePlus(int product, String like01) {
 
		 String SQL_LIKE_COUNT_PLUS = "UPDATE TBL_PRODUCT SET WISH_COUNT = nvl(WISH_COUNT,0) " + like01
					+ "WHERE PRODUCT_ID = ?";
		 
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(SQL_LIKE_COUNT_PLUS);
			pst.setInt(1, product);
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return result;
	}
	
	public int wishInsert(int productId, String userId) {
		 
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(SQL_WISH_INSERT);
			pst.setInt(1, productId);
			pst.setString(2, userId);

			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return result;
	}
}
