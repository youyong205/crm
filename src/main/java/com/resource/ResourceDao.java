package com.resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.BaseDao;

public class ResourceDao {

	@Autowired
	private BaseDao m_baseDao;

	public int deleteResource(int id) {
		return m_baseDao.delete("resource.delete", id);
	}

	public Resource findByNamePassword(String resourceName, String password) {
		Map<String, String> pars = new HashMap<String, String>();

		pars.put("resourceName", resourceName);
		pars.put("password", password);
		return (Resource) m_baseDao.queryForObject("resource.findByName", pars);
	}

	public Resource findByPK(int id) {
		return (Resource) m_baseDao.queryForObject("resource.findById", id);
	}

	public int insertResource(Resource resource) {
		return (Integer) m_baseDao.insert("resource.insert", resource);
	}

	@SuppressWarnings("rawtypes")
	public List queryAllResources() {
		return m_baseDao.queryForList("resource.queryAllResources");
	}

	public int queryAllSize() {
		return (Integer) m_baseDao.queryForObject("resource.queryAllSize", null);
	}

	@SuppressWarnings("rawtypes")
	public List queryLimitedResources(int start, int size) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("start", start);
		parameters.put("size", size);

		return m_baseDao.queryForList("resource.queryLimitedResources", parameters);
	}

	public void setBaseDao(BaseDao baseDao) {
		m_baseDao = baseDao;
	}

	public int updateResource(Resource resource) {
		return m_baseDao.update("resource.update", resource);
	}

}
