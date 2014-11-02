package com.menu;

import java.util.Date;

public class Menu {
	private int m_id;
	private int m_shopId;
	private String m_name;
	private double m_price;
	private int m_count;
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
	public String getName() {
   	return m_name;
   }
	public void setName(String name) {
   	m_name = name;
   }
	public double getPrice() {
   	return m_price;
   }
	public void setPrice(double price) {
   	m_price = price;
   }
	public int getCount() {
   	return m_count;
   }
	public void setCount(int count) {
   	m_count = count;
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

}
