package com.menu;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.Authority;
import com.Modules;
import com.Operation;
import com.PagedAction;
import com.log.Log;
import com.shop.Shop;
import com.shop.ShopService;
import com.user.User;

public class MenuAction extends PagedAction {

	private static final long serialVersionUID = 4901652667413788534L;

	private Logger m_logger = Logger.getLogger(MenuAction.class);

	private List<Menu> m_menus;

	private List<Shop> m_shops;

	private int m_menuId;

	private int m_shopId;

	@Autowired
	private MenuService m_menuService;

	private Menu m_menu = new Menu();

	@Override
	public String getActionModule() {
		return Modules.s_menu_module;
	}

	public Menu getMenu() {
		return m_menu;
	}

	public List<Menu> getMenus() {
		return m_menus;
	}

	public String menuAdd() {
		Authority auth = checkAuthority(buildResource(Modules.s_menu_module, Operation.s_operation_add));

		if (auth != null) {
			return auth.getName();
		}
		m_shops = queryShop();
		return SUCCESS;
	}

	public List<Shop> queryShop() {
		User user = queryUserInfo();
		int userId = user.getId();

		if (isAdmin(user.getUserName())) {
			userId = 0;
		}
		List<Shop> shops = m_shopService.queryLimitedShops(0, Integer.MAX_VALUE, userId);

		return shops;
	}

	public String menuAddSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_menu_module, Operation.s_operation_add));
		if (auth != null) {
			return auth.getName();
		}
		try {
			int id = m_menuService.insertMenu(m_menu);
			if (id > 0) {
				Log log = createLog(Modules.s_menu_module, Operation.s_operation_add, m_menu);

				m_logService.insertLog(log);
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String menuDelete() {
		Authority auth = checkAuthority(buildResource(Modules.s_menu_module, Operation.s_operation_delete));
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		}
		try {
			int count = m_menuService.deleteMenu(m_menuId);
			if (count > 0) {
				Log log = createLog(Modules.s_menu_module, Operation.s_operation_delete, m_menuId);

				m_logService.insertLog(log);
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String menuList() {
		Authority auth = checkAuthority(buildResource(Modules.s_menu_module, Operation.s_operation_detail));
		if (auth != null) {
			return auth.getName();
		}
		try {
			m_shops = queryShop();

			if (m_shopId == 0 && m_shops.size() > 0) {
				m_shopId = m_shops.get(0).getId();
			}
			if (!checkShop(m_shopId)) {
				return Authority.NoAuth.getName();
			}
			m_totalSize = m_menuService.queryAllSize(m_shopId);
			m_totalPages = computeTotalPages(m_totalSize);
			int start = (m_index - 1) * SIZE;
			if (start < 0) {
				start = 0;
			}
			m_menus = m_menuService.queryLimitedMenus(start, SIZE, m_shopId);
			return SUCCESS;
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String menuUpdate() {
		Authority auth = checkAuthority(buildResource(Modules.s_menu_module, Operation.s_operation_update));

		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		}
		m_shops = queryShop();

		try {
			m_menu = m_menuService.findByPK(m_menuId);
			if (m_menu != null) {
				if (!checkShop(m_menu.getShopId())) {
					return Authority.NoAuth.getName();
				}
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String menuUpdateSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_menu_module, Operation.s_operation_update));
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_menu.getShopId())) {
			return Authority.NoAuth.getName();
		}
		;
		try {
			int count = m_menuService.updateMenu(m_menu);
			if (count > 0) {
				Log log = createLog(Modules.s_menu_module, Operation.s_operation_update, m_menu);

				m_logService.insertLog(log);
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public void setMenu(Menu menu) {
		m_menu = menu;
	}

	public void setMenuId(int menuId) {
		m_menuId = menuId;
	}

	public void setMenuService(MenuService menuService) {
		m_menuService = menuService;
	}

	public void setShopService(ShopService shopService) {
		m_shopService = shopService;
	}

	public List<Shop> getShops() {
		return m_shops;
	}

	public int getShopId() {
		return m_shopId;
	}

	public void setShopId(int shopId) {
		m_shopId = shopId;
	}

}