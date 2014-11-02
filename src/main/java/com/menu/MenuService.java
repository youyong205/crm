package com.menu;

import java.util.List;

public interface MenuService {

	public int deleteMenu(int id);

	public Menu findByPK(int id);

	public int insertMenu(Menu menu);

	public int queryAllSize(int shopId);

	public List<Menu> queryLimitedMenus(int start, int size,int shopId);

	public int updateMenu(Menu menu);

}
