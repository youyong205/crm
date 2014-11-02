package com.order;

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

public class OrderAction extends PagedAction {

	private static final long serialVersionUID = 4901652667413788534L;

	private Logger m_logger = Logger.getLogger(OrderAction.class);

	private List<Order> m_orders;

	private List<Shop> m_shops;

	private int m_orderId;

	private int m_shopId;

	@Autowired
	private OrderService m_orderService;

	private Order m_order = new Order();

	@Override
	public String getActionModule() {
		return Modules.s_order_model;
	}

	public Order getOrder() {
		return m_order;
	}

	public List<Order> getOrders() {
		return m_orders;
	}

	public String orderAdd() {
		Authority auth = checkAuthority(buildResource(Modules.s_order_model, Operation.s_operation_add));

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

	public String orderAddSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_order_model, Operation.s_operation_add));
		if (auth != null) {
			return auth.getName();
		}
		try {
			int id = m_orderService.insertOrder(m_order);
			if (id > 0) {
				Log log = createLog(Modules.s_order_model, Operation.s_operation_add, m_order);

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

	public String orderDelete() {
		Authority auth = checkAuthority(buildResource(Modules.s_order_model, Operation.s_operation_delete));
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		}
		try {
			int count = m_orderService.deleteOrder(m_orderId);
			if (count > 0) {
				Log log = createLog(Modules.s_order_model, Operation.s_operation_delete, m_orderId);

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

	public String orderList() {
		Authority auth = checkAuthority(buildResource(Modules.s_order_model, Operation.s_operation_detail));
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
			m_totalSize = m_orderService.queryAllSize(m_shopId);
			m_totalPages = computeTotalPages(m_totalSize);
			int start = (m_index - 1) * SIZE;
			if (start < 0) {
				start = 0;
			}
			m_orders = m_orderService.queryLimitedOrders(start, SIZE, m_shopId);
			return SUCCESS;
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String orderUpdate() {
		Authority auth = checkAuthority(buildResource(Modules.s_order_model, Operation.s_operation_update));

		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		}
		m_shops = queryShop();

		try {
			m_order = m_orderService.findByPK(m_orderId);
			if (m_order != null) {
				if (!checkShop(m_order.getShopId())) {
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

	public String orderUpdateSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_order_model, Operation.s_operation_update));
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_order.getShopId())) {
			return Authority.NoAuth.getName();
		}
		try {
			int count = m_orderService.updateOrder(m_order);
			if (count > 0) {
				Log log = createLog(Modules.s_order_model, Operation.s_operation_update, m_order);

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

	public void setOrder(Order order) {
		m_order = order;
	}

	public void setOrderId(int orderId) {
		m_orderId = orderId;
	}

	public void setOrderService(OrderService orderService) {
		m_orderService = orderService;
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