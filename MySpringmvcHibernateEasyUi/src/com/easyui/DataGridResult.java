package com.easyui;

import java.util.List;

import org.springframework.stereotype.Component;

import com.po.Emp;

@Component
public class DataGridResult {
	private int total;
	private List<Emp> rows;
	private int effectRow;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<Emp> getRows() {
		return rows;
	}

	public void setRows(List<Emp> rows) {
		this.rows = rows;
	}

	public int getEffectRow() {
		return effectRow;
	}

	public void setEffectRow(int effectRow) {
		this.effectRow = effectRow;
	}

}
