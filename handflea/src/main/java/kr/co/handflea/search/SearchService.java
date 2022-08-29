package kr.co.handflea.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.product.ProductDAO;
import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.SearchDTO;
@Service
public class SearchService {

	@Autowired
	private SearchDAO dao;
	
	@Autowired
	private ProductDAO pdao;
	
	public List<ProductDTO> searchList(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = dao.searchList( dto );
		
		for (int i = 0; i < list.size(); i++) {
			ProductDTO pdto = list.get(i);
			pdto.setCnt(pdao.reviewCnt(pdto.getPrdt_no()));
			pdto.setStar_point(pdao.reviewPoint(pdto.getPrdt_no()));
		}
		
		return list;
	}//searchList

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

}
