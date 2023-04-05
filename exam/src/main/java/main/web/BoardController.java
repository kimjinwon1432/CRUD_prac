package main.web;

import java.util.List;

import javax.annotation.Resource;

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
		System.out.println("hi");
		int unit =10;
		
		int total=boardService.selectBoardTotal(vo);
		int totalPage= (int) Math.ceil((double)total/unit);
		System.out.println(vo.toString());
		//page number
		int viewPage = vo.getViewPage();
		//page number validation.... 
		if(viewPage > totalPage || viewPage < 1) {
			viewPage =1;
		}
		
		int startIndex = (viewPage-1) * unit +1;
		int endIndex = startIndex+ unit-1;
		//행번호
		int startRowNo = total - (viewPage-1) * unit;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		List<?> list = boardService.selectBoardList(vo);
		
		model.addAttribute("resultList", list);
		model.addAttribute("rowNumber", startRowNo);
		model.addAttribute("resultTotal", total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList",list);
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
	
}
