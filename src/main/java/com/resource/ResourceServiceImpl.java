package com.resource;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceDao m_resourceDao;

	private Logger m_logger = Logger.getLogger(ResourceServiceImpl.class);

	@Override
	public int deleteResource(int id) {
		try {
			return m_resourceDao.deleteResource(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public Resource findByPK(int id) {
		try {
			return m_resourceDao.findByPK(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public int insertResource(Resource resource) {
		try {
			return m_resourceDao.insertResource(resource);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Resource> queryAllResources() {
		try {
			return m_resourceDao.queryAllResources();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Resource>();
		}
	}

	@Override
	public int queryAllSize() {
		try {
			return m_resourceDao.queryAllSize();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Resource> queryLimitedResources(int start, int size) {
		try {
			return m_resourceDao.queryLimitedResources(start, size);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Resource>();
		}
	}

	public void setResourceDao(ResourceDao resourceDao) {
		m_resourceDao = resourceDao;
	}

	@Override
	public int updateResource(Resource resource) {
		try {
			return m_resourceDao.updateResource(resource);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

}
