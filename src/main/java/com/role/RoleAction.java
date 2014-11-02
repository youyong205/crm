package com.role;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.Authority;
import com.Modules;
import com.Operation;
import com.PagedAction;
import com.log.Log;
import com.resource.Resource;
import com.resource.ResourceService;

public class RoleAction extends PagedAction {

	private static final long serialVersionUID = 4901652667413788534L;

	private Logger m_logger = Logger.getLogger(RoleAction.class);

	private List<Role> m_roles;

	private int m_roleId;

	@Autowired
	private RoleService m_roleService;

	@Autowired
	private ResourceService m_resourceService;

	private Role m_role = new Role();

	private Integer[] m_resourceIdSelect ;

	private Map<String, ModuleResources> m_moduleResources = new LinkedHashMap<String, ModuleResources>();

	private void buildModuleResources(List<Resource> resources) {
		for (Resource res : resources) {
			String module = res.getModule();
			ModuleResources moduleResources = findOrCreateModuleResources(module);

			Map<Integer, Resource> moduleResource = moduleResources.getResourcesMap();

			if (moduleResource == null) {
				moduleResource = new HashMap<Integer, Resource>();
				moduleResources.setResources(moduleResource);
			}
			moduleResource.put(res.getId(), res);
		}
	}

	private void buildModuleSelectedResources(List<RoleResource> selectedResources) {
		m_resourceIdSelect = new Integer[selectedResources.size()];

		Map<Integer, RoleResource> selectedResourcesMap = new HashMap<Integer, RoleResource>();
		for (RoleResource roleResource : selectedResources) {
			selectedResourcesMap.put(roleResource.getResourceId(), roleResource);
		}

		for (Entry<String, ModuleResources> entry : m_moduleResources.entrySet()) {
			ModuleResources value = entry.getValue();
			List<Resource> res = value.getResources();

			for (Resource temp : res) {
				int id = temp.getId();

				if (selectedResourcesMap.containsKey(id)) {
					temp.setChecked(true);
				}
			}
		}
	}

	private ModuleResources findOrCreateModuleResources(String module) {
		ModuleResources moduleResources = m_moduleResources.get(module);

		if (moduleResources == null) {
			moduleResources = new ModuleResources();
			moduleResources.setModule(module);
			m_moduleResources.put(module, moduleResources);
		}
		return moduleResources;
	}

	@Override
	public String getActionModule() {
		return Modules.s_role_module;
	}

	public Map<String, ModuleResources> getModuleResources() {
		return m_moduleResources;
	}

	public Integer[] getResourceIdSelect() {
		return m_resourceIdSelect;
	}

	public ResourceService getResourceService() {
		return m_resourceService;
	}

	public Role getRole() {
		return m_role;
	}

	public List<Role> getRoles() {
		return m_roles;
	}

	public String roleAdd() {
		List<Resource> resources = m_resourceService.queryLimitedResources(0, Integer.MAX_VALUE);

		buildModuleResources(resources);
		return SUCCESS;
	}

	public String roleAddSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_role_module, Operation.s_operation_add));
		if (auth != null) {
			return auth.getName();
		}
		try {
			int id = m_roleService.insertRole(m_role);
			for (Integer temp : m_resourceIdSelect) {
				if (temp > 0) {
					RoleResource roleResource = new RoleResource();

					roleResource.setRoleId(m_role.getId());
					roleResource.setResourceId(temp);
					m_roleService.insertRoleResources(roleResource);
				}
			}
			if (id > 0) {
				Log log = createLog(Modules.s_role_module, Operation.s_operation_add, m_role);

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

	public String roleDelete() {
		Authority auth = checkAuthority(buildResource(Modules.s_role_module, Operation.s_operation_delete));
		if (auth != null) {
			return auth.getName();
		}
		try {
			int count = m_roleService.deleteRole(m_roleId);
			if (count > 0) {
				Log log = createLog(Modules.s_role_module, Operation.s_operation_delete, m_roleId);

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

	public String roleList() {
		Authority auth = checkAuthority(buildResource(Modules.s_role_module, Operation.s_operation_detail));
		if (auth != null) {
			return auth.getName();
		}
		try {
			m_totalSize = m_roleService.queryAllSize();
			m_totalPages = computeTotalPages(m_totalSize);
			int start = (m_index - 1) * SIZE;
			if (start < 0) {
				start = 0;
			}
			m_roles = m_roleService.queryLimitedRoles(start, SIZE);
			return SUCCESS;
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String roleUpdate() {
		try {
			List<Resource> resources = m_resourceService.queryLimitedResources(0, Integer.MAX_VALUE);
			List<RoleResource> selectedResources = m_roleService.queryRoleResources(m_roleId);

			buildModuleResources(resources);
			buildModuleSelectedResources(selectedResources);
			m_role = m_roleService.findByPK(m_roleId);
			if (m_role != null) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String roleUpdateSubmit() {
		Authority auth = checkAuthority(buildResource(Modules.s_role_module, Operation.s_operation_update));
		if (auth != null) {
			return auth.getName();
		}
		try {
			int count = m_roleService.updateRole(m_role);
			m_roleService.deleteRoleResources(m_role.getId());
			for (Integer temp : m_resourceIdSelect) {
				if (temp > 0) {
					RoleResource roleResource = new RoleResource();

					roleResource.setRoleId(m_role.getId());
					roleResource.setResourceId(temp);
					m_roleService.insertRoleResources(roleResource);
				}
			}
			if (count > 0) {
				Log log = createLog(Modules.s_role_module, Operation.s_operation_update, m_role);

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

	public void setResourceIdSelect(Integer[] resourceIdSelect) {
		m_resourceIdSelect = resourceIdSelect;
	}

	public void setResourceService(ResourceService resourceService) {
		m_resourceService = resourceService;
	}

	public void setRole(Role role) {
		m_role = role;
	}

	public void setRoleId(int roleId) {
		m_roleId = roleId;
	}

	public void setRoleService(RoleService roleService) {
		m_roleService = roleService;
	}

	public static class ModuleResources {

		private Map<Integer, Resource> m_resources;

		private String m_module;

		public String getModule() {
			return m_module;
		}

		public List<Resource> getResources() {
			return new ArrayList<Resource>(m_resources.values());
		}

		public Map<Integer, Resource> getResourcesMap() {
			return m_resources;
		}

		public void setModule(String module) {
			m_module = module;
		}

		public void setResources(Map<Integer, Resource> resources) {
			m_resources = resources;
		}
	}

}