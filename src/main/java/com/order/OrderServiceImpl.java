package com.order;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao m_orderDao;

	private Logger m_logger = Logger.getLogger(OrderServiceImpl.class);

	@Override
	public int deleteOrder(int id) {
		try {
			return m_orderDao.deleteOrder(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public Order findByPK(int id) {
		try {
			return m_orderDao.findByPK(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public int insertOrder(Order order) {
		try {
			return m_orderDao.insertOrder(order);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Order> queryAllOrders() {
		try {
			return m_orderDao.queryAllOrders();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Order>();
		}
	}

	@Override
	public int queryAllSize(int shopId) {
		try {
			return m_orderDao.queryAllSize(shopId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> queryLimitedOrders(int start, int size,int shopId) {
		try {
			return m_orderDao.queryLimitedOrders(start, size,shopId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Order>();
		}
	}

	public void setOrderDao(OrderDao orderDao) {
		m_orderDao = orderDao;
	}

	@Override
	public int updateOrder(Order order) {
		try {
			return m_orderDao.updateOrder(order);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

}
