package com.user;

import java.util.Date;
import java.util.Map;

import com.resource.Resource;

public class User {

	private int m_id;

	private String m_userName;

	private String m_password;

	private String m_realName;

	private int m_role;

	private Date m_creationDate;

	private Date m_modifyDate;

	private Map<String, Resource> m_resources;

	public static final int ADMIN = 1;

	public static final int OPERATOR = 2;

	public static final int ORDINARY = 3;

	public Date getCreationDate() {
		return m_creationDate;
	}

	public int getId() {
		return m_id;
	}

	public Date getModifyDate() {
		return m_modifyDate;
	}

	public String getPassword() {
		return m_password;
	}

	public String getRealName() {
		return m_realName;
	}

	public Map<String, Resource> getResources() {
		return m_resources;
	}

	public int getRole() {
		return m_role;
	}

	public String getUserName() {
		return m_userName;
	}

	public void setCreationDate(Date creationDate) {
		m_creationDate = creationDate;
	}

	public void setId(int id) {
		m_id = id;
	}

	public void setModifyDate(Date modifyDate) {
		m_modifyDate = modifyDate;
	}

	public void setPassword(String password) {
		m_password = password;
	}

	public void setRealName(String realName) {
		m_realName = realName;
	}

	public void setResources(Map<String, Resource> resources) {
		m_resources = resources;
	}

	public void setRole(int role) {
		m_role = role;
	}

	public void setUserName(String userName) {
		m_userName = userName;
	}

	@Override
	public String toString() {
		return "User [m_id=" + m_id + ", m_userName=" + m_userName + ", m_password=" + m_password + ", m_realName="
		      + m_realName + ", m_role=" + m_role + "]";
	}

}
