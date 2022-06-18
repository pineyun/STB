package com.kosta.project.request;

import java.util.List;

import com.kosta.project.product.Product;

public class RequestService {
	RequestDAO requestDAO = new RequestDAO();
	
	//개설한 join 조회
	public List<Product> selectMyJoin(String user_id){
		List<Product> requestList = requestDAO.selectMyJoin(user_id);
		return requestList;
	}
	//신청한 join 조회
	public List<Product> selectMyRequest(String user_id){
		List<Product> requestList = requestDAO.selectMyRequest(user_id);
		return requestList;
	}
	//승낙하기
	public int acceptRequest(int request_id) {
		return requestDAO.acceptRequest(request_id);
	}
	
	//승낙 취소하기 ? (N으로 바꾸기)
	public int refuseRequest(int request_id) {
		return requestDAO.refuseRequest(request_id);
	}
	
	//신청하기
	public int askRequest(RequestVO request) {
		if( requestDAO.askRequest(request)>0) {
			return requestDAO.increaseCurrentNumber(request.getProduct_id());
		};
		
		return 0;
	}
	
	
	
	//신청 취소하기
	public int cancelRequest(int request_id, int productid) {
		
		if(requestDAO.cancelRequest(request_id)>0) {
			return requestDAO.decreaseCurrentNumber(productid); 
		}
				 
		return 0;
	}
}
