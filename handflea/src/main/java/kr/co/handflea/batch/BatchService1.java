package kr.co.handflea.batch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.handflea.order.OrderDTO;

@Service
public class BatchService1 {
	@Autowired
	private BatchDAO1 dao;

	public List<OrderDTO> updatePrdtconList() {
		List<OrderDTO> list = null;
		list = dao.updatePrdtconList();
		
		return list;
	}

	public int updatePrdtRefund(OrderDTO dto) {
		int successCnt = 0;
		successCnt = dao.updatePrdtRefund(dto);
		
		return successCnt;
	}
}
