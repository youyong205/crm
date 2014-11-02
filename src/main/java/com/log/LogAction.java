package com.log;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.Authority;
import com.Modules;
import com.Operation;
import com.PagedAction;
import com.user.UserService;

public class LogAction extends PagedAction {

	private static final long serialVersionUID = 2802256599554299998L;

	private Logger m_logger = Logger.getLogger(LogAction.class);

	private List<Log> m_logs;

	private int m_logId;

	@Autowired
	private UserService m_userService;

	private Log m_log = new Log();

	private String m_module;

	private String m_operation;

	@Override
	public String getActionModule() {
		return Modules.s_log_module;
	}

	public Log getLog() {
		return m_log;
	}

	public List<Log> getLogs() {
		return m_logs;
	}

	public String getModule() {
		return m_module;
	}

	public String getOperation() {
		return m_operation;
	}

	public String logList() {
		Authority auth = checkAuthority(buildResource(Modules.s_log_module, Operation.s_operation_detail));
		if (auth != null) {
			return auth.getName();
		}

		try {
			m_totalSize = m_logService.queryAllSize();
			m_totalPages = computeTotalPages(m_totalSize);
			int start = (m_index - 1) * SIZE;
			if (start < 0) {
				start = 0;
			}
			m_logs = m_logService.queryLimitedLogs(start, SIZE);
			for (Log log : m_logs) {
				log.setUser(m_userService.findByPK(log.getUserId()));
			}
			return SUCCESS;
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String logSearch() {
		Authority auth = checkAuthority(buildResource(Modules.s_log_module, Operation.s_operation_detail));
		if (auth != null) {
			return auth.getName();
		}

		try {
			m_totalSize = m_logService.querySize(m_module, m_operation);
			m_totalPages = computeTotalPages(m_totalSize);
			int start = (m_index - 1) * SIZE;
			if (start < 0) {
				start = 0;
			}
			m_logs = m_logService.queryLimitedLogs(m_module, m_operation, start, SIZE);
			for (Log log : m_logs) {
				log.setUser(m_userService.findByPK(log.getUserId()));
			}
			return SUCCESS;
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String logUpdate() {
		try {
			m_log = m_logService.findByPK(m_logId);
			if (m_log != null) {
				m_log.setUser(m_userService.findByPK(m_log.getId()));
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public void setLog(Log log) {
		m_log = log;
	}

	public void setLogId(int logId) {
		m_logId = logId;
	}

	public void setModule(String module) {
		m_module = module;
	}

	public void setOperation(String operation) {
		m_operation = operation;
	}

	public void setUserService(UserService userService) {
		m_userService = userService;
	}

}