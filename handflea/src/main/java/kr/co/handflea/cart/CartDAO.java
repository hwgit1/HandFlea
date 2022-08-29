package kr.co.handflea.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<ProductDTO> list(String mno) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insert(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateBuyQty(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
