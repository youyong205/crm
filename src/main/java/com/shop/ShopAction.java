package com.shop;

import java.util.List;

import org.apache.log4j.Logger;

import com.Authority;
import com.Modules;
import com.Operation;
import com.PagedAction;
import com.log.Log;
import com.user.User;

public class ShopAction extends PagedAction {

	private static final long serialVersionUID = 4901652667413788534L;

	private Logger m_logger = Logger.getLogger(ShopAction.class);

	private List<Shop> m_shops;

	private int m_shopId;

	private Shop m_shop = new Shop();

	@Override
	public String getActionModule() {
		return Modules.s_shop_module;
	}

	public Shop getShop() {
		return m_shop;
	}

	public List<Shop> getShops() {
		return m_shops;
	}

	public String shopAdd() {
		return SUCCESS;
	}

	public String shopAddSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_shop_module, Operation.s_operation_add));
		if (auth != null) {
			return auth.getName();
		}
		try {
			User user = queryUserInfo();
			m_shop.setBossId(user.getId());
			int id = m_shopService.insertShop(m_shop);
			if (id > 0) {
				Log log = createLog(Modules.s_shop_module, Operation.s_operation_add, m_shop);

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

	public String shopDelete() {
		Authority auth = checkAuthority(buildResource(Modules.s_shop_module, Operation.s_operation_delete));
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		};
		try {
			int count = m_shopService.deleteShop(m_shopId);
			if (count > 0) {
				Log log = createLog(Modules.s_shop_module, Operation.s_operation_delete, m_shopId);

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

	public String shopList() {
		Authority auth = checkAuthority(buildResource(Modules.s_shop_module, Operation.s_operation_detail));
		if (auth != null) {
			return auth.getName();
		}
		User user = queryUserInfo();
		int bossId = user.getId();

		try {
			m_totalSize = m_shopService.queryAllSize(bossId);
			m_totalPages = computeTotalPages(m_totalSize);
			int start = (m_index - 1) * SIZE;
			
			if (start < 0) {
				start = 0;
			}
			m_shops = queryShop();
			return SUCCESS;
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String shopUpdate() {
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		};
		try {
			m_shop = m_shopService.findByPK(m_shopId);
			if (m_shop != null) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String shopUpdateSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_shop_module, Operation.s_operation_update));
		
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shop.getId())) {
			return Authority.NoAuth.getName();
		};
		try {
			int count = m_shopService.updateShop(m_shop);
			if (count > 0) {
				Log log = createLog(Modules.s_shop_module, Operation.s_operation_update, m_shop);

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

	public void setShop(Shop shop) {
		m_shop = shop;
	}

	public void setShopId(int shopId) {
		m_shopId = shopId;
	}

	public void setShopService(ShopService shopService) {
		m_shopService = shopService;
	}
}