package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.BoardDao;
import com.javalec.tent.dao.NoticeDao;
import com.javalec.tent.dao.QuestionDao;
import com.javalec.tent.dto.BoardDto;
import com.javalec.tent.dto.NoticeDto;
import com.javalec.tent.dto.QuestionDto;
import com.javalec.tent.util.BoardPageMaker;

public class NoticeListCommand implements TentCommand {

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
		NoticeDao noticeDao = new NoticeDao();
        int pageNo = 1;
        
        if(request.getParameter("pageNo") != null) {
        	pageNo = Integer.parseInt(request.getParameter("pageNo"));
        }
        BoardPageMaker boardPageMaker = new BoardPageMaker();
        String queryContent = request.getParameter("queryContent");
        System.out.println("받은 검색 데이터 : " + queryContent);
        /*
        int totalCount = boardDao.boardCount(queryContent);
        boardPageMaker.setPage(pageNo);
        boardPageMaker.setTotalCount(totalCount);
        */
        ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
        noticeList = noticeDao.noticeList();
		request.setAttribute("boardList", noticeList);
		request.setAttribute("pageMaker", boardPageMaker);

	}

}
