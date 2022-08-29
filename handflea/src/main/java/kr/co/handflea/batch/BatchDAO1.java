package kr.co.handflea.batch;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.order.OrderDTO;

@Repository
public class BatchDAO1 {
	
	@Autowired
	private SqlSession sqlSession;

	public List<OrderDTO> updatePrdtconList() {
		List<OrderDTO> list = null;
		list = sqlSession.selectList("Batch1Mapper.updatePrdtconList");
		
		return list;
	}

	public int updatePrdtRefund(OrderDTO dto) {
		int successCnt = 0;
		successCnt = sqlSession.update("Batch1Mapper.updatePrdtRefund", dto);
		
		return successCnt;
	}
	
	
}
