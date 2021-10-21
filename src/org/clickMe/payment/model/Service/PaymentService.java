package org.clickMe.payment.model.Service;

import static org.clickMe.common.Template.getSqlSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.clickMe.cmt.model.dao.CmtMapper;
import org.clickMe.common.model.dto.PaymentDTO;
import org.clickMe.payment.model.dao.PaymentMapper;

public class PaymentService {

	/* 현재 예치금 조회 */
//	public int selectCurrentDeposit() {
//		SqlSession sqlSession = getSqlSession();
//		PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
//		
//		int currentDeposit  = paymentMapper.selectCurrentDeposit();
//		
//		
//		sqlSession.close();
//		
//		return currentDeposit;
//		
//	}


	
	/* 사용할 상품 금액 조회*/
//	public void selectProductPrice() {
//		
//	}
//	
	
	/* 예치금 사용내역 입력하기 */
	public int addPayment(PaymentDTO newPayment) {
		SqlSession sqlSession = getSqlSession();
		PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
		
		int result = paymentMapper.addPayment(newPayment);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return result;
	}
	
}
