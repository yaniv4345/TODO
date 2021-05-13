package com.todo.web.jdbc;

import java.util.Date;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

public class todoDbUtil {
	private DataSource dataSource;

	public todoDbUtil(DataSource theDataSource) {
		this.dataSource = theDataSource;
	}

	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		try {
			if(myRs != null){
				myRs.close();
			}
			if(myStmt != null) {
				myStmt.close();
			}
			if(myConn != null) {
				myConn.close();
			}
		}catch(Exception exc) {
			exc.printStackTrace();
		}
	}
	
	public List<todo> getAll() throws Exception {
		List<todo> todos = new ArrayList<>();
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT * FROM list ORDER BY complete, insert_date";
			myStmt = myConn.createStatement();
			myRs = myStmt.executeQuery(sql);
			while(myRs.next()) {
				int id = myRs.getInt("id");
				String user = myRs.getString("user");
				String title = myRs.getString("title");
				String data = myRs.getString("data");
				Boolean complete = myRs.getBoolean("complete");
				//Date insert_date = myRs.getDate("insert_date");
				Date insert_date =  myRs.getTimestamp("insert_date");
//				System.out.println(insert_date.getTime());
				//Date insert_date  = new Date(myRs.getDate("insert_date").getTime());
//			    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
//			    insert_date =(Date) myFormatObj.format(insert_date);
				todo tempTodo = new todo(id, user, title, data, complete, insert_date);
				todos.add(tempTodo);
			}
			close(myConn, myStmt, myRs);
			return todos;	
		}finally{

		}
	}

	public void updateTodo(todo toDo) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "UPDATE list SET"
					+ " user=?,"
					+ " title=?,"
					+ " data=?,"
					+ " complete=?"
					+ " WHERE id=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, toDo.getUser());
			myStmt.setString(2, toDo.getTitle());
			myStmt.setString(3, toDo.getData());
			myStmt.setBoolean(4, toDo.getComplete());
			myStmt.setInt(5, toDo.getId());
			//System.out.println(myStmt);

			myStmt.execute();
		}finally {
			close(myConn, myStmt, null);
		}
	}

	public void createTodo(todo toDo) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "INSERT INTO list"
					+ " (user, title, data)"
					+ " VALUES(?, ?, ?)";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, toDo.getUser());
			myStmt.setString(2, toDo.getTitle());
			myStmt.setString(3, toDo.getData());
			System.out.println(myStmt);

			myStmt.execute();
		}finally {
			close(myConn, myStmt, null);
		}
	}

	public void deleteTodo(int id) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "DELETE FROM list"
					+ " WHERE id=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, id);
			myStmt.execute();
		}finally {
			close(myConn ,myStmt, null);
		}
	}
}
