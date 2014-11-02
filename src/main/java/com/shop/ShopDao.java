package com.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.BaseDao;

public class ShopDao {

	@Autowired
	private BaseDao m_baseDao;

	public int deleteShop(int id) {
		return m_baseDao.delete("shop.delete", id);
	}

	public Shop findByPK(int id) {
		return (Shop) m_baseDao.queryForObject("shop.findById", id);
	}

	public int insertShop(Shop shop) {
		return (Integer) m_baseDao.insert("shop.insert", shop);
	}

	@SuppressWarnings("rawtypes")
	public List queryAllShops() {
		return m_baseDao.queryForList("shop.queryAllShops");
	}

	public int queryAllSize(int bossId) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("bossId", bossId);
		return (Integer) m_baseDao.queryForObject("shop.queryAllSize", parameters);
	}

	@SuppressWarnings("rawtypes")
	public List queryLimitedShops(int start, int size,int bossId) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("start", start);
		parameters.put("size", size);
		parameters.put("bossId", bossId);
		
		return m_baseDao.queryForList("shop.queryLimitedShops", parameters);
	}

	public void setBaseDao(BaseDao baseDao) {
		m_baseDao = baseDao;
	}

	public int updateShop(Shop shop) {
		return m_baseDao.update("shop.update", shop);
	}

}
