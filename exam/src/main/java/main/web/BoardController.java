package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;
import main.service.CrudService;

@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name = "crudService")
	private CrudService crudService;


	@RequestMapping(value = "/boardList.do")
	public String boardList(BoardVO vo, ModelMap model) throws Exception {
		
		int unit =vo.getUnit();
		/*
		 * 검색 시 출력되는 page 최대 번호 */
		//the number of total data 
		int total = boardService.selectBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		//1page 1, 10 // 2page -> 11, 20 3page ->21, 30
		int viewPage = vo.getViewPage();
		
		if(viewPage > totalPage || viewPage <1) {
			viewPage =1;
		}
		
		int startIndex=(viewPage-1) * unit +1;
		int endIndex = startIndex +(unit-1);
		int startRowNo = total - (viewPage-1)*unit;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		
		List<?> list = boardService.selectBoardList(vo);
		
		model.addAttribute("resultList", list);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("rowNumber",startRowNo);
		
		return "CRUD/boardList";
	}
	
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite() {
		return "CRUD/boardWrite";
		
	}
	
	@RequestMapping(value="/boardWriteSave.do")
	@ResponseBody
	public String boardWriteSave(BoardVO vo) throws Exception {
		
		String result = boardService.insertBoard(vo);
		String msg="";
		
		if(result == null) msg="ok";
		
		
		return msg;
	}
	
	@RequestMapping(value="/boardDetail.do")
	public String boardDetail(int boardNum, ModelMap model) throws Exception{
		boardService.updateHits(boardNum);
		BoardVO vo = boardService.selectBoardDetail(boardNum);
		
		String contents = vo.getContents(); // \n 문자 치환
		vo.setContents(contents.replace("\n",  "<br>"));
		
		model.addAttribute("boardVO", vo);
		return "CRUD/boardDetail";
	}
	
	/*
	 * 수정 페이지 출력
	 */
	@RequestMapping(value="/boardModifyWrite.do")
	public String selectBoardModify(int boardNum,HttpSession session, HttpServletRequest request, ModelMap model) throws Exception{
		String referer = request.getHeader("referer");
		BoardVO vo = boardService.selectBoardDetail(boardNum);
		String writer = vo.getId();
		System.out.println(referer);
		if(session.getAttribute("userid").equals(writer)) {
			model.addAttribute("boardVO", vo);
			return "CRUD/boardModifyWrite";
		}
		else {
			return "redirect:"+referer;
		}
	}
	/*
	 * 수정 버튼 클릭 시 
	 */
	@RequestMapping(value="/boardModifySave.do")
	@ResponseBody
	public String updateBoard(BoardVO vo, ModelMap model) throws Exception{
//		Timestamp updatedate = new Timestamp(System.currentTimeMillis());
//		SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/DD HH24:MI:SS");
//		System.out.println(sdf.format(updatedate));
//		vo.setUpdatedate(sdf.format(updatedate));
		
		int result = boardService.updateBoard(vo);
		
		System.out.println("boardModifySave2");
		model.addAttribute("boardnum", vo.getBoardnum());
		String msg=(result>0)?"success":"fail";
		return msg;
	}
	@RequestMapping(value="boardDelete.do")
	@ResponseBody
	public String boardDelete(int boardnum, ModelMap model) throws Exception {
		System.out.println("boardnum: " + boardnum);
		int result = boardService.boardDelete( boardnum);
		String msg = (result >0)? "success" : "fail";
		
		return msg;
		
		
	}
	
}
