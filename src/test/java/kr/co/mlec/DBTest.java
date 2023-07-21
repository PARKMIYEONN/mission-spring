package kr.co.mlec;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class DBTest {
	
	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Ignore
	@Test
	public void dataSource테스트() throws Exception{
		//의존주입이 잘 됐는지 확인하는 메소드
		//ds가 null이 아니라면 잘 된 것임

		assertNotNull(ds);
	}
	
	@Ignore
	@Test
	public void sqlSession테스트() throws Exception{
		assertNotNull(session);
	}
	
	@Ignore
	@Test
	public void 전체게시글조회테스트() throws Exception{
		List<BoardVO> list = session.selectList("board.dao.BoardDAO.selectAllBoard");
		for(BoardVO board : list) {
			System.out.println(board);
		}
	}
	
	@Test
	public void 전체게시글조회BoardDAO테스트() throws Exception{
		List<BoardVO> list = boardDAO.selectAllBoard();
		for(BoardVO b : list) {
			System.out.println(b);
		}
	}

}
