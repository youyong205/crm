package com.user;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.Authority;
import com.Modules;
import com.Operation;
import com.PagedAction;
import com.log.Log;
import com.role.Role;
import com.role.RoleService;
import com.shop.Shop;

public class UserAction extends PagedAction {

	private static final long serialVersionUID = 4901652667413788534L;

	private Logger m_logger = Logger.getLogger(UserAction.class);

	private List<User> m_users;

	private int m_userId;

	private List<Shop> m_shops;

	private int m_shopId;

	@Autowired
	private UserService m_userService;

	@Autowired
	private RoleService m_roleService;

	private User m_user = new User();

	private Integer[] m_roleIdSelect =new Integer[100];

	private List<Role> m_roles;

	@Override
	public String getActionModule() {
		return Modules.s_user_module;
	}

	public Integer[] getRoleIdSelect() {
		return m_roleIdSelect;
	}

	public List<Role> getRoles() {
		return m_roles;
	}

	public User getUser() {
		return m_user;
	}

	public List<User> getUsers() {
		return m_users;
	}

	public void setRoleIdSelect(Integer[] roleIdSelect) {
		m_roleIdSelect = roleIdSelect;
	}

	public void setRoleService(RoleService roleService) {
		m_roleService = roleService;
	}

	public void setUser(User user) {
		m_user = user;
	}

	public void setUserId(int userId) {
		m_userId = userId;
	}

	public void setUserService(UserService userService) {
		m_userService = userService;
	}

	public String userAdd() {
		m_shops = queryShop();
		m_roles = m_roleService.queryLimitedRoles(0, Integer.MAX_VALUE);
		return SUCCESS;
	}

	public String userAddSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_user_module, Operation.s_operation_add));
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_user.getShopId())) {
			return Authority.NoAuth.getName();
		}
		try {
			int id = m_userService.insertUser(m_user);

			for (Integer temp : m_roleIdSelect) {
				if (temp > 0) {
					UserRole userRole = new UserRole();

					userRole.setRoleId(temp);
					userRole.setUserId(id);
					m_userService.insertUserRoles(userRole);
				}
			}
			if (id > 0) {
				Log log = createLog(Modules.s_user_module, Operation.s_operation_add, m_user);

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

	public String userDelete() {
		Authority auth = checkAuthority(buildResource(Modules.s_user_module, Operation.s_operation_delete));
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		}
		try {
			int count = m_userService.deleteUser(m_userId);
			if (count > 0) {
				Log log = createLog(Modules.s_user_module, Operation.s_operation_delete, m_userId);

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

	public String userList() {
		Authority auth = checkAuthority(buildResource(Modules.s_user_module, Operation.s_operation_detail));
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
			m_totalSize = m_userService.queryAllSize(m_shopId);
			m_totalPages = computeTotalPages(m_totalSize);
			int start = (m_index - 1) * SIZE;
			if (start < 0) {
				start = 0;
			}
			m_users = m_userService.queryLimitedUsers(start, SIZE,m_shopId);
			return SUCCESS;
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String userUpdate() {
		Authority auth = checkAuthority(buildResource(Modules.s_user_module, Operation.s_operation_update));

		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_shopId)) {
			return Authority.NoAuth.getName();
		}
		m_shops = queryShop();
		try {
			m_user = m_userService.findByPK(m_userId);
			m_roles = m_roleService.queryLimitedRoles(0, Integer.MAX_VALUE);
			List<UserRole> roles = m_userService.queryUserRoles(m_userId);

			m_roleIdSelect = new Integer[roles.size()];
			for (int i = 0; i < roles.size(); i++) {
				m_roleIdSelect[i] = roles.get(i).getRoleId();
			}
			if (m_user != null) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String userUpdateSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_user_module, Operation.s_operation_update));
		
		if (auth != null) {
			return auth.getName();
		}
		if (!checkShop(m_user.getShopId())) {
			return Authority.NoAuth.getName();
		}
		try {
			int count = m_userService.updateUser(m_user);
			m_userService.deleteUserRoles(m_user.getId());
			for (Integer temp : m_roleIdSelect) {
				if (temp > 0) {
					UserRole userRole = new UserRole();

					userRole.setRoleId(temp);
					userRole.setUserId(m_user.getId());
					m_userService.insertUserRoles(userRole);
				}
			}
			if (count > 0) {
				Log log = createLog(Modules.s_user_module, Operation.s_operation_update, m_user);

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

	public int getShopId() {
   	return m_shopId;
   }

	public void setShopId(int shopId) {
   	m_shopId = shopId;
   }

	public List<Shop> getShops() {
   	return m_shops;
   }
	
}