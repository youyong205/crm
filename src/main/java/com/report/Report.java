package com.report;

import java.text.DecimalFormat;
import java.util.Date;

public class Report {

	private int m_id;

	private Date m_period;

	private int m_shopId;

	private double m_money;

	private int m_number;

	private Date m_creationDate;

	private Date m_modifyDate;

	public int getId() {
		return m_id;
	}

	public void setId(int id) {
		m_id = id;
	}

	public Date getPeriod() {
		return m_period;
	}

	public void setPeriod(Date period) {
		m_period = period;
	}

	public int getShopId() {
		return m_shopId;
	}

	public void setShopId(int shopId) {
		m_shopId = shopId;
	}

	public double getMoney() {
		return m_money;
	}

	public void setMoney(double money) {
		m_money = money;
	}

	public int getNumber() {
		return m_number;
	}

	public void setNumber(int number) {
		m_number = number;
	}

	public Date getCreationDate() {
		return m_creationDate;
	}

	public void setCreationDate(Date creationDate) {
		m_creationDate = creationDate;
	}

	public Date getModifyDate() {
		return m_modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		m_modifyDate = modifyDate;
	}

	public String getAvg() {
		double avg = 0.0;

		if (m_number > 0) {
			avg = m_money / m_number;
		}

		DecimalFormat df = new DecimalFormat("0.0");

		return df.format(avg);
	}
}
