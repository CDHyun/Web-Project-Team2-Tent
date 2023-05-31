package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TentCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
