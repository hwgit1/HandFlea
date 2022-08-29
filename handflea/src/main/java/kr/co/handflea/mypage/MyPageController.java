package kr.co.handflea.mypage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.handflea.QnA.QnADTO;
import kr.co.handflea.order.OrderDTO;
import kr.co.handflea.order.OrderService;
import kr.co.handflea.util.dto.AdjustDTO;
import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.DeliveryDTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SellerDTO;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	MyPageService service;
	
	@Autowired
	OrderService oservice;
	
	@RequestMapping( value = "/sellerjoin", method = RequestMethod.POST )
	public void sellerjoin(	SellerDTO dto , PrintWriter out, HttpSession session ) {
		
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		int successCount = 0;
		System.out.println(dto.toString());
		successCount = service.sellerjoin( dto );
		
		if (successCount == 1) {
			MemberDTO mdto = new MemberDTO();
			mdto = (MemberDTO) session.getAttribute("login_info");
			mdto.setSeller_yn("1");
			session.setAttribute("login_info", mdto);
		}
		out.print(successCount);
		out.close();
	}//sellerjoin
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String seller_regist(PrintWriter out) {
		return "/mypage/seller_regist";
	}//seller_regist
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		String seller_yn = ((MemberDTO)session.getAttribute("login_info")).getSeller_yn();
		
		List<OrderDTO> olist = null;
		olist = service.recentOrder(mem_no);
		model.addAttribute("recent_order_list", olist);
		model.addAttribute("order_cnt", olist.size());
		
		List<QnADTO> qlist = null;
		qlist = service.qnaList(mem_no);
		model.addAttribute("qna_list", qlist);
		model.addAttribute("qna_cnt", qlist.size());
		
		MemberDTO memdto = new MemberDTO();
		int basketCnt = service.getBasketCnt(mem_no);
		model.addAttribute("basket_cnt", basketCnt);
		
		int memOrderCnt = service.getmemOrderCnt(mem_no);
		model.addAttribute("memorder_cnt", memOrderCnt);
		
		int paybackCnt = service.getPaybackCnt(mem_no);
		model.addAttribute("payback_cnt", paybackCnt);
		
		if (seller_yn.equals("1")) {
			MemberDTO dto = null;
			dto = service.getSellerOrderCnt(mem_no);
			model.addAttribute("seller_order_cnt", dto);
			List<OrderDTO> slist = null;
			slist = service.recentSellOrder(mem_no);
			
			model.addAttribute("recent_sell_list", slist);
			model.addAttribute("sell_cnt", slist.size());
		}
		
		return "/mypage/mypage";
	}
	
	@RequestMapping(value = "/bank", method = RequestMethod.GET)
	public void bankSelect(PrintWriter out) {
		List<BankDTO> list = null;
		list = service.bankSelect();
		
		out.print( new Gson().toJson( list ) );
		out.close();		
	}
	
	@RequestMapping(value = "/memdelete", method = RequestMethod.GET)
	public void memdelete( MemberDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		String seller_yn = ((MemberDTO)session.getAttribute("login_info")).getSeller_yn();

		int deleteYn = 0;
		if (seller_yn.equals("1")) {
			deleteYn = service.sellerDelete(dto);
		}else {
			deleteYn = service.memDelete(dto);
		}
		System.out.println(dto.toString());
		out.print(deleteYn);
		out.close();
	};
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myInfo(Model model, HttpSession session) {
		MemberDTO dto = null;
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		String seller_yn = ((MemberDTO)session.getAttribute("login_info")).getSeller_yn();
		
		if (seller_yn.equals("1")) {
			dto = service.sellerInfoSelect(mem_no);
		}else {
			dto = service.infoSelect(mem_no);
			dto.setSeller_bank_no("0");
			dto.setSeller_account_no("0");
			dto.setSeller_post_code("0");
			dto.setSeller_add_1("0");
			dto.setSeller_add_2("0");
			dto.setSeller_name("0");
		}
		
		logger.info(dto.toString());
		
		model.addAttribute("myinfo", dto);
		
		return "/mypage/myinfo";
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.POST)
	
	public void infoUpdate( MemberDTO dto, HttpSession session, PrintWriter out) throws IOException {
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMem_no();
		File newFolder = new File("C:/upload/user/" + mem_no + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		
		InputStream is = null;
		FileOutputStream fos = null;
		
		MultipartFile profile = dto.getProfile();
		if (profile != null && !profile.getOriginalFilename().equals("")) {
			
			is = profile.getInputStream();
			fos = new FileOutputStream("C:/upload/user/" + mem_no + "/" + todayNalja + "_" + todaySigan + "_" + profile.getOriginalFilename() );
			
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setMem_photo(todayNalja + "_" + todaySigan + "_" + profile.getOriginalFilename());
			dto.setMem_photopath("/upload/user/" + mem_no + "/" + todayNalja + "_" + todaySigan + "_" + profile.getOriginalFilename());
		}
		int updateYn = 0;
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		String seller_yn = ((MemberDTO)session.getAttribute("login_info")).getSeller_yn();
		
		if (seller_yn.equals("1")) {
			updateYn = service.sellerInfoUpdate(dto);
			session.setAttribute("login_info", dto);
		}else {
			updateYn = service.infoUpdate(dto);
			session.setAttribute("login_info", dto);
		}
		System.out.println(dto.toString());
		out.print(updateYn);
		out.close();
	}
	
	@RequestMapping(value = "/sale", method = RequestMethod.GET)
	public String saleList(HttpSession session, Model model) {
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMem_no();
		
		List<OrderDTO> list = null; 
		list = service.saleList(mem_no);
		model.addAttribute("sale_list", list);
		model.addAttribute("sale_cnt", list.size());
		
		return "/mypage/sale_list";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMem_no();
		
		List<OrderDTO> list = null; 
		list = service.orderList(mem_no);
		model.addAttribute("order_list", list);
		model.addAttribute("order_cnt", list.size());
		
		return "/mypage/order_list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String orderDetail(String detail_no, Model model) {
		OrderDTO dto = null;
		dto = service.orderDetail(detail_no);
		String seller_no = service.sellerNo(detail_no);
		
		model.addAttribute("order_detail", dto);
		model.addAttribute("seller_no", seller_no);
		
		return "mypage/detail";
	}
	
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public void deliverySelect(PrintWriter out) {
		List<DeliveryDTO> list = null;
		list = service.deliverySelect();
		
		out.print( new Gson().toJson( list ) );
		out.close();	
	}
	
	@RequestMapping(value = "/adjust", method = RequestMethod.GET)
	public String adjustList(HttpSession session, Model model) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		
		int completeCnt = 0;
		completeCnt = service.completeCnt(mem_no);
		model.addAttribute("complete_order", completeCnt);
		
		MemberDTO dto = service.getSellerAdjust(mem_no);
		model.addAttribute("seller_dto", dto);
		
		List<AdjustDTO> list = null;
		list = service.selectAdjust(mem_no);
		model.addAttribute("adjust_list", list);
		model.addAttribute("total_adjust", list.size());
		
		return "/mypage/adjust";
	}
	
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	public void withdraw(AdjustDTO dto, PrintWriter out, HttpSession session) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		dto.setMem_no(mem_no);
		
		int successCnt = 0;
		successCnt = service.withdraw(dto);
		
		out.print(successCnt);
		out.close();
	}
}
