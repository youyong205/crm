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
	
	public int queryAllSize(int shopId);

	public List<User> queryLimitedUsers(int start, int size,int shopId);

	public List<UserRole> queryUserRoles(int userId);
	
	

	public int updateUser(User user);

}
