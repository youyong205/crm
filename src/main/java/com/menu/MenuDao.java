package com.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.BaseDao;

public class MenuDao {

	@Autowired
	private BaseDao m_baseDao;

	public int deleteMenu(int id) {
		return m_baseDao.delete("menu.delete", id);
	}

	public Menu findByNamePassword(String menuName, String password) {
		Map<String, String> pars = new HashMap<String, String>();

		pars.put("menuName", menuName);
		pars.put("password", password);
		return (Menu) m_baseDao.queryForObject("menu.findByName", pars);
	}

	public Menu findByPK(int id) {
		return (Menu) m_baseDao.queryForObject("menu.findById", id);
	}

	public int insertMenu(Menu menu) {
		return (Integer) m_baseDao.insert("menu.insert", menu);
	}

	@SuppressWarnings("rawtypes")
	public List queryAllMenus() {
		return m_baseDao.queryForList("menu.queryAllMenus");
	}

	public int queryAllSize(int shopId) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("shopId", shopId);
		return (Integer) m_baseDao.queryForObject("menu.queryAllSize", parameters);
	}

	@SuppressWarnings("rawtypes")
	public List queryLimitedMenus(int start, int size,int shopId) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("start", start);
		parameters.put("size", size);
		parameters.put("shopId", shopId);

		return m_baseDao.queryForList("menu.queryLimitedMenus", parameters);
	}

	public void setBaseDao(BaseDao baseDao) {
		m_baseDao = baseDao;
	}

	public int updateMenu(Menu menu) {
		return m_baseDao.update("menu.update", menu);
	}

}
