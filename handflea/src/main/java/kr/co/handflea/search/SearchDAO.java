package kr.co.handflea.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.SearchDTO;
@Repository
public class SearchDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductDTO> searchList(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("SearchMapper.searchList", dto);
		return list;
	}

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("SearchMapper.searchListCount", dto);
		return totalCount;
	}

}
