package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
	public BoardDAO boardDAO;
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.insertBoard(vo);
	}

	@Override
	public List<?> selectBoardList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(vo);
	}

	@Override
	public int selectBoardTotal(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("Impl..total..vo hi"+ vo.toString());
		return boardDAO.selectBoardTotal(vo);
	}

	@Override
	public BoardVO selectBoardDetail(int boardNum) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardDetail(boardNum);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("updateBoard... vo: "+vo.toString());
		return boardDAO.updateBoard(vo);
	}

	@Override
	public int updateHits(int boardnum) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.updateHits(boardnum);
	}

	@Override
	public int boardDelete(int boardnum) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.boardDelete(boardnum);
	}

}
