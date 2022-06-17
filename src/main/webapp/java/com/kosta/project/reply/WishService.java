package com.kosta.project.reply;

public class WishService {
	public int like(int productId, String userId, String like01) {
		int ret = 0;
		WishDAO wishDao = new WishDAO();
		if(wishDao.wishInsert(productId, userId)>0)
		    ret = wishDao.likePlus(productId, like01);
		
		return ret;
	}
}
