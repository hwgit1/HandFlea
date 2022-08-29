package kr.co.handflea.product;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.review.ReviewDTO;
import kr.co.handflea.review.ReviewService;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SearchDTO;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired             
	private ProductService service;
	
	@Autowired
	private ReviewService rsevice;
	
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( ProductDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		
		dto.setOption_yn("0");
		
		if (dto.getArr_option().length > 0) {
			dto.setOption_yn("1");
		}//if
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		String mem_email = ( (MemberDTO) session.getAttribute("login_info") ).getMem_email();
		File newFolder = new File("C:/upload/product/" + mem_email + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		
		InputStream is = null;
		FileOutputStream fos = null;

		MultipartFile thumbnail = dto.getThumbnail();
		if(thumbnail != null && !thumbnail.getOriginalFilename().equals("")) {
			is = thumbnail.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/" + mem_email + "/" + todayNalja + "_"
														+ todaySigan + "_" + thumbnail.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setThumbnail_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
			dto.setThumbnail_path("/upload/product/" + mem_email + "/" + todayNalja + "_"
									+ todaySigan + "_" + thumbnail.getOriginalFilename());
		}

		MultipartFile desc_img = dto.getDesc_img();
		if(desc_img != null && !desc_img.getOriginalFilename().equals("")) {
			is = desc_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/" + mem_email + "/" + todayNalja + "_"
										+ todaySigan + "_" + desc_img.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setDesc_img_name(todayNalja + "_" + todaySigan + "_" + desc_img.getOriginalFilename());
			dto.setDesc_img_path("/upload/product/" + mem_email + "/" + todayNalja + "_"
									+ todaySigan + "_" + desc_img.getOriginalFilename());
		}

		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );

		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping( value = "/file/delete", method = RequestMethod.GET )
	public void fileDelete( String id, String path, ProductDTO dto, HttpSession session, PrintWriter out ) {
		File file = new File("C:" + path);
		file.delete();

		if(id.equals("thumbnail_btn")) {
			dto.setThumbnail_name( path.substring(path.lastIndexOf("/") + 1) );
			dto.setThumbnail_path(path);
		} else if(id.equals("desc_img_btn")) {
			dto.setDesc_img_name( path.substring(path.lastIndexOf("/") + 1) );
			dto.setDesc_img_path(path);
		} 

		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		
		int successCount = 0;
		successCount = service.fileDelete( dto );
		out.print(successCount);
		out.close();
	}//fileDelete
	
	@RequestMapping( value = "/uform", method = RequestMethod.GET )
	public String updateForm( String prdt_no, Model model ) {
		ProductDTO dto = null;
		dto = service.sellerdetail( prdt_no );
		model.addAttribute("detail_dto", dto);
		return "/product/uform";//jsp file name
	}//updateForm
	
	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( ProductDTO dto, HttpSession session, PrintWriter out ) {

		if(!dto.getThumbnail_path().equals("")) {
			File file = new File("C:" + dto.getThumbnail_path());
			file.delete();
		}
		if(!dto.getDesc_img_path().equals("")) {
			File file = new File("C:" + dto.getDesc_img_path());
			file.delete();
		}

		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );

		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete
	
	@RequestMapping( value = "/sellerdetail", method = RequestMethod.GET )
	public String sellerdetail( String prdt_no, Model model ) {
		ProductDTO dto = null;
		dto = service.detail( prdt_no );
		model.addAttribute("detail_dto", dto);
		return "/product/sellerdetail";//jsp file name
	}//sellerdetail
	
	@RequestMapping( value = "/sellerlist", method = RequestMethod.GET )
	public String sellerlist( Model model, String userWantPage, SearchDTO dto, HttpSession session ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );

		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if

		if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
			//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;// 11 - 10 -> 1
				endPageNum = endPageNum - 10;// 20 - 10 -> 10
			}//if
		}//if

		//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		
		List<ProductDTO> list = null;
		list = service.sellerlist( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/product/sellerlist";//jsp file name
}//sellerlist
	
	@RequestMapping( value = "/option", method = RequestMethod.GET)
	public void option_contents( String prdt_no ,PrintWriter out ) {
		System.out.println(prdt_no);
		List<ProductDTO> list = null;
		list = service.option_contents( prdt_no );

		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		
		out.print(jsonString);
		out.close();
	}//option_contents
	
	@RequestMapping( value = "/detail", method = RequestMethod.GET )
	public String detail( String prdt_no, Model model ) {
		ProductDTO dto = null;
		dto = service.detail( prdt_no );
		model.addAttribute("detail_dto", dto);
		
		List<ReviewDTO> list = null;
		list = rsevice.reviewList(prdt_no);
		model.addAttribute("reviewlist", list);
		
		return "/product/detail";//jsp file name
	}//detail
	
	@RequestMapping( value = "/smallcatelist", method = RequestMethod.GET)
	public String smallcatelist( Model model, String smallcate_no ) {
		
		List<ProductDTO> list = null;
		list = service.smallcatelist( smallcate_no );
		model.addAttribute("list", list);
		return "/product/smallcatelist";//jsp file name
		
	}//smallcatelist
	
	@RequestMapping( value = "/bigcatelist", method = RequestMethod.GET)
	public String bigcatelist( Model model, String bigcate_no ) {
		
		List<ProductDTO> list = null;
		list = service.bigcatelist( bigcate_no );
		model.addAttribute("list", list);
		return "/product/bigcatelist";//jsp file name
		
	}//bigcatelist
	
//	@RequestMapping( value = "/main", method = RequestMethod.GET )
//	public String main( Model model, String userWantPage, SearchDTO dto ) {
//		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
//		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
//		totalCount = service.searchListCount( dto );
//
//		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
//			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
//		}//if
//
//		if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
//			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
//			startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
//			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
//			//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
//			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
//			if(backNum.equals("0")) {
//				startPageNum = startPageNum - 10;// 11 - 10 -> 1
//				endPageNum = endPageNum - 10;// 20 - 10 -> 10
//			}//if
//		}//if
//
//		//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
//		if(endPageNum > lastPageNum) endPageNum = lastPageNum;
//
//		model.addAttribute("startPageNum", startPageNum);
//		model.addAttribute("endPageNum", endPageNum);
//		model.addAttribute("lastPageNum", lastPageNum);
//		model.addAttribute("userWantPage", userWantPage);
//
//		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 10  );
//
//		List<ProductDTO> list = null;
//		list = service.main( dto );
//		model.addAttribute("list", list);
//		model.addAttribute("search_dto", dto);
//		return "/main";//jsp file name
//}//main
	
//	@RequestMapping( value = "/option_insert", method = RequestMethod.POST)
//	public void option_insert(ProductDTO dto, HttpSession session, PrintWriter out) {
//		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
//		
//		int successCount = 0;
//		successCount = service.option_insert(dto);
//		out.print(successCount);
//		out.close();
//	}//option_insert
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST)
	public void insert(ProductDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		
		dto.setOption_yn("0");
	
		for (int i = 0; i < dto.getArr_option().length; i++) {
			dto.setOption_yn("1");
		}//for

		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		String mem_email = ( (MemberDTO) session.getAttribute("login_info") ).getMem_email();
		File newFolder = new File("C:/upload/product/" + mem_email + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();

		MultipartFile thumbnail = dto.getThumbnail();
		InputStream is = thumbnail.getInputStream();
		FileOutputStream fos = new FileOutputStream( "C:/upload/product/" + mem_email + "/" + todayNalja + "_"
													+ todaySigan + "_" + thumbnail.getOriginalFilename() );
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setThumbnail_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
		dto.setThumbnail_path("/upload/product/" + mem_email + "/" + todayNalja + "_"
								+ todaySigan + "_" + thumbnail.getOriginalFilename());

		MultipartFile desc_img = dto.getDesc_img();
		if(desc_img != null && !desc_img.getOriginalFilename().equals("")) {
			is = desc_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/" + mem_email + "/" + todayNalja + "_"
										+ todaySigan + "_" + desc_img.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setDesc_img_name(todayNalja + "_" + todaySigan + "_" + desc_img.getOriginalFilename());
			dto.setDesc_img_path("/upload/product/" + mem_email + "/" + todayNalja + "_"
									+ todaySigan + "_" + desc_img.getOriginalFilename());
		}

		dto.setMem_no( ( (MemberDTO) session.getAttribute("login_info") ).getMem_no() );
		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form() {
		return "product/form";//jsp file name
	}//form
	
	@RequestMapping( value = "/smallcate", method = RequestMethod.GET )
	public void smallcateSelect( String bigcate_no, PrintWriter out ) {
		List<ProductDTO> list = null;
		list = service.smallcateSelect( bigcate_no );

		out.print( new Gson().toJson( list ) );
		out.close();
	}//smallcateSelect
	
	@RequestMapping( value = "/bigcate", method = RequestMethod.GET )
	public void bigcateSelect( PrintWriter out ) {
		List<ProductDTO> list = null;
		list = service.bigcateSelect();

		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		
		out.print(jsonString);
		out.close();
	}//bigcateSelect
	
}//class

/*
drop table product;

CREATE TABLE `product` (
  `prdt_no` int NOT NULL AUTO_INCREMENT,
  `prdt_name` varchar(60) NOT NULL,
  `mem_no` int NOT NULL,
  `price` int NOT NULL,
  `delivery_price` int NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `view_cnt` int DEFAULT '0',
  `reg_date` datetime DEFAULT NULL,
  `del_yn` int DEFAULT '0',
  `del_date` datetime DEFAULT NULL,
  `thumbnail_name` varchar(100) NOT NULL,
  `thumbnail_path` varchar(100) NOT NULL,
  `prdt_img_name` varchar(100) DEFAULT NULL,
  `prdt_img_path` varchar(100) DEFAULT NULL,
  `desc_img_name` varchar(100) DEFAULT NULL,
  `desc_img_path` varchar(100) DEFAULT NULL,
  `prdt_rdy` int DEFAULT '0',
  `option_yn` int DEFAULT '0',
  `bigcate_no` int NOT NULL,
  `smallcate_no` int NOT NULL,
  PRIMARY KEY (`prdt_no`)
);


drop table option;

CREATE TABLE `prdt_option` (
  `option_no` int NOT NULL AUTO_INCREMENT,
  `prdt_no` int NOT NULL,
  `option_contents` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`option_no`)
);

강사님꺼에서 뺸거 : 파일 업로드, 디스카운트, 재고
추가해야 할 것 : 옵션, 품절여부, 카테고리, 상품준비기간
*/
