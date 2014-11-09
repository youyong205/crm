package com.user;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao m_userDao;

	private Logger m_logger = Logger.getLogger(UserServiceImpl.class);

	@Override
	public int deleteUser(int id) {
		try {
			return m_userDao.deleteUser(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public int deleteUserRoles(int userId) {
		try {
			return m_userDao.deleteUserRoles(userId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public User findByNamePassword(String name, String password) {
		try {
			return m_userDao.findByNamePassword(name, password);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public User findByPK(int id) {
		try {
			return m_userDao.findByPK(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public int insertUser(User user) {
		try {
			return m_userDao.insertUser(user);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public void insertUserRoles(UserRole userRole) {
		try {
			m_userDao.insertUserRoles(userRole);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
		}
	}

	@Override
	public int queryAllSize() {
		try {
			return m_userDao.queryAllSize();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	public List<User> queryAllUsers() {
		try {
			return m_userDao.queryAllUsers();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<User>();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryLimitedUsers(int start, int size) {
		try {
			return m_userDao.queryLimitedUsers(start, size);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<User>();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserRole> queryUserRoles(int userId) {
		try {
			return m_userDao.queryUserRoles(userId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
		}
		return new ArrayList<UserRole>();
	}

	public void setUserDao(UserDao userDao) {
		m_userDao = userDao;
	}

	@Override
	public int updateUser(User user) {
		try {
			return m_userDao.updateUser(user);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
   public int queryAllSize(int shopId) {
		try {
			return m_userDao.queryAllSize(shopId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
   }

	@SuppressWarnings("unchecked")
   @Override
   public List<User> queryLimitedUsers(int start, int size, int shopId) {
		try {
			return m_userDao.queryLimitedUsers(start, size,shopId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<User>();
		}
   }

}
