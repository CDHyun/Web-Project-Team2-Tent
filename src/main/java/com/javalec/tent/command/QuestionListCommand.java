package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.QuestionDao;
import com.javalec.tent.dto.QuestionDto;

public class QuestionListCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<QuestionDto> qnaList = new ArrayList<QuestionDto>();
		QuestionDao questionDao = new QuestionDao();
		qnaList = questionDao.questionList();
		request.setAttribute("qnaList", qnaList);

	}

}
