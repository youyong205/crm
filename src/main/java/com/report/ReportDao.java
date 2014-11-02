package com.report;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.BaseDao;

public class ReportDao {

	@Autowired
	private BaseDao m_baseDao;

	public int deleteReport(int id) {
		return m_baseDao.delete("report.delete", id);
	}

	public int insertReport(Report report) {
		return (Integer) m_baseDao.insert("report.insert", report);
	}

	@SuppressWarnings("rawtypes")
	public List queryByShopId(int shopId,Date start,Date end) {
		Map<String, Object> parameters = new HashMap<String, Object>();

		parameters.put("shopId", shopId);
		parameters.put("start", start);
		parameters.put("end", end);

		return m_baseDao.queryForList("report.queryByShopId",parameters);
	}

	public void setBaseDao(BaseDao baseDao) {
		m_baseDao = baseDao;
	}

}