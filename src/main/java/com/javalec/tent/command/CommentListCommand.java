package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.BoardDao;
import com.javalec.tent.dao.CommentDao;
import com.javalec.tent.dao.QuestionDao;
import com.javalec.tent.dto.BoardDto;
import com.javalec.tent.dto.CommentDto;
import com.javalec.tent.dto.QuestionDto;
import com.javalec.tent.util.BoardPageMaker;

public class CommentListCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
//		MemberDao dao = MemberDao.getInstance();
//        
//        int page = 1;
//        
//        if(req.getParameter("page")!=null){
//            page = Integer.parseInt(req.getParameter("page"));
//        }
//        Paging paging = new Paging();
//        paging.setPage(page);
//        paging.setTotalCount(351);
//        
//        List<Member> list = dao.selectAllMember(page);
//        req.setAttribute("memList", list);
//        req.setAttribute("paging", paging);
//        
//        RequestDispatcher dispatcher = req.getRequestDispatcher("./member/MemberList.jsp");
//        dispatcher.forward(req, res);
		CommentDao commentDao = new CommentDao();
		int bNo = Integer.parseInt(request.getParameter("bNo"));
        int pageNo = 1;
        
        if(request.getParameter("pageNo") != null) {
        	pageNo = Integer.parseInt(request.getParameter("pageNo"));
        }
        BoardPageMaker boardPageMaker = new BoardPageMaker();
        int totalCount = commentDao.commentCount(bNo);
        boardPageMaker.setPage(pageNo);
        boardPageMaker.setTotalCount(totalCount);
        ArrayList<CommentDto> commentList = new ArrayList<CommentDto>();
        commentList = commentDao.commentList(pageNo, bNo);
		request.setAttribute("commentList", commentList);
		request.setAttribute("pageMaker", boardPageMaker);
		request.setAttribute("commentCount", totalCount);

	}

}
