package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.CommentDao;

public class ChildCommentWriteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//int bNo, String uid, String uNickName, String cmContent, int cmParentNo
		

	}

}
