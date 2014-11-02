package com.report;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao m_reportDao;

	private Logger m_logger = Logger.getLogger(ReportServiceImpl.class);

	@Override
	public int insertReport(Report report) {
		try {
			return m_reportDao.insertReport(report);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return -1;
		}
	}

	@SuppressWarnings("unchecked")
   public List<Report> queryByShopId(int shopId, Date start,Date end) {
		try {
			return m_reportDao.queryByShopId(shopId, start, end);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return new ArrayList<Report>();
		}
	}

	public void setReportDao(ReportDao reportDao) {
		m_reportDao = reportDao;
	}

}
