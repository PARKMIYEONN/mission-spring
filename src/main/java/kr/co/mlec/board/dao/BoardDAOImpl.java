package kr.co.mlec.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> selectAllBoard() {
		List<BoardVO> list = sqlSession.selectList("board.dao.BoardDAO.selectAllBoard");
		return list;
	}

}
