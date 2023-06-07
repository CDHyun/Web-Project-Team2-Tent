package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.BoardDao;
import com.javalec.tent.dao.QuestionDao;
import com.javalec.tent.dto.BoardDto;
import com.javalec.tent.dto.QuestionDto;

public class BoardListCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String strPage = request.getParameter("pageNo");
	    if(strPage==null){
	    	strPage = "1";
	    }
		int v_page = Integer.parseInt(strPage);
		int pageNo = (v_page-1)*7;
		
		ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();
		BoardDao boardDao = new BoardDao();
		String queryContent = request.getParameter("queryContent");
		boardList = boardDao.boardList(queryContent, pageNo);
		request.setAttribute("boardList", boardList);

	}

}
