package com.todo.web.jdbc;
import java.util.Date;

public class todo {
	private int id;
	private String user;
	private String title;
	private String data;
	private Boolean complete;
	private Date date;

	public todo(String user, String title, String data) {
		this.user = user;
		this.title = title;
		this.data = data;
		this.complete = false;
	}
	
	public todo(int id, String user, String title, String data, Boolean complete) {
		this.id = id;
		this.user = user;
		this.title = title;
		this.data = data;
		this.complete = complete;
	}
	
	public todo(String user, String title, String data, Boolean complete, Date date) {
		this.user = user;
		this.title = title;
		this.data = data;
		this.complete = complete;
		this.date = date;
	}
	
	public todo(int id, String user, String title, String data, Boolean complete, Date date) {
		this.id = id;
		this.user = user;
		this.title = title;
		this.data = data;
		this.complete = complete;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Boolean getComplete() {
		return complete;
	}

	public void setComplete(Boolean complete) {
		this.complete = complete;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "todo [id=" + id + ", user=" + user + ", title=" + title + ", data=" + data + ", complete=" + complete
				+ ", date=" + date + "]";
	}
	
}
