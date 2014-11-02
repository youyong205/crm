package com.shop;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao m_shopDao;

	private Logger m_logger = Logger.getLogger(ShopServiceImpl.class);

	@Override
	public int deleteShop(int id) {
		try {
			return m_shopDao.deleteShop(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public Shop findByPK(int id) {
		try {
			return m_shopDao.findByPK(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public int insertShop(Shop shop) {
		try {
			return m_shopDao.insertShop(shop);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Shop> queryAllShops() {
		try {
			return m_shopDao.queryAllShops();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Shop>();
		}
	}

	@Override
	public int queryAllSize(int bossId) {
		try {
			return m_shopDao.queryAllSize(bossId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Shop> queryLimitedShops(int start, int size,int bossId) {
		try {
			return m_shopDao.queryLimitedShops(start, size,bossId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Shop>();
		}
	}

	public void setShopDao(ShopDao shopDao) {
		m_shopDao = shopDao;
	}

	@Override
	public int updateShop(Shop shop) {
		try {
			return m_shopDao.updateShop(shop);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

}
