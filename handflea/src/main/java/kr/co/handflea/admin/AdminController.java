package kr.co.handflea.admin;

import java.awt.geom.CubicCurve2D;
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

import kr.co.handflea.QnA.QnADTO;
import kr.co.handflea.order.OrderDTO;
import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SearchDTO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
   private final static Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Autowired
   private AdminService service;
   
   @RequestMapping( value = "/reply_insert", method = RequestMethod.POST )
	public void replyInsert( QnADTO dto, HttpSession session, PrintWriter out ) {
	   
	   dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );

		int successCount = 0;
		successCount = service.replyInsert( dto );

		out.print(successCount);
		out.close();

	}//replyInsert
   
   @RequestMapping( value = "/ad_list", method = RequestMethod.GET )
	public String list( Model model, String userWantPage, SearchDTO dto) {
		if(userWantPage == null || userWantPage.equals("")) userWantPage = "1";
		int totalCount = 0, startPageNum = 1,endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount(dto);
		
		if(totalCount > 10) {
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
			
		}

		if(userWantPage.length() >= 2) {
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;
				endPageNum = endPageNum - 10;
			}
		}
		
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		
		List<QnADTO> list = null;
		list = service.searchList(dto);
		model.addAttribute("list", list);
		model.addAttribute("search_dto",dto);
		return"/admin/ad_list";
	}
   
   @RequestMapping(value = "/member", method = RequestMethod.GET)
   public String memberlist(Model model, HttpSession session) {
      String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
      List<MemberDTO> list = null;
      list = service.memberList(mem_no);
      
      model.addAttribute("mem_list", list);
      
      return "/admin/member";
   }
   
   @RequestMapping(value = "/revoke", method = RequestMethod.GET)
   public void sellerRevoke(String mem_no, PrintWriter out) {
      int successCnt = 0;
      successCnt = service.sellerRevoke(mem_no);
      
      out.print(successCnt);
      out.close();
   }
   
   @RequestMapping(value = "/refund", method = RequestMethod.GET)
   public String refundlist(Model model, HttpSession session) {
	   List<OrderDTO> rlist = null;
	   rlist = service.refundList();
	   
	   List<OrderDTO> clist = null;
	   clist = service.refundCompleteList();
	   
	   model.addAttribute("refund_list", rlist);
	   model.addAttribute("refund_complete_list", clist);
	   
      return "/admin/refund";
   }
   
   @RequestMapping(value = "/orderrefund", method = RequestMethod.GET)
   public void refund(String detail_no, PrintWriter out) {
	   int successCnt = 0;
	   successCnt = service.orderRefund(detail_no);
	   
	   out.print(successCnt);
	   out.close();
   }
}