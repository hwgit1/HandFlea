package kr.co.handflea.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.SearchDTO;


@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;
	
	public int update(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.update( dto );
		if(successCount < 1) return successCount;
		if (dto.getArr_option().length == 0 || dto.getArr_option() == null) {
			successCount = dao.optionAllDelete(dto.getPrdt_no());
		} else {
			int cnt = dao.optionCnt(dto.getPrdt_no());
			System.out.println(cnt + " : " + dto.getArr_option().length);
			if (dto.getArr_option().length < cnt) {
				for (int i = 0; i < dto.getArr_option().length; i++) {
					String [] option_no = dto.getArr_option_no();
					String [] option_contents = dto.getArr_option();
					dto.setOption_no(option_no[i]);
					dto.setOption_contents(option_contents[i]);
					successCount = dao.updateOption(dto);
				}
				dto.setLimitNum(cnt - dto.getArr_option().length);
				successCount = dao.optionDelete(dto);
			} else if (dto.getArr_option().length == cnt) {
				for (int i = 0; i < dto.getArr_option().length; i++) {
					String [] option_no = dto.getArr_option_no();
					String [] option_contents = dto.getArr_option();
					dto.setOption_no(option_no[i]);
					dto.setOption_contents(option_contents[i]);
					successCount = dao.updateOption(dto);
				}
			} else {
				for (int i = 0; i < cnt; i++) {
					String [] option_no = dto.getArr_option_no();
					String [] option_contents = dto.getArr_option();
					dto.setOption_no(option_no[i]);
					dto.setOption_contents(option_contents[i]);
					successCount = dao.updateOption(dto);
				}
				for (int i = 0; i < (dto.getArr_option().length - cnt); i++) {
					String [] option_contents = dto.getArr_option();
					dto.setOption_contents(option_contents[cnt + i]);
					successCount = dao.optionInsert(dto);
				}
			}
		}
		return successCount;
	}//update
	
	public int fileDelete(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.fileDelete( dto );
		return successCount;
	}//fileDelete
	
	public int delete(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete
	
	public ProductDTO sellerdetail(String prdt_no) {
		ProductDTO dto = null;
		dto = dao.sellerdetail( prdt_no );
		return dto;
	}//sellerdetail
	
	public List<ProductDTO> sellerlist(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = dao.sellerlist( dto );
		return list;
	}//sellerlist
	
	public List<ProductDTO> option_contents(String prdt_no) {
		List<ProductDTO> list = null;
		list = dao.option_contents(prdt_no);
		return list;
	}//option_contents
	
	public ProductDTO detail( String prdt_no ) {
		dao.incrementViewCnt( prdt_no );

		ProductDTO dto = null;
		dto = dao.detail( prdt_no );
		dto.setCnt(dao.reviewCnt(prdt_no));
		dto.setStar_point(dao.reviewPoint(prdt_no));
		return dto;
	}//detail
	
	public List<ProductDTO> smallcatelist(String smallcate_no) {
		List<ProductDTO> list = null;
		list = dao.smallcatelist( smallcate_no );

		for (int i = 0; i < list.size(); i++) {
			ProductDTO pdto = list.get(i);
			pdto.setCnt(dao.reviewCnt(pdto.getPrdt_no()));
			pdto.setStar_point(dao.reviewPoint(pdto.getPrdt_no()));
		}
		
		return list;
	}//smallcatelist
	
	public List<ProductDTO> bigcatelist(String bigcate_no) {
		List<ProductDTO> list = null;
		list = dao.bigcatelist( bigcate_no );
		
		for (int i = 0; i < list.size(); i++) {
			ProductDTO pdto = list.get(i);
			pdto.setCnt(dao.reviewCnt(pdto.getPrdt_no()));
			pdto.setStar_point(dao.reviewPoint(pdto.getPrdt_no()));
		}
		
		return list;
	}//bigcatelist
	
	public List<ProductDTO> main( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = dao.main( dto );
		
		for (int i = 0; i < list.size(); i++) {
			ProductDTO pdto = list.get(i);
			pdto.setCnt(dao.reviewCnt(pdto.getPrdt_no()));
			pdto.setStar_point(dao.reviewPoint(pdto.getPrdt_no()));
		}
		
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
	public int option_insert(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.option_insert(dto);
		return successCount;
	}//option_insert
	
	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.insert(dto);
		if(successCount < 1) return successCount;
		if (dto.getArr_option() != null && dto.getArr_option().length > 0) {
			successCount = dao.option_insert(dto);
		}
		return successCount;
	}//insert

	public List<ProductDTO> smallcateSelect(String bigcate_no) {
		List<ProductDTO> list = null;
		list = dao.smallcateSelect( bigcate_no );
			
		return list;
	}//smallcateSelect
	
	public List<ProductDTO> bigcateSelect() {
		List<ProductDTO> list = null;
		list = dao.bigcateSelect();
		
		return list;
	}//bigcateSelect

	public List<ProductDTO> bestmain(SearchDTO dto) {
		List<ProductDTO> bestlist = null;
		bestlist = dao.bestmain( dto );
		
		for (int i = 0; i < bestlist.size(); i++) {
			ProductDTO pdto = bestlist.get(i);
			pdto.setCnt(dao.reviewCnt(pdto.getPrdt_no()));
			pdto.setStar_point(dao.reviewPoint(pdto.getPrdt_no()));
		}
		
		return bestlist;
	}//bestmain

}//class
