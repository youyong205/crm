package com.menu;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao m_menuDao;

	private Logger m_logger = Logger.getLogger(MenuServiceImpl.class);

	@Override
	public int deleteMenu(int id) {
		try {
			return m_menuDao.deleteMenu(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public Menu findByPK(int id) {
		try {
			return m_menuDao.findByPK(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public int insertMenu(Menu menu) {
		try {
			return m_menuDao.insertMenu(menu);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Menu> queryAllMenus() {
		try {
			return m_menuDao.queryAllMenus();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Menu>();
		}
	}

	@Override
	public int queryAllSize(int shopId) {
		try {
			return m_menuDao.queryAllSize(shopId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Menu> queryLimitedMenus(int start, int size,int shopId) {
		try {
			return m_menuDao.queryLimitedMenus(start, size,shopId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Menu>();
		}
	}

	public void setMenuDao(MenuDao menuDao) {
		m_menuDao = menuDao;
	}

	@Override
	public int updateMenu(Menu menu) {
		try {
			return m_menuDao.updateMenu(menu);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

}
