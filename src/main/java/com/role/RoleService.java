package com.role;

import java.util.List;

public interface RoleService {

	public int deleteRole(int id);

	public int deleteRoleResources(int roleId);

	public Role findByPK(int id);

	public int insertRole(Role role);

	public void insertRoleResources(RoleResource roleResource);

	public int queryAllSize();

	public List<Role> queryLimitedRoles(int start, int size);

	public List<RoleResource> queryRoleResources(int roleId);

	public int updateRole(Role role);

}
