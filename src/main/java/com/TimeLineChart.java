package com;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.google.gson.Gson;

public class TimeLineChart {

	private List<Data> series = new ArrayList<Data>();

	public void add(String subTitle, Map<Long, Double> data) {
		Map<Double, Double> temp = new LinkedHashMap<Double, Double>();

		for (Entry<Long, Double> entry : data.entrySet()) {
			temp.put(entry.getKey().doubleValue(), entry.getValue());
		}
		series.add(new Data(subTitle, temp));
	}

	public String getJsonString() {
		Gson gson = new Gson();

		return gson.toJson(this);
	}

	public List<Data> getSeries() {
		return series;
	}

	public void setSeries(List<Data> series) {
		this.series = series;
	}

	public static class Data {

		private String name;

		private Double[][] data;

		public Data(String name, Map<Double, Double> data) {
			int length = data.size();
			this.data = new Double[length][2];
			this.name = name;
			int index = 0;
			for (Entry<Double, Double> entry : data.entrySet()) {
				this.data[index][0] = entry.getKey();
				Double value = entry.getValue();
				this.data[index][1] = value.doubleValue();
				index++;
			}
		}

		public String getName() {
			return name;
		}
	}

	public static class Item {

		private String x;

		private String y;

		public Item(String x, String y) {
			this.x = x;
			this.y = y;
		}

		public String getX() {
			return x;
		}

		public String getY() {
			return y;
		}
	}

}
