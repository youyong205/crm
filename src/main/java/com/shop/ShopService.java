package com.shop;

import java.util.List;

public interface ShopService {

	public int deleteShop(int id);

	public Shop findByPK(int id);

	public int insertShop(Shop shop);

	public int queryAllSize(int bossId);

	public List<Shop> queryLimitedShops(int start, int size,int bossId);

	public int updateShop(Shop shop);

}
