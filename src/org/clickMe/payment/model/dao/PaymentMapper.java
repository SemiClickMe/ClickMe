package org.clickMe.payment.model.dao;

import org.clickMe.common.model.dto.PaymentDTO;

public interface PaymentMapper {

	int addPayment(PaymentDTO newPayment);

	

}
