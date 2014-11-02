package com.log;

import java.util.List;

public interface LogService {

	public Log findByName(String name);

	public Log findByPK(int id);

	public int insertLog(Log log);

	public int queryAllSize();

	public List<Log> queryLimitedLogs(int start, int size);

	public List<Log> queryLimitedLogs(String module, String operation, int start, int size);

	public int querySize(String module, String operation);

}
