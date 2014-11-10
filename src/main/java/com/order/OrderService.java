package com.order;

import java.util.Date;
import java.util.List;

public interface OrderService {

	public int deleteOrder(int id);

	public Order findByPK(int id);

	public int insertOrder(Order order);

	public int queryAllSize(int shopId);

	public List<Order> queryLimitedOrders(int start, int size,int shopId);

	public int updateOrder(Order order);
	
	public List<Order> queryOrdersByDate(Date date,int shopId);

}
