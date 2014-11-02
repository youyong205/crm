package com.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.BaseDao;

public class OrderDao {

	@Autowired
	private BaseDao m_baseDao;

	public int deleteOrder(int id) {
		return m_baseDao.delete("order.delete", id);
	}

	public Order findByNamePassword(String orderName, String password) {
		Map<String, String> pars = new HashMap<String, String>();

		pars.put("orderName", orderName);
		pars.put("password", password);
		return (Order) m_baseDao.queryForObject("order.findByName", pars);
	}

	public Order findByPK(int id) {
		return (Order) m_baseDao.queryForObject("order.findById", id);
	}

	public int insertOrder(Order order) {
		return (Integer) m_baseDao.insert("order.insert", order);
	}

	@SuppressWarnings("rawtypes")
	public List queryAllOrders() {
		return m_baseDao.queryForList("order.queryAllOrders");
	}

	public int queryAllSize(int shopId) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("shopId", shopId);
		return (Integer) m_baseDao.queryForObject("order.queryAllSize", parameters);
	}

	@SuppressWarnings("rawtypes")
	public List queryLimitedOrders(int start, int size,int shopId) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("start", start);
		parameters.put("size", size);
		parameters.put("shopId", shopId);

		return m_baseDao.queryForList("order.queryLimitedOrders", parameters);
	}

	public void setBaseDao(BaseDao baseDao) {
		m_baseDao = baseDao;
	}

	public int updateOrder(Order order) {
		return m_baseDao.update("order.update", order);
	}

}