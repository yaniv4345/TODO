package com.todo.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class todoServlet
 */
@WebServlet("/todoServlet")
public class todoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private todoDbUtil todoDButil;
	@Resource(name="jdbc/todo_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			todoDButil = new todoDbUtil(dataSource);
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}

	private void updateTodo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("rowId"));
		String user = request.getParameter("user");
		String title = request.getParameter("title");
		String data = request.getParameter("data");
		Boolean complete = Boolean.parseBoolean(request.getParameter("complete"));
		todo toDo = new todo(id, user, title, data, complete);
//		System.out.println(toDo);
		todoDButil.updateTodo(toDo);
		listTodo(request, response);
	}

	private void listTodo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<todo> toDo = todoDButil.getAll();
		request.setAttribute("TODO", toDo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/todo.jsp");
		dispatcher.forward(request, response);
	}
	private void createTodo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user = request.getParameter("user");
		String title = request.getParameter("title");
		String data = request.getParameter("data");
		todo toDo = new todo(user, title, data);
		todoDButil.createTodo(toDo);
		listTodo(request, response);
		
	}
	private void deleteTodo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("rowId"));
		todoDButil.deleteTodo(id);
		listTodo(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String theCommand = request.getParameter("command");
			if (theCommand == null) {
				theCommand = "LIST";
			}
			switch(theCommand) {
			case "LIST":
				listTodo(request, response);
				break;
			case "UPDATE":
				updateTodo(request, response);
				break;
			case "NEW":
				createTodo(request, response);
				break;
			case "DELETE":
				deleteTodo(request, response);
				break;
			default:
				listTodo(request, response);
			}
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String theCommand = request.getParameter("command");
			if (theCommand == null) {
				theCommand = "LIST";
			}
			switch(theCommand) {
			case "LIST":
				listTodo(request, response);
				break;
			case "UPDATE":
				updateTodo(request, response);
				break;
			case "NEW":
				createTodo(request, response);
				break;
			case "DELETE":
				deleteTodo(request, response);
				break;
			default:
				listTodo(request, response);
			}
		}catch(Exception exc) {
			throw new ServletException(exc);
		}
	}

}
