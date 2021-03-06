package com.kosta.project.reply;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.kosta.project.product.Product;
import com.kosta.project.util.DBUtil;

public class ReplyDAO {

	static final String ReplyGet = "SELECT * FROM TBL_REPLY WHERE PRODUCT_ID = ? "
			+ " ORDER BY REPLY_DATE desc";

	static final String ReplyWrite = "INSERT INTO "
			+ "TBL_REPLY (REPLY_ID, REPLY_DATE, PRODUCT_ID, USER_ID, REPLY_CONTENT, REPLY_SECRET)  VALUES (REPLY_SEQ.nextval, sysdate, ?, ?, ?, ?)"
			+ "";
	static final String ReplyDelete = "DELETE FROM TBL_REPLY tr WHERE REPLY_ID = ? AND USER_ID = ?";

	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int result;

	public ArrayList<Reply> getReplyList(int board_ID) {

		ArrayList<Reply> replyList = new ArrayList<Reply>();
		Connection connection = null;
		pst = null;
		rs = null;
		try {
			connection = DBUtil.getConnection();
			pst = connection.prepareStatement(ReplyGet);
			pst.setInt(1, board_ID);
			rs = pst.executeQuery();

			while (rs.next()) {
				int replyId = rs.getInt("reply_ID");
				Date replyDate = rs.getDate("reply_DATE");
				int productId = rs.getInt("product_ID");
				String userId = rs.getString("user_ID");
				String content = rs.getString("reply_CONTENT");
				int reply_SECRET = rs.getInt("reply_SECRET");

				Reply reply = new Reply();
				reply.setUser_ID(userId);
				reply.setProduct_ID(productId);
				reply.setReply_DATE(replyDate);
				reply.setReply_ID(replyId);
				reply.setReply_CONTENT(content);
				reply.setReply_SECRET(reply_SECRET);
				System.out.println(reply.toString());
				replyList.add(reply);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println(replyList);
		return replyList;
	}

	public int writeReply(Reply reply) {

		Connection conn = null;
		pst = null;
		rs = null;
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(ReplyWrite);
			pst.setInt(1, reply.getProduct_ID());
			pst.setString(2, reply.getUser_ID());
			pst.setString(3, reply.getReply_CONTENT());
			pst.setInt(4, reply.getReply_SECRET());
			return result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;
	}

	public int deleteReply(int replyId, String userId) {

		Connection conn = null;
		pst = null;
		rs = null;
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(ReplyDelete);
			pst.setInt(1, replyId);
			pst.setString(2, userId);
			return result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;
	}

}
