package kr.co.handflea.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.product.ProductDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO dao;

	public int updateBuyQty( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.updateBuyQty( dto );
		return successCount;
	}//updateBuyQty

	public int delete( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public List<ProductDTO> list(String mno) {
		List<ProductDTO> list = null;
		list = dao.list(mno);
		return list;
	}//list

	public int insert( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

}//class

