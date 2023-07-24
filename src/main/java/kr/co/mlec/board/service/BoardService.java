package kr.co.mlec.board.service;

import java.util.List;

import kr.co.mlec.board.vo.BoardVO;

public interface BoardService {
	
	/**
	 * 주문현황
	 * 상품테이블, 회원테이블
	 */
	
	List<BoardVO> getBoardList();
	
	BoardVO getBoardByNo(int no);

}
