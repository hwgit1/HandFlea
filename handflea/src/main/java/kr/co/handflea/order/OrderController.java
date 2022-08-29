package kr.co.handflea.order;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	//private final static Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String orderList(String [] arr_basket_no, ProductDTO dto, Model model, HttpSession session) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		MemberDTO mdto = new MemberDTO();
		mdto = service.buyerInfo(mem_no);
		model.addAttribute("buyer_info", mdto);
		
		List<ProductDTO> list = null;
		if (arr_basket_no != null && arr_basket_no.length > 0) {
			list = service.orderList(arr_basket_no);
		} else {
			list = service.buyOrderList(dto);
			arr_basket_no = new String[1];
			arr_basket_no[0] = "0";
		}
		model.addAttribute("list", list);
		model.addAttribute("arr_basket_no", new Gson().toJson(arr_basket_no));
		
		return "/order/order_list";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void orderInsert(OrderDTO dto, HttpSession session, PrintWriter out) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		dto.setMem_no(mem_no);
		
		String [] tmpArr = dto.getStr_basket_no().split(",");
		dto.setArr_basket_no(tmpArr);
		
		int successCnt = 0;
		if (dto.getArr_basket_no().length == 1 && dto.getArr_basket_no()[0].equals("0")) {
			successCnt = service.insert(dto, 1);
		} else {
			successCnt = service.insert(dto, 0);
		}
		
		out.print(successCnt);
		out.close();
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void orderUpdate(OrderDTO dto, PrintWriter out) {
		dto.setPrdt_con("1");
		int successCnt = 0;
		successCnt = service.deliveryUpdate(dto);
		
		out.print(successCnt);
		out.close();
	}
	
	@RequestMapping(value = "/receive", method = RequestMethod.GET)
	public void prdtReceive(String detail_no, PrintWriter out) {
		OrderDTO dto = new OrderDTO();
		dto.setDetail_no(detail_no);
		dto.setPrdt_con("2");
		int successCnt = 0;
		successCnt = service.prdtReceive(dto);
		
		out.print(successCnt);
		out.close();
	}
	
	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public void prdtRefund(String detail_no, PrintWriter out) {
		OrderDTO dto = new OrderDTO();
		dto.setDetail_no(detail_no);
		dto.setPrdt_con("4");
		
		int successCnt = 0;
		successCnt = service.prdtRefund(dto);
		
		out.print(successCnt);
		out.close();
	}
}
