package kr.co.mlec.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.member.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@GetMapping("/board")
	public String list(HttpServletRequest request) {
		
		List<BoardVO> boardList = boardService.getBoardList();
		
		request.setAttribute("boardList", boardList);
//		return "board/list";
		return "board/list2";
		
	}
	
	@GetMapping("/board/detail")
	public String detail(HttpServletRequest request ,@RequestParam("no") int no) {
		
		BoardVO vo = boardService.getBoardByNo(no);
		request.setAttribute("board", vo);
				
		return "board/detail";
	}
	
	@GetMapping("/board/{no}")
	public ModelAndView detail2(@PathVariable("no") int boardNo, HttpServletRequest request) {
		
		System.out.println("boardNo : " + boardNo);
		
		BoardVO vo = boardService.getBoardByNo(boardNo);
		
		
		ModelAndView mav = new ModelAndView();
		
		//뷰로 경로 지정
		mav.setViewName("board/detail");
		
		//리퀘스트 공유영역에 등록
		mav.addObject("board", vo);
		
//		//공유영역 등록
//		request.setAttribute("board", vo);
				
		return mav;
		
	}
	
	@GetMapping("/board/write")
	public void writeForm(Model model, HttpSession session) {
		BoardVO board = new BoardVO();
		
		MemberVO userVO = (MemberVO) session.getAttribute("userVO"); 
		if(userVO != null) {
			board.setWriter(userVO.getId());
		}
		
		model.addAttribute("boardVO", board);
	}
	
	@PostMapping("/board/write")
	public String write(@Valid BoardVO board, BindingResult result) {
		
		System.out.println(board);
		if(result.hasErrors()) {
			System.out.println("에러발생");
			return "board/write";
		}
		
		boardService.addBoard(board);
		
		return "redirect:/board";
	}
	
}
