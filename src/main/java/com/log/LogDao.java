package com.log;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.BaseDao;

public class LogDao {

	private BaseDao m_baseDao;

	public int deleteLog(int id) {
		return m_baseDao.delete("log.delete", id);
	}

	public Log findByName(String name) {
		return (Log) m_baseDao.queryForObject("log.findByName", name);
	}

	public Log findByPK(int id) {
		return (Log) m_baseDao.queryForObject("log.findById", id);
	}

	public int insertLog(Log log) {
		return (Integer) m_baseDao.insert("log.insert", log);
	}

	@SuppressWarnings("rawtypes")
	public List queryAllLogs() {
		return m_baseDao.queryForList("log.queryAllLogs");
	}

	public int queryAllSize() {
		return (Integer) m_baseDao.queryForObject("log.queryAllSize", null);
	}

	@SuppressWarnings("rawtypes")
	public List queryLimitedLogs(int start, int size) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("start", start);
		parameters.put("size", size);

		return m_baseDao.queryForList("log.queryLimitedLogs", parameters);
	}

	@SuppressWarnings("rawtypes")
	public List queryLimitedLogsByModuleOperation(String module, String operation, int start, int size) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("start", start);
		parameters.put("size", size);

		if (StringUtils.isNotEmpty(module)) {
			parameters.put("module", module);
		}
		if (StringUtils.isNotEmpty(operation)) {
			parameters.put("operation", operation);
		}
		return m_baseDao.queryForList("log.queryLimitedLogsByModuleOperation", parameters);
	}

	public int querySizeByModuleOperation(String module, String operation) {
		Map<String, String> parameters = new HashMap<String, String>();

		if (StringUtils.isNotEmpty(module)) {
			parameters.put("module", module);
		}
		if (StringUtils.isNotEmpty(operation)) {
			parameters.put("operation", operation);
		}
		return (Integer) m_baseDao.queryForObject("log.querySizeByModuleOperation", parameters);
	}

	public void setBaseDao(BaseDao baseDao) {
		m_baseDao = baseDao;
	}

	public int updateLog(Log log) {
		return m_baseDao.update("log.update", log);
	}
}
