package kr.co.handflea.QnA;

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

import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SearchDTO;

@Controller
@RequestMapping( value = "/QnA" )
public class QnAController {
	
	private final static Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	private QnAService service;
	
	@RequestMapping(value = "/mylist", method = RequestMethod.GET)
	public String mylist( Model model, String userWantPage, SearchDTO dto, HttpSession session) {
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
		
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		
		List<QnADTO> list = null;
		list = service.searchList(dto);
		model.addAttribute("list", list);
		model.addAttribute("search_dto",dto);
		
		return"/mypage/mylist";
	}
	
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update (QnADTO dto, HttpSession session, PrintWriter out) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMem_no(mDto.getMem_no());
	
		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}
	
	@RequestMapping( value = "/update_form", method = RequestMethod.GET )
	public String updateForm( String qna_no, Model model, HttpSession session) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		QnADTO dto = null;
		dto = service.detail(qna_no);
		
		if (!mem_no.equals(dto.getMem_no())) {
			return "/QnA/list";
		} else {
			model.addAttribute("detail_dto",dto);
			return "/QnA/update_form";
		}
	}

	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( QnADTO dto, HttpSession session, PrintWriter out) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMem_no();
		int successCount = 0;

		if (!dto.getMem_no().equals(mem_no)) {
			successCount = 3;
			out.print(successCount);
			return;
		}

		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
		
	}

	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail (String qna_no, Model model) {
		QnADTO dto = null;
		dto = service.detail(qna_no);
		model.addAttribute("detail_dto", dto);
		logger.info(dto.toString());
		return"/QnA/detail";
	}
	
	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void write(QnADTO dto, HttpSession session, PrintWriter out) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMem_no(mDto.getMem_no());
		
		int successCount = 0;
		successCount = service.write( dto );
		out.print(successCount);
		out.close();
	}
	
	@RequestMapping( value = "/write_form", method = RequestMethod.GET )
	public String writeForm() {
		return "/QnA/write_form";
	}
	
	@RequestMapping( value = "/list", method = RequestMethod.GET )
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
		return"/QnA/list";
	}
}
	