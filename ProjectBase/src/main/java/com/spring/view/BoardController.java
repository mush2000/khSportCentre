package com.spring.view;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.biz.AdminService;
import com.spring.biz.BoardService;
import com.spring.biz.util.IsHoliday;
import com.spring.biz.util.Pagination;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.FileVO;
import com.spring.biz.vo.LoginInfoVO;
import com.spring.biz.vo.ReplyVO;

@Controller
public class BoardController {
	@Resource(name = "adminService")
	AdminService adminService;
	
	@Resource(name = "boardService")
	BoardService boardService;
	
	@Resource(name="boardUploadPath")
    String boardUploadPath;
    
	//게시판별 게시글 조회
	@RequestMapping(value = "/board.do")
	public String mainBoard(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "1") int kindCode
			, @RequestParam(required = false, defaultValue = "all") String searchType
			, @RequestParam(required = false, defaultValue = "") String keyword) {
		
		Map<String, Object> listCntMap = new HashMap<>();
		listCntMap.put("kindCode", kindCode); 
		listCntMap.put("searchType", searchType);
		listCntMap.put("keyword", keyword);
		
		
		int listCnt = boardService.getBoardListCnt(listCntMap);
		
		
		Pagination pagination = new Pagination(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		//게시판 종류도 페이징처리에 넣어줘야해서 Map으로 값을 넘겨주자
		Map<String, Object> var = new HashMap<>();
		var.put("pagination", pagination);
		var.put("kindCode", kindCode);
		var.put("searchType", searchType);
		var.put("keyword", keyword);
		
		model.addAttribute("boardList", boardService.viewBoard(var));
		model.addAttribute("boardListCnt", listCnt);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword); 
		model.addAttribute("kindInfo", boardService.selectBoardKind(kindCode));
		
		
		 
		
		return "board/board";
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping(value = "/boardWriteForm.do")
	public String boardWriteForm(Model model, BoardVO boardVO
			, @RequestParam (required = false) int chkKindCode
			, @RequestParam (required = false , defaultValue = "0") int originBoard) {
		
		model.addAttribute("adminKindList", boardService.selectBoardKindList());
		model.addAttribute("memberKindList", boardService.selectMemberBoardKindList());
		model.addAttribute("kindInfo", boardService.selectBoardKind(chkKindCode));
		model.addAttribute("originBoard", originBoard);
		
		return "board/boardWriteForm";
	}
	
	// 글쓰기 + 첨부파일 추가
	@RequestMapping(value = "/writeBoard.do")
	public String writeBoard(Model model, BoardVO board, MultipartHttpServletRequest fileList) throws IOException {
		//게시글 저장 (파일저장X)
				int kindCode = board.getKindOfBoard(); 
				board.setMemberId(board.getMemberId());
				int boardNum = boardService.insertBoard(board);
				
				System.out.println(fileList.getContentLength());
				
		
		//파일 저장
		 if(fileList != null){
             Iterator<String> iter = fileList.getFileNames();
             
             File destdir = new File(boardUploadPath); //디렉토리(경로)(applicationContext.xml에 선언되어있음) 가져오기
             
            //서버경로 (서버를 지우면 날라가는 경로)
//     		String buildPath = fileList.getSession().getServletContext().getRealPath("/resources/upload/");
//     		System.out.println(buildPath);
		        
		        if(!destdir.exists()){
		            destdir.mkdirs(); //디렉토리가 존재하지 않는다면 생성
		        }
             
             
             while(iter.hasNext()){
            	 
            	MultipartFile file = fileList.getFile(iter.next());
            	
            	//파일 크기를 조회한다
     			byte[] bytes = file.getBytes();
     			double fileSize =  Math.round((double)bytes.length/1024*100)/100.0;
     			
     			if(fileSize != 0) {
     				
     				String fileName = file.getOriginalFilename();
//     				String randomStr = getRandomStr(5);
         			String savedName = IsHoliday.getNowDate("yyyy-MM-dd_hh-mm-ss.SSS") + "_" + fileName;
         			File target = new File(boardUploadPath, savedName);
         			
         			try {
     		        //파일을 경로에 저장한다
     		        FileCopyUtils.copy(file.getBytes(), target);
         		        
         			} catch (IOException e) {
         				e.printStackTrace();
         			}
         			
         			//파일 이름 (원본, 서버), 게시판번호 데이터 베이스 저장
         			FileVO fileVO = new FileVO(); 
         			
         			fileVO.setBoardNum(boardNum);// 게시판번호 저장
         			//원본명
         			fileVO.setOriginFileName(fileName); 
         			//실제(서버)저장명
         			fileVO.setStoredFileName(savedName);
         			//파일 사이즈 저장
         			if(fileSize > 1024.0) {
         				fileSize = Math.round((double)bytes.length/1024/1024*100)/100.0;
         				String size = fileSize + " mb";
         				fileVO.setFileSize(size);
         			} else {
         				String size = fileSize + " kb";
         				fileVO.setFileSize(size);
         			}
         			
         			boardService.insertFile(fileVO);
     				
     			}
             }   
             
         }
		return "redirect:board.do?kindCode="+kindCode; 
	}
	
	
	//게시글 상세조회 (덧글도 조회함)
	@RequestMapping(value = "/boardDetail.do")
	public String boardDetail(Model model, @RequestParam int boardNum, @RequestParam(defaultValue = "Y") String cnt, int chkKindCode
			, HttpSession session) {
		String returnResult;
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardNum", boardNum);
		map.put("cnt", cnt);
		
		//게시글 정보
		
		
		BoardVO board = boardService.selectBoardDetail(map);
		model.addAttribute("board", board);   
		model.addAttribute("replyList", boardService.selectReply(boardNum)); 
		model.addAttribute("kindInfo", boardService.selectBoardKind(chkKindCode));
		model.addAttribute("chkKindCode", chkKindCode);
		model.addAttribute("fileList", boardService.selectBoardFile(board.getBoardNum()));
		
		
		if (((LoginInfoVO)session.getAttribute("loginInfo")) != null) {
			//세션이있을때 세션 아이디 값을 구해온다
			String sessionId = ((LoginInfoVO)session.getAttribute("loginInfo")).getMemberId();
			
			if(board.getIsSecret().equals("Y")) {
				//글쓴이 아이디
				String writerId = board.getMemberId();
						
				//답글 원본게시글의 글쓴이 아이디
				if(board.getOriginBoard() != 0) {
					String originWriterId = (boardService.getBoardDetail(board.getOriginBoard())).getMemberId();
					
					if(sessionId.equals(writerId)) {
						returnResult = "board/boardDetail";
						
					} else if (sessionId.equals(originWriterId)) {
						returnResult = "board/boardDetail";
						
					} else if (sessionId.equals("admin")) {
						returnResult = "board/boardDetail";
						
					} else { // 위 3가지의 조건을 만족하지 못했으면 실패 
						returnResult = "board/boardFail";
						
					}
					
				} else {
					
					if(sessionId.equals(writerId)) {
						returnResult = "board/boardDetail";
						
					} else if (sessionId.equals("admin")) {
						returnResult = "board/boardDetail";
						
					} else { // 위 3가지의 조건을 만족하지 못했으면 실패  
						returnResult = "board/boardFail";
						
					}
					
				}
				
			} else {
				returnResult = "board/boardDetail";
			}
			
			
		} else {
			//세션값이 없을때 비밀글이면 바로 실패
			if(board.getIsSecret().equals("Y")) {
				returnResult = "board/boardFail";
			} else {
				returnResult = "board/boardDetail";
			}
			
			
		}
		
			

		return returnResult; 
	}
	
	//덧글쓰기
	@RequestMapping(value = "/writeReply.do")
	public String writeReply(ReplyVO replyVO, String replySecret, int chkKindCode) {
		boardService.insertReply(replyVO);
		int boardNum = replyVO.getReplyBoardNum();
		return "redirect:boardDetail.do?boardNum="+boardNum+"&cnt=N&chkKindCode="+chkKindCode; 
	}
	
	//게시글 삭제
	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard(@RequestParam int kindCode, String[] deleteBoardNums, BoardVO boardVO) {
		List<String> deleteBoardNumList = Arrays.asList(deleteBoardNums);
		boardVO.setDeleteBoardNumList(deleteBoardNumList);
		
		//첨부파일 삭제
		//첨부파일 정보를 들고온다
		List<FileVO> files = boardService.selectBoardFileList(boardVO);
		
		
		
		if(files.size() != 0) {
			for (int i = 0; i < files.size(); i++) {
				//파일 경로를 불러오고 첨부파일을 삭제한다
				File file = new File(boardUploadPath + files.get(i).getStoredFileName()); // 삭제할 파일의 경로
				if(file.exists() == true){
					file.delete();
				}
				
			}
			
			
		}
		//게시글 파일 삭제
		boardService.deleteBoardFile(boardVO);
		
		//게시글 삭제
		boardService.deleteBoard(boardVO);
		

					
		
		
		return "redirect:board.do?kindCode="+kindCode; 
	}
	
	@RequestMapping(value = "/deleteReply.do")
	public String deleteReply(int boardNum, int replyNum, int chkKindCode) {
		boardService.deleteReply(replyNum);
		
		return "redirect:boardDetail.do?boardNum="+boardNum+"&cnt=N&chkKindCode="+chkKindCode; 
	}
	
	@RequestMapping(value = "/updateReply.do")
	public String updateReply(ReplyVO replyVO, int chkKindCode) {
		int boardNum = replyVO.getReplyBoardNum();
		boardService.updateReply(replyVO);
		
		return "redirect:boardDetail.do?boardNum="+boardNum+"&cnt=N&chkKindCode="+chkKindCode; 
	}
	
	//게시글 수정 form 가기
	@RequestMapping(value = "/boardUpdateForm.do")
	public String boardUpdateForm(Model model, BoardVO boardVO
			, @RequestParam (required = false) int chkKindCode) {
	
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardNum", boardVO.getBoardNum());
		map.put("cnt", "N");
		//게시글 정보
		model.addAttribute("board", boardService.selectBoardDetail(map));
		int ReplyListNum = boardService.getReplyBoardCnt(boardVO); //갯수
		
		model.addAttribute("fileList", boardService.selectBoardFile(boardVO.getBoardNum()));
		model.addAttribute("getReplyBoardCnt", ReplyListNum);
		model.addAttribute("adminKindList", boardService.selectBoardKindList()); 
		model.addAttribute("memberKindList", boardService.selectMemberBoardKindList());
		model.addAttribute("kindInfo", boardService.selectBoardKind(chkKindCode));
		
		
		return "board/boardUpdateForm"; 
	}
	
	//게시글 수정 하기 (파일도 수정해야함)
	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(BoardVO boardVO, int[] deleteFileNum, MultipartHttpServletRequest fileList) throws IOException {
		
		//수정할때 안에 있던 삭제(수정)한 파일
		if(deleteFileNum != null) {
			for (int i = 0; i < deleteFileNum.length; i++) {	
				
				
				//첨부파일 삭제
				//첨부파일 정보를 들고온다
				FileVO files = boardService.selectFile(deleteFileNum[i]);
				
				//파일 경로를 불러오고 첨부파일을 삭제한다
				File file = new File(boardUploadPath + files.getStoredFileName()); // 삭제할 파일의 경로
				if(file.exists() == true){
					file.delete();
				}
				
				
				System.out.println(deleteFileNum[i]);
				//게시글 파일 삭제 단일삭제
				boardService.deleteFile(deleteFileNum[i]);
			}
		}
		
		//파일 저장
		 if(fileList != null){
            Iterator<String> iter = fileList.getFileNames();
            
            File destdir = new File(boardUploadPath); //디렉토리(경로)(applicationContext.xml에 선언되어있음) 가져오기
            
           //서버경로 (서버를 지우면 날라가는 경로)
//    		String buildPath = fileList.getSession().getServletContext().getRealPath("/resources/upload/");
//    		System.out.println(buildPath);
		        
		        if(!destdir.exists()){
		            destdir.mkdirs(); //디렉토리가 존재하지 않는다면 생성
		        }
            
            
            while(iter.hasNext()){
           	 
           	MultipartFile file = fileList.getFile(iter.next());
           	
           	//파일 크기를 조회한다
    			byte[] bytes = file.getBytes();
    			double fileSize =  Math.round((double)bytes.length/1024*100)/100.0;
    			
    			if(fileSize != 0) {
    				
    				String fileName = file.getOriginalFilename();
    				
//    				String randomStr = getRandomStr(5);
    				String savedName = IsHoliday.getNowDate("yyyy-MM-dd_hh-mm-ss.SSS") + "_" + fileName;
         			
        			File target = new File(boardUploadPath, savedName);
        			
        			try {
    		        //파일을 경로에 저장한다
    		        FileCopyUtils.copy(file.getBytes(), target);
        		        
        			} catch (IOException e) {
        				e.printStackTrace();
        			}
        			
        			//파일 이름 (원본, 서버), 게시판번호 데이터 베이스 저장
        			FileVO fileVO = new FileVO(); 
        			
        			fileVO.setBoardNum(boardVO.getBoardNum());// 게시판번호 저장
        			//원본명
        			fileVO.setOriginFileName(fileName); 
        			//실제(서버)저장명
        			fileVO.setStoredFileName(savedName);
        			//파일 사이즈 저장
        			if(fileSize > 1024.0) {
        				fileSize = Math.round((double)bytes.length/1024/1024*100)/100.0;
        				String size = fileSize + " mb";
        				fileVO.setFileSize(size);
        			} else {
        				String size = fileSize + " kb";
        				fileVO.setFileSize(size);
        			}
        			
        			boardService.insertFile(fileVO);
    				
    			}
            }   
            
        }

		
		
		int boardNum = boardVO.getBoardNum();
		int kindCode = boardVO.getKindOfBoard();
		
		
		
		boardService.updateBoard(boardVO);
		
		return "redirect:boardDetail.do?boardNum="+boardNum+"&cnt=N&chkKindCode="+kindCode; 
	}
	
	//파일 다운로드
	@RequestMapping(value="downloadFile.do") 
	public void downloadFile(int fileNum, HttpServletResponse response) throws Exception { 
		
			FileVO file = boardService.selectFile(fileNum); 
			String originalFileName = file.getOriginFileName(); 
			String storedFileName = file.getStoredFileName(); 
			
			byte fileByte[] = FileUtils.readFileToByteArray(new File(boardUploadPath+storedFileName)); 
			response.setContentType("application/octet-stream"); 
			response.setContentLength(fileByte.length); 
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";"); 
			response.setHeader("Content-Transfer-Encoding", "binary"); 
			response.getOutputStream().write(fileByte); 
			response.getOutputStream().flush(); 
			response.getOutputStream().close(); 
			
			}


//	public String getRandomStr(int size) {
//		if(size > 0) {
//			char[] tmp = new char[size];
//			for(int i=0; i<tmp.length; i++) {
//				int div = (int) Math.floor( Math.random() * 2 );
//				
//				if(div == 0) { // 0이면 숫자로
//					tmp[i] = (char) (Math.random() * 10 + '0') ;
//				}else { //1이면 알파벳
//					tmp[i] = (char) (Math.random() * 26 + 'A') ;
//				}
//			}
//			return new String(tmp);
//		}
//		return "ERROR : Size is required."; 
//	}
}







