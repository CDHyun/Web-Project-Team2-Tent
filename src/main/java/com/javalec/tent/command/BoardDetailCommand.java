package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.BoardDao;
import com.javalec.tent.dto.BoardDto;

public class BoardDetailCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		ArrayList<BoardDto> boardDetail = new ArrayList<BoardDto>();
		BoardDao boardDao = new BoardDao();
		boardDetail = boardDao.boardDetail(bNo);
		request.setAttribute("boardDetail", boardDetail);

	}

}
