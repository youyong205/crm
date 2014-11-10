package com;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.log.Log;
import com.log.LogService;
import com.opensymphony.xwork2.ActionSupport;
import com.shop.Shop;
import com.shop.ShopService;
import com.user.User;

public abstract class PagedAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = -5988620023728972001L;

	protected int m_totalPages;

	protected int m_totalSize;

	protected int m_index = 1;

	protected static final int SIZE = 25;

	public static final int s_half_size = 3;

	@Autowired
	protected LogService m_logService;

	@Autowired
	protected ShopService m_shopService;

	protected Map<String, Object> m_session;

	protected String m_requestUrl;

	protected SimpleDateFormat m_sdf = new SimpleDateFormat("yyyy-MM-dd");

	private List<String> m_modules = new ArrayList<String>(Arrays.asList(Modules.s_user_module, Modules.s_role_module,
	      Modules.s_resource_module, Modules.s_log_module, Modules.s_shop_module, Modules.s_report_module));

	public String buildResource(String module, String oper) {
		return module + ":" + oper;
	}

	public boolean checkShop(int shopId) {
		User user = queryUserInfo();
		int userId = user.getId();

		if (isAdmin(user.getUserName())) {
			userId = 0;
		}
		List<Shop> shops = m_shopService.queryLimitedShops(0, Integer.MAX_VALUE, userId);

		for (Shop shop : shops) {
			if (shop.getId() == shopId) {
				return true;
			}
		}
		if (user.getShopId() == shopId) {
			return true;
		}
		return false;
	}

	public List<Shop> queryShop() {
		User user = queryUserInfo();
		int userId = user.getId();

		if (isAdmin(user.getUserName())) {
			userId = 0;
		}
		List<Shop> shops = m_shopService.queryLimitedShops(0, Integer.MAX_VALUE, userId);

		int shopId = user.getShopId();

		if (shopId > 0) {
			shops.add(m_shopService.findByPK(shopId));
		}
		return shops;
	}

	public Authority checkAuthority(String resources) {
		User user = queryUserInfo();
		Authority auth = null;

		if (user == null) {
			auth = Authority.Login;
		} else {
			if (!user.getResources().containsKey(resources)) {
				auth = Authority.NoAuth;
			}
		}
		if (auth != null) {
			HttpServletRequest request = ServletActionContext.getRequest();
			String queryString = request.getQueryString();
			String requestURI = request.getRequestURI();
			int index = requestURI.lastIndexOf('/');

			m_requestUrl = requestURI.substring(index + 1);
			if (queryString != null) {
				m_requestUrl = m_requestUrl + '?' + queryString;
			}
		}
		return auth;
	}

	public boolean isAdmin(String userName) {
		return "yong.you".equals(userName);
	}

	public int computeTotalPages(int totalSize) {
		return (int) Math.ceil(totalSize * 1.0 / SIZE);
	}

	public int computeTotalPages(int totalSize, int pageSize) {
		return (int) Math.ceil(totalSize * 1.0 / pageSize);
	}

	public Date convertToDate(Cell cell) throws ParseException {
		if (cell.getType() == CellType.DATE) {
			DateCell dateCell = (DateCell) cell;
			return dateCell.getDate();
		} else {
			return m_sdf.parse(cell.getContents());
		}
	}

	public double convertToDouble(Cell cell) {
		return Double.parseDouble(cell.getContents());
	}

	public int convertToInteger(Cell cell) {
		return Integer.parseInt(cell.getContents());
	}

	public String convertToString(Cell cell) {
		return cell.getContents();
	}

	public Log createLog(String module, String operation, Object content) {
		Log log = new Log();

		log.setModule(module);
		log.setOperation(operation);
		log.setDetail(content.toString());

		User user = queryUserInfo();
		if (user != null) {
			log.setUserId(user.getId());
		}
		return log;
	}

	public abstract String getActionModule();

	public int getIndex() {
		return m_index;
	}

	public List<String> getModules() {
		return m_modules;
	}

	public List<Integer> getPageIndexs() {
		List<Integer> indexs = new ArrayList<Integer>();
		int start = m_index - s_half_size - 1;
		int end = m_index + s_half_size;

		if (start < 1) {
			start = 1;
			end = 2 + 2 * s_half_size;
		} else if (end > m_totalPages) {
			end = m_totalPages;
			start = m_totalPages - s_half_size * 2 - 1;
		}

		for (; start <= end; start++) {
			if (start >= 1 && start <= m_totalPages) {
				indexs.add(start);
			}
		}
		return indexs;
	}

	public String getRequestUrl() {
		return m_requestUrl;
	}

	public int getTotalPages() {
		return m_totalPages;
	}

	public int getTotalSize() {
		return m_totalSize;
	}

	public User queryUserInfo() {
		Object object = m_session.get("user");

		if (object != null) {
			return (User) object;
		} else {
			return null;
		}
	}

	public void setIndex(int index) {
		m_index = index;
	}

	public void setLogService(LogService logService) {
		m_logService = logService;
	}

	public void setRequestUrl(String requestUrl) {
		m_requestUrl = requestUrl;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		m_session = session;
	}

	public void setShopService(ShopService shopService) {
		m_shopService = shopService;
	}

}
