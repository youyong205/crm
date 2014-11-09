package com.report;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.Authority;
import com.Modules;
import com.Operation;
import com.PagedAction;
import com.TimeHelper;
import com.TimeLineChart;
import com.order.Order;
import com.order.OrderService;
import com.shop.Shop;
import com.shop.ShopService;
import com.user.User;

public class ReportAction extends PagedAction {

	private static final long serialVersionUID = 4901652667413788534L;

	protected Logger m_logger = Logger.getLogger(ReportAction.class);

	private List<Report> m_reports;

	private List<Shop> m_shops;

	private Date m_start;

	private Date m_end;

	private int m_shopId;

	@Autowired
	private ReportService m_reportService;

	@Autowired
	private OrderService m_orderService;

	private List<Order> m_orders;

	private TimeLineChart m_chart1 = new TimeLineChart();

	private TimeLineChart m_chart2 = new TimeLineChart();

	private TimeLineChart m_chart3 = new TimeLineChart();

	private Report m_report = new Report();

	@Override
	public String getActionModule() {
		return Modules.s_report_module;
	}

	public Report getReport() {
		return m_report;
	}

	public List<Report> getReports() {
		return m_reports;
	}

	public List<Shop> queryShop() {
		User user = queryUserInfo();
		int userId = user.getId();

		if (isAdmin(user.getUserName())) {
			userId = 0;
		}
		List<Shop> shops = m_shopService.queryLimitedShops(0, Integer.MAX_VALUE, userId);

		return shops;
	}

	public String reportToday() {
		Authority auth = checkAuthority(buildResource(Modules.s_report_module, Operation.s_operation_detail));
		if (auth != null) {
			return auth.getName();
		}
		if (m_start == null) {
			m_start = TimeHelper.getCurrentDay();
		}
		if (m_end == null) {
			m_end = TimeHelper.getCurrentDay();
		}
		m_shops = queryShop();

		if (m_shopId == 0 && m_shops.size() > 0) {
			m_shopId = m_shops.get(0).getId();
		}
		Date current = TimeHelper.getCurrentDay();
		List<Report> retry = m_reportService.queryByShopId(m_shopId, current, current);

		if (retry.size() > 0) {
			m_report = retry.get(0);
		}
		m_orders = m_orderService.queryOrdersByDate(current);
		return SUCCESS;
	}

	public String reportIndex() {
		Authority auth = checkAuthority(buildResource(Modules.s_report_module, Operation.s_operation_detail));
		if (auth != null) {
			return auth.getName();
		}
		if (m_start == null) {
			m_start = TimeHelper.getCurrentDay(-14);
		}
		if (m_end == null) {
			m_end = TimeHelper.getCurrentDay();
		}
		m_shops = queryShop();

		if (m_shopId == 0 && m_shops.size() > 0) {
			m_shopId = m_shops.get(0).getId();
		}
		List<Report> reports = m_reportService.queryByShopId(m_shopId, m_start, m_end);
		Map<Long, Report> datas = new LinkedHashMap<Long, Report>();

		Long startLong = m_start.getTime();

		for (; startLong < m_end.getTime(); startLong = startLong + TimeHelper.ONE_DAY) {
			datas.put(startLong, null);
		}

		for (Report report : reports) {
			datas.put(report.getPeriod().getTime(), report);
		}

		Map<Long, Double> money = new LinkedHashMap<Long, Double>();
		Map<Long, Double> people = new LinkedHashMap<Long, Double>();
		Map<Long, Double> avg = new LinkedHashMap<Long, Double>();

		for (Entry<Long, Report> data : datas.entrySet()) {
			long key = data.getKey();
			Report value = data.getValue();

			if (value != null) {
				money.put(key, value.getMoney());
				people.put(key, value.getNumber() * 1.0);
				avg.put(key, value.getMoney() / value.getNumber());

			} else {
				money.put(key, 0.0);
				people.put(key, 0.0);
				avg.put(key, 0.0);
			}
		}

		m_chart1.add("营业额趋势", money);
		m_chart1.add("客流量趋势", people);
		m_chart1.add("人均消费趋势", avg);

		Date current = TimeHelper.getCurrentDay();

		m_report = datas.get(current.getTime());

		if (m_report == null) {
			List<Report> retry = m_reportService.queryByShopId(m_shopId, current, current);

			if (retry.size() > 0) {
				m_report = retry.get(0);
			}
		}
		return SUCCESS;
	}

	public void setReport(Report report) {
		m_report = report;
	}

	public void setReportService(ReportService reportService) {
		m_reportService = reportService;
	}

	public void setShopService(ShopService shopService) {
		m_shopService = shopService;
	}

	public List<Shop> getShops() {
		return m_shops;
	}

	public int getShopId() {
		return m_shopId;
	}

	public void setShopId(int shopId) {
		m_shopId = shopId;
	}

	public Date getStart() {
		return m_start;
	}

	public void setStart(Date start) {
		m_start = start;
	}

	public Date getEnd() {
		return m_end;
	}

	public void setEnd(Date end) {
		m_end = end;
	}

	public TimeLineChart getChart1() {
		return m_chart1;
	}

	public TimeLineChart getChart2() {
		return m_chart2;
	}

	public TimeLineChart getChart3() {
		return m_chart3;
	}

	public void setOrderService(OrderService orderService) {
		m_orderService = orderService;
	}

	public void setOrders(List<Order> orders) {
		m_orders = orders;
	}

	public List<Order> getOrders() {
		return m_orders;
	}

}