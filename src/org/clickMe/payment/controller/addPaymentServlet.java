package org.clickMe.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.clickMe.common.model.dto.PaymentDTO;
import org.clickMe.payment.model.Service.PaymentService;



@WebServlet("/payment/add")
public class addPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/WEB-INF/views/payment/addPayment.jsp";
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int postCode = Integer.valueOf(request.getParameter("postCode"));
		String method = request.getParameter("method");
		
		PaymentDTO newPayment = new PaymentDTO();
		newPayment.setPostCode(postCode);
		newPayment.setMethod(method);
		
		PaymentService addPaymentService = new PaymentService();
		int result = addPaymentService.addPayment(newPayment);
		
		String path = "";
		if (result > 0) {
			path = "/WEB-INF/views/payment/addPayment.jsp";
			System.out.println("Insert Success");
			request.setAttribute("isDMLSuccess", "success");
		} else {
			System.out.println("Insert Fail");
			request.setAttribute("isDMLSuccess", "fail");
		}

		request.getRequestDispatcher(path).forward(request, response);
	}
		

}
