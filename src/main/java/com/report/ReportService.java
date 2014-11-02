package com.report;

import java.util.Date;
import java.util.List;

public interface ReportService {

	public int insertReport(Report report);

	 public List<Report> queryByShopId(int shopId, Date start,Date end) ;
			
}
