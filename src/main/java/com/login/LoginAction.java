package com.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.Modules;
import com.PagedAction;
import com.resource.Resource;
import com.resource.ResourceService;
import com.role.RoleResource;
import com.role.RoleService;
import com.user.User;
import com.user.UserRole;
import com.user.UserService;

public class LoginAction extends PagedAction {

	private static final long serialVersionUID = 362224844795605039L;

	private Logger m_logger = Logger.getLogger(LoginAction.class);

	private String m_userName;

	private String m_password;

	@Autowired
	private UserService m_userService;

	@Autowired
	private RoleService m_roleService;

	@Autowired
	private ResourceService m_resourceService;

	private String m_role;

	private static final String USER = "user";

	public static final String s_login_error = "用户名密码输入错误";

	@Override
	public String getActionModule() {
		return Modules.s_user_module;
	}

	public String login() {
		User user = m_userService.findByNamePassword(m_userName, m_password);

		if (user != null) {
			Map<String, Resource> resources = new HashMap<String, Resource>();

			if (isAdmin(m_userName)) {
				List<Resource> all = m_resourceService.queryLimitedResources(0, Integer.MAX_VALUE);

				for (Resource resource : all) {
					String key = resource.getModule() + ":" + resource.getName();
					resources.put(key, resource);
				}
			}

			int userId = user.getId();
			List<UserRole> userRoles = m_userService.queryUserRoles(userId);

			for (UserRole userRole : userRoles) {
				int roleId = userRole.getRoleId();
				List<RoleResource> res = m_roleService.queryRoleResources(roleId);

				for (RoleResource temp : res) {
					Resource resource = m_resourceService.findByPK(temp.getResourceId());

					if (resource != null) {
						String key = resource.getModule() + ":" + resource.getName();

						resources.put(key, resource);
					}
				}
			}
			user.setResources(resources);
			m_session.put(USER, user);
			m_logger.info(String.format("User %s login", user.getRealName()));

			if (m_requestUrl != null && m_requestUrl.length() > 0) {
				if ("user".equals(m_role)) {
					return "userRedirect";
				} else {
					return "adminRedirect";
				}
			}
			if (m_role != null) {
				return m_role;
			} else {
				return SUCCESS;
			}
		} else {
			this.addActionError(s_login_error);
			if (m_role == null) {
				return m_role + "Error";
			} else {
				return "userError";
			}
		}
	}

	public String logout() {
		User user = (User) m_session.remove(USER);

		if (user != null) {
			m_logger.info(String.format("User %s login out", user.getRealName()));
		}
		if (m_role != null) {
			return m_role;
		} else {
			return SUCCESS;
		}
	}

	public void setPassword(String password) {
		m_password = password;
	}

	public void setResourceService(ResourceService resourceService) {
		m_resourceService = resourceService;
	}

	public void setRole(String role) {
		m_role = role;
	}

	public void setRoleService(RoleService roleService) {
		m_roleService = roleService;
	}

	public void setUserName(String userName) {
		m_userName = userName;
	}

	public void setUserService(UserService userService) {
		m_userService = userService;
	}

}