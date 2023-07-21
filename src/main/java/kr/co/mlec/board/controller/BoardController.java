package kr.co.mlec.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@GetMapping("/board")
	public String list(HttpServletRequest request) {
		
		List<BoardVO> boardList = boardService.getBoardList();
		
		request.setAttribute("boardList", boardList);
		return "board/list";
		
	}
	
	@GetMapping("board/detail")
	public String detail(HttpServletRequest request ,@RequestParam("no") int no) {
		
		BoardVO vo = boardService.getBoard(no);
		request.setAttribute("board", vo);
				
		return "board/detail";
	}
	
}
