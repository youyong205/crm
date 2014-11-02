package com;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.junit.Test;

public class ExcelTest {

	@Test
	public void test() {
		int i;
		Sheet sheet;
		Workbook book = null;

		try {
			// t.xls为要读取的excel文件名
			book = Workbook.getWorkbook(ExcelTest.class.getResourceAsStream("test.xls"));

			// 获得第一个工作表对象(ecxel中sheet的编号从0开始,0,1,2,3,....)
			sheet = book.getSheet(0);
			System.out.println(sheet.getName());
			i = 1;
			System.out.println("====" + sheet.getColumns() + "====");
			while (true) {
				Cell[] cols = sheet.getRow(i);

				if (cols != null) {
					System.out.println(cols[1].getContents() + "\t" + cols[2].getContents() + "\t" + cols[3].getContents()
					      + "\t" + cols[4].getContents() + "\t" + cols[5].getContents() + "\t" + cols[0].getContents());
				}
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			book.close();
		}
	}

}
