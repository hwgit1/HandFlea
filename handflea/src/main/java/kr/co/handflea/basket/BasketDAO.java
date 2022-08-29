package kr.co.handflea.basket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSession sqlSession;

	public int updateBuyQty( ProductDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("BasketMapper.updateBuyQty", dto);
		return successCount;
	}//updateBuyQty

	public int delete( ProductDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("BasketMapper.delete", dto);
		return successCount;
	}//delete

	public List<ProductDTO> list(String mno) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("BasketMapper.list", mno);
		return list;
	}//list

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("BasketMapper.insert", dto);
		return successCount;
	}//insert

}//class
