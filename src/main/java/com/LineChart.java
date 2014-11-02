package com;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.google.gson.Gson;

public class LineChart {

	private String[] categories;

	private Item[] series;

	private int step = 1;

	public static class ChartItem {
		private String subTitle;

		private Map<Double, Double> data;

		public String getSubTitle() {
			return subTitle;
		}

		public Map<Double, Double> getData() {
			return data;
		}

		public ChartItem(String subTitle, Map<Double, Double> data) {
			this.data = data;
			this.subTitle = subTitle;
		}
	}

	public void add(List<ChartItem> items) {
		int itemSize = items.size();

		series = new Item[itemSize];
		for (int index = 0; index < itemSize; index++) {
			ChartItem chartItem = items.get(index);
			String subTitle = chartItem.getSubTitle();
			Map<Double, Double> data = chartItem.getData();
			Item item = new Item();
			int i = 0;
			int size = data.size();
			Double[] d = new Double[size];
			categories = new String[size];
			for (Entry<Double, Double> entry : data.entrySet()) {
				categories[i] = String.valueOf(i + 1);
				d[i] = entry.getValue();
				i++;
			}
			item.setName(subTitle);
			item.setData(d);
			series[index] = item;
			step = 1 + size / 10;
		}
	}

	public void add(String subTitle, Map<Double, Double> data) {
		List<ChartItem> items = new ArrayList<ChartItem>();

		items.add(new ChartItem(subTitle, data));
		add(items);
	}

	public String getJsonString() {
		Gson gson = new Gson();

		return gson.toJson(this);
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String[] getCategories() {
		return categories;
	}

	public Item[] getSeries() {
		return series;
	}

	public static class Item {
		private String name;

		private Double[] data;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public Double[] getData() {
			return data;
		}

		public void setData(Double[] data) {
			this.data = data;
		}
	}
}
