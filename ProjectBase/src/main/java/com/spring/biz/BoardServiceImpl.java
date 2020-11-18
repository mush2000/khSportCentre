package com.spring.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.BoardKindVO;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.FileVO;
import com.spring.biz.vo.ReplyVO;

@Service("boardService") 
public class BoardServiceImpl implements BoardService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//게시글 목록 보여주기
	@Override
	public List<BoardVO> viewBoard(Map<String, Object> var) {
		return sqlSession.selectList("viewBoard", var);
	}

	//게시글 갯수 가져오기
	@Override
	public int getBoardListCnt(Map<String, Object> var) {
		return sqlSession.selectOne("getBoardListCnt", var);
	}

	//게시판 종류 리스트 불러오기 (전체)
	@Override
	public List<BoardKindVO> selectBoardKindList() {
		return sqlSession.selectList("selectBoardKindList");
	}

	
	//게시글 상세조회 (실제 jsp에 띄우는 게시글 상세조회)
	@Override
	@Transactional
	public BoardVO selectBoardDetail(Map<String, Object> map) {
		int boardNum = Integer.parseInt(String.valueOf(map.get("boardNum")));
		String cnt = String.valueOf(map.get("cnt"));
		if(cnt.equals("Y")) {
			upViewCount(boardNum);
		}
		return sqlSession.selectOne("selectBoardDetail", boardNum);
	}
	
	
	//게시글 정보 상세조회 (controller에서 정보대조를 위해 사용) 
	@Override
	public BoardVO getBoardDetail(int boardNum) {
		return sqlSession.selectOne("selectBoardDetail", boardNum);
	}

	
	//조회수 증가
	@Override
	public int upViewCount(int boardNum) {
		return sqlSession.update("upViewCount", boardNum);
	}

	//게시글 종류 상세정보 불러오기
	@Override
	public BoardKindVO selectBoardKind(int kindCode) {
		return sqlSession.selectOne("selectBoardKind", kindCode);
	}

	//덧글 목록 불러오기
	@Override
	public List<ReplyVO> selectReply(int boardNum) {
		return sqlSession.selectList("selectReply", boardNum);
	}

	//덧글 추가
	@Override
	public int insertReply(ReplyVO replyVO) {
		return sqlSession.insert("insertReply", replyVO);
	}

	//게시판 종류 리스트 불러오기 (일반회원일 경우 쓸수있는 게시판)
	@Override
	public List<BoardKindVO> selectMemberBoardKindList() {
		return sqlSession.selectList("selectMemberBoardKindList");
	}

	//게시글 쓰기
	@Override
	public int insertBoard(BoardVO boardVO) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardVO", boardVO);
		sqlSession.insert("insertBoard", map);
		int result = (int) map.get("BOARD_NUM");
		return result;
	}

	
	//게시글 삭제 (다중삭제도 가능)
	@Transactional
	@Override
	public int deleteBoard(BoardVO boardVO) {
		//답글 덧글 삭제
		//가져온 삭제할 게시글 번호 리스트를 for 문을 돌림
		for(String deleteBoard : boardVO.getDeleteBoardNumList()) {
			//해당 게시글에 답글이 있는지 체크하면서 답글이있으면 답글의 게시글번호를 가져와서 replyBoardVO에 넣는다
			BoardVO replyBoardVO = new BoardVO();
			
			
			replyBoardVO.setDeleteBoardNumList(sqlSession.selectList("selectReplyBoard", deleteBoard));
			//가져온 답글의 게시글번호가 있으면 답글의 덧글을 삭제한다
			if(replyBoardVO.getDeleteBoardNumList().size() != 0) {
				sqlSession.delete("deleteBoardReply", replyBoardVO);
			}
		}
		//답글삭제
		sqlSession.delete("deleteReplyBoard", boardVO);
		//덧글삭제
		sqlSession.delete("deleteBoardReply", boardVO);
		//본문삭제
		return sqlSession.delete("deleteBoard", boardVO);
		
	}

	//덧글 개별삭제
	@Override
	public int deleteReply(int replyNum) {
		return sqlSession.delete("deleteReply", replyNum);
	}

	//덧글 수정
	@Override
	public int updateReply(ReplyVO replyVO) {
		return sqlSession.update("updateReply", replyVO);
	}

	//게시글 수정
	@Transactional
	@Override
	public int updateBoard(BoardVO boardVO) {
		Map<String, Object> updateBoardListMap = new HashMap<>();
		//수정할 게시글의 답글까지 조회를 한다
		List<Integer> updateBoardList = sqlSession.selectList("selectReplyBoardList", boardVO);
		
		//만약 수정할게시글에 답글이 있으면 답글의 게시판종류를 이동시킨다
		if (updateBoardList.size() > 0) {
			updateBoardListMap.put("boardNumList", updateBoardList);
			updateBoardListMap.put("kindCode", boardVO.getKindOfBoard());
			
			sqlSession.update("updateBoardList", updateBoardListMap);
		}
		
		return sqlSession.update("updateBoard", boardVO);
	}

	//답글 개수 리턴
	@Override
	public int getReplyBoardCnt(BoardVO boardVO) {
		return sqlSession.selectOne("getReplyBoardCnt", boardVO);
	}
	
	//게시글에 달려있는 답글 정보 불러오기
	@Override
	public BoardVO selectReplyBoardList(BoardVO boardVO) {
		return sqlSession.selectOne("selectReplyBoardList", boardVO);
	}

	@Override
	public int insertFile(FileVO fileVO) {
		return sqlSession.insert("insertFile", fileVO);
	}


	@Override
	public List<FileVO> selectBoardFile(int boardNum) {
		return sqlSession.selectList("selectBoardFile", boardNum);
	}
	
	@Override
	public FileVO selectFile(int fileNum) {
		return sqlSession.selectOne("selectFile", fileNum);
	}

	@Override
	public int deleteBoardFile(BoardVO boardVO) {
		return sqlSession.delete("deleteBoardFile", boardVO);
	}

	@Override
	public List<FileVO> selectBoardFileList(BoardVO boardVO) {
		return sqlSession.selectList("selectBoardFileList", boardVO);
	}

	@Override
	public int deleteFile(int fileNum) {
		return sqlSession.delete("deleteFile", fileNum);
	}

	

	
	
	

	
}












