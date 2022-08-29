package kr.co.handflea.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.product.ProductDTO;
import kr.co.handflea.util.dto.MemberDTO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProductDTO> buyOrderList(ProductDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("OrderMapper.buyOrderList", dto);
		
		return list;
	}

	public MemberDTO buyerInfo(String mem_no) {
		MemberDTO dto = new MemberDTO();
		dto = sqlSession.selectOne("OrderMapper.buyerInfo", mem_no);
		
		return dto;
	}

	public List<ProductDTO> orderList(String[] arr_basket_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("OrderMapper.orderList", arr_basket_no);
		
		return list;
	}

	public int insertOrder(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("OrderMapper.insertOrder", dto);
		
		return successCnt;
	}

	public int insertBasketOrder(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("OrderMapper.insertBasketOrder", dto);
		
		return successCnt;
	}

	public int deleteBasket(String[] arr_basket_no) {
		int successCnt = 0;
		successCnt = sqlSession.delete("OrderMapper.deleteBasket", arr_basket_no);
		
		return successCnt;
	}

	public int insertNowOrder(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.insert("OrderMapper.insertNowOrder", dto);
		
		return successCnt;
	}

	public int deliveryUpdate(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.update("OrderMapper.deliveryUpdate", dto);
		
		return successCnt;
	}

	public int prdtReceive(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.update("OrderMapper.prdtReceive", dto);
		
		return successCnt;
	}

	public int insertAmt(String detail_no) {
		int successCnt = 0;
		successCnt = sqlSession.insert("OrderMapper.insertAmt", detail_no);
		
		return successCnt;
	}

	public int updateSellerPrice(String detail_no) {
		int successCnt = 0;
		successCnt = sqlSession.update("OrderMapper.updateSellerPrice", detail_no);
		
		return successCnt;
	}

	public int prdtRefund(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.update("OrderMapper.prdtRefund", dto);
		
		return successCnt;
	}
}
