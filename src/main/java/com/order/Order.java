package com.order;

import java.text.DecimalFormat;
import java.util.Date;

public class Order {
	private int m_id;

	private int m_shopId;

	private Date m_period;

	private int m_type;

	private int m_weather;

	private double m_money1;

	private double m_money2;

	private double m_money3;

	private int m_tableNumber;

	private int m_number;

	private String m_detail;

	private Date m_creationDate;

	private Date m_modifyDate;

	public int getId() {
		return m_id;
	}

	public void setId(int id) {
		m_id = id;
	}

	public int getShopId() {
		return m_shopId;
	}

	public void setShopId(int shopId) {
		m_shopId = shopId;
	}

	public Date getPeriod() {
		return m_period;
	}

	public void setPeriod(Date period) {
		m_period = period;
	}

	public int getType() {
		return m_type;
	}

	public void setType(int type) {
		m_type = type;
	}

	public int getWeather() {
		return m_weather;
	}

	public void setWeather(int weather) {
		m_weather = weather;
	}

	public double getMoney1() {
		return m_money1;
	}

	public void setMoney1(double money1) {
		m_money1 = money1;
	}

	public double getMoney2() {
		return m_money2;
	}

	public void setMoney2(double money2) {
		m_money2 = money2;
	}

	public double getMoney3() {
		return m_money3;
	}

	public void setMoney3(double money3) {
		m_money3 = money3;
	}

	public int getTableNumber() {
		return m_tableNumber;
	}

	public void setTableNumber(int tableNumber) {
		m_tableNumber = tableNumber;
	}

	public int getNumber() {
		return m_number;
	}

	public void setNumber(int number) {
		m_number = number;
	}

	public String getDetail() {
		return m_detail;
	}

	public void setDetail(String detail) {
		m_detail = detail;
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
			avg = (m_money1 + m_money2 + m_money3) / m_number;
		}

		DecimalFormat df = new DecimalFormat("0.0");

		return df.format(avg);
	}
}
