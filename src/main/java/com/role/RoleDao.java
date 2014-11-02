package com.role;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.BaseDao;

public class RoleDao {

	@Autowired
	private BaseDao m_baseDao;

	public int deleteRole(int id) {
		return m_baseDao.delete("role.delete", id);
	}

	public int deleteRoleResources(int roleId) {
		return m_baseDao.delete("roleResource.deleteByRoleId", roleId);
	}

	public Role findByPK(int id) {
		return (Role) m_baseDao.queryForObject("role.findById", id);
	}

	public int insertRole(Role role) {
		return (Integer) m_baseDao.insert("role.insert", role);
	}

	public void insertRoleResources(RoleResource roleResource) {
		m_baseDao.insert("roleResource.insert", roleResource);
	}

	@SuppressWarnings("rawtypes")
	public List queryAllRoles() {
		return m_baseDao.queryForList("role.queryAllRoles");
	}

	public int queryAllSize() {
		return (Integer) m_baseDao.queryForObject("role.queryAllSize", null);
	}

	@SuppressWarnings("rawtypes")
	public List queryLimitedRoles(int start, int size) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("start", start);
		parameters.put("size", size);

		return m_baseDao.queryForList("role.queryLimitedRoles", parameters);
	}

	@SuppressWarnings("rawtypes")
	public List queryRoleResources(int roleId) {
		return m_baseDao.queryForList("roleResource.queryRoleResources", roleId);
	}

	public void setBaseDao(BaseDao baseDao) {
		m_baseDao = baseDao;
	}

	public int updateRole(Role role) {
		return m_baseDao.update("role.update", role);
	}

}
