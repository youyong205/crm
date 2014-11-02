package com.shop;

import java.util.Date;

public class Shop {
	private int m_id;

	private int m_bossId;

	private String m_name;

	private String m_address;

	private double m_area;

	private double m_rent;

	private int m_staff1;

	private int m_salary1;

	private int m_staff2;

	private int m_salary2;

	private int m_sales;

	private int m_purchase;

	private double m_interest;

	private Date m_creationDate;

	private Date m_modifyDate;

	public int getId() {
		return m_id;
	}

	public void setId(int id) {
		m_id = id;
	}

	public int getBossId() {
		return m_bossId;
	}

	public void setBossId(int bossId) {
		m_bossId = bossId;
	}

	public String getName() {
		return m_name;
	}

	public void setName(String name) {
		m_name = name;
	}

	public String getAddress() {
		return m_address;
	}

	public void setAddress(String address) {
		m_address = address;
	}

	public double getArea() {
		return m_area;
	}

	public void setArea(double area) {
		m_area = area;
	}

	public double getRent() {
		return m_rent;
	}

	public void setRent(double rent) {
		m_rent = rent;
	}

	public int getStaff1() {
		return m_staff1;
	}

	public void setStaff1(int staff1) {
		m_staff1 = staff1;
	}

	public int getStaff2() {
		return m_staff2;
	}

	public void setStaff2(int staff2) {
		m_staff2 = staff2;
	}

	public int getSalary1() {
		return m_salary1;
	}

	public void setSalary1(int salary1) {
		m_salary1 = salary1;
	}

	public int getSalary2() {
		return m_salary2;
	}

	public void setSalary2(int salary2) {
		m_salary2 = salary2;
	}

	public int getSales() {
		return m_sales;
	}

	public void setSales(int sales) {
		m_sales = sales;
	}

	public int getPurchase() {
		return m_purchase;
	}

	public void setPurchase(int purchase) {
		m_purchase = purchase;
	}

	public double getInterest() {
		return m_interest;
	}

	public void setInterest(double interest) {
		m_interest = interest;
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
}
