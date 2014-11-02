package com.log;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

public class LogServiceImpl implements LogService {

	private LogDao m_logDao;

	private Logger m_logger = Logger.getLogger(LogServiceImpl.class);

	@Override
	public Log findByName(String name) {
		try {
			return m_logDao.findByName(name);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public Log findByPK(int id) {
		try {
			return m_logDao.findByPK(id);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public int insertLog(Log log) {
		try {
			String detail = log.getDetail();
			if (detail.length() > 1024) {
				log.setDetail(detail.substring(0, 1000) + "...");
			}
			return m_logDao.insertLog(log);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@Override
	public int queryAllSize() {
		try {
			return m_logDao.queryAllSize();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Log> queryLimitedLogs(int start, int size) {
		try {
			return m_logDao.queryLimitedLogs(start, size);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Log>();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Log> queryLimitedLogs(String module, String operation, int start, int size) {
		if (StringUtils.isEmpty(module) && StringUtils.isEmpty(operation)) {
			return m_logDao.queryLimitedLogs(start, size);
		} else {
			return m_logDao.queryLimitedLogsByModuleOperation(module, operation, start, size);
		}
	}

	@Override
	public int querySize(String module, String operation) {
		if (StringUtils.isEmpty(module) && StringUtils.isEmpty(operation)) {
			return m_logDao.queryAllSize();
		} else {
			return m_logDao.querySizeByModuleOperation(module, operation);
		}
	}

	public void setLogDao(LogDao logDao) {
		m_logDao = logDao;
	}

}
