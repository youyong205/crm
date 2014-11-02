package com.user;

import java.util.List;

public interface UserService {

	public int deleteUser(int id);

	public int deleteUserRoles(int userId);

	public User findByNamePassword(String name, String password);

	public User findByPK(int id);

	public int insertUser(User user);

	public void insertUserRoles(UserRole userRole);

	public int queryAllSize();

	public List<User> queryLimitedUsers(int start, int size);

	public List<UserRole> queryUserRoles(int userId);

	public int updateUser(User user);

}
