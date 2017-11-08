package com.po;

public class Navigation implements java.io.Serializable {

	private Integer id;
	private String text;
	private String state;
	private Integer tid;
	private String url;
	private String iconcls;

	public Navigation() {
	}

	public Navigation(Integer id, String text, String state, String url) {
		this.id = id;
		this.text = text;
		this.state = state;
		this.url = url;
	}

	public Navigation(String text, String state, Integer tid) {
		this.text = text;
		this.state = state;
		this.tid = tid;
	}

	public Navigation(String text, String state, Integer tid, String url, String iconcls) {
		this.text = text;
		this.state = state;
		this.tid = tid;
		this.url = url;
		this.iconcls = iconcls;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIconcls() {
		return this.iconcls;
	}

	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}

}