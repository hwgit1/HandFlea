package kr.co.handflea.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.SearchDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int update(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.update", dto);
		return successCount;
	}
	
	public int fileDelete(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.fileDelete", dto);
		return successCount;
	}//fileDelete
	
	public int delete(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.delete", dto);
		return successCount;
	}//delete
	
	public ProductDTO sellerdetail(String prdt_no) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("ProductMapper.sellerdetail", prdt_no);
		return dto;
	}//sellerdetail
	
	public List<ProductDTO> sellerlist(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.sellerlist", dto);
		return list;
	}
	
	public List<ProductDTO> option_contents(String prdt_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.option_contents", prdt_no);
		return list;
	}//option_contents
	
	public ProductDTO detail( String prdt_no ) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("ProductMapper.detail", prdt_no);
		return dto;
	}//detail
	
	public List<ProductDTO> smallcatelist(String smallcate_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.smallcatelist", smallcate_no);
		return list;
	}//smallcatelist
	
	public List<ProductDTO> bigcatelist(String bigcate_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.bigcatelist", bigcate_no);
		return list;
	}//bigcatelist
	
	public void incrementViewCnt( String prdt_no ) {
		sqlSession.update("ProductMapper.incrementViewCnt", prdt_no);
	}//incrementViewCnt

	public List<ProductDTO> main( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.main", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("ProductMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	public int option_insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.option_insert", dto);
		return successCount;
	}//option_insert
	
	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.insert", dto);
		return successCount;
	}//insert

	public List<ProductDTO> smallcateSelect(String bigcate_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.smallcateSelect", bigcate_no);
		return list;
	}//smallcateSelect
	
	public List<ProductDTO> bigcateSelect() {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.bigcateSelect");
		return list;
	}//bigcateSelect

	public int optionCnt(String prdt_no) {
		int cnt = 0;
		cnt = sqlSession.selectOne("ProductMapper.optionCnt", prdt_no);
		return cnt;
	}

	public int optionAllDelete(String prdt_no) {
		return sqlSession.delete("ProductMapper.optionAllDelete", prdt_no);
	}

	public int updateOption(ProductDTO dto) {
		return sqlSession.update("ProductMapper.updateOption", dto);
	}

	public int optionDelete(ProductDTO dto) {
		return sqlSession.delete("ProductMapper.optionDelete", dto);
	}

	public int optionInsert(ProductDTO dto) {
		return sqlSession.insert("ProductMapper.optionInsert", dto);
	}

	public int reviewCnt(String prdt_no) {
		String count = null;
		int cnt = 0;
		count = sqlSession.selectOne("ProductMapper.reviewCnt", prdt_no);
		if (count != null) {
			cnt = Integer.parseInt(count);
		}
		
		return cnt;
	}

	public int reviewPoint(String prdt_no) {
		int star_point = 0;
		String point = null;
		point = sqlSession.selectOne("ProductMapper.reviewPoint", prdt_no);
		
		if (point != null) {
			point = point.substring(0, 1);
			star_point = Integer.parseInt(point);
		}
		
		return star_point;
	}

	public List<ProductDTO> bestmain(SearchDTO dto) {
		List<ProductDTO> bestlist = null;
		bestlist = sqlSession.selectList("ProductMapper.bestmain", dto);
		return bestlist;
	}

}//class
