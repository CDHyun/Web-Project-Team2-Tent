package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.BoardDao;
import com.javalec.tent.dto.BoardDto;

public class BoardListCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<BoardDto> qnaList = new ArrayList<BoardDto>();
		BoardDao boardDao = new BoardDao();
		qnaList = boardDao.qnaList();
		request.setAttribute("qnaList", qnaList);

	}

}
