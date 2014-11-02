package com.resource;

import java.util.Date;

public class Resource {

	private int m_id;

	private String m_module;

	private String m_name;

	private String m_des;

	private Date m_creationDate;

	private Date m_modifyDate;

	private boolean m_checked;

	public Date getCreationDate() {
		return m_creationDate;
	}

	public String getDes() {
		return m_des;
	}

	public int getId() {
		return m_id;
	}

	public Date getModifyDate() {
		return m_modifyDate;
	}

	public String getModule() {
		return m_module;
	}

	public String getName() {
		return m_name;
	}

	public boolean isChecked() {
		return m_checked;
	}

	public void setChecked(boolean checked) {
		m_checked = checked;
	}

	public void setCreationDate(Date creationDate) {
		m_creationDate = creationDate;
	}

	public void setDes(String des) {
		m_des = des;
	}

	public void setId(int id) {
		m_id = id;
	}

	public void setModifyDate(Date modifyDate) {
		m_modifyDate = modifyDate;
	}

	public void setModule(String module) {
		m_module = module;
	}

	public void setName(String name) {
		m_name = name;
	}

}
