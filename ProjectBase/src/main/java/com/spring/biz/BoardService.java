package com.spring.biz;

import java.util.List;
import java.util.Map;

import com.spring.biz.vo.BoardKindVO;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.FileVO;
import com.spring.biz.vo.ReplyVO;


public interface BoardService {
	//게시판 글 갯수 불러오기 ( 페이징처리가 안된 검색결과(글 조회 쿼리)의 갯수를 불러옴
	int getBoardListCnt(Map<String, Object> var);
	//게시판 글 조회 (페이징처리와 게시글 종류를 넣습니다)
	List<BoardVO> viewBoard(Map<String, Object> var);
	//게시판 종류 조회 (전체조회)
	List<BoardKindVO> selectBoardKindList();
	//게시판 종류조회 (일반회원이 글쓰기할경우)
	List<BoardKindVO> selectMemberBoardKindList();
	//게시글 조회 (조회수 증가O)
	BoardVO selectBoardDetail(Map<String, Object> map);
	//게시글 조회 (주회수 증가X) 
	BoardVO getBoardDetail(int boardNum);
	//조회수 증가
	int upViewCount(int boardNum);
	//게시판 코드로 게시판 정보(이름,코드) 가져오기
	BoardKindVO selectBoardKind(int kindCode);
	//게시판 덧글조회
	List<ReplyVO> selectReply(int boardNum);
	//게시판 덧글쓰기
	int insertReply(ReplyVO replyVO);
	//게시판 글쓰기(답글포함)
	int insertBoard(BoardVO boardVO);
	//게시글 삭제(덧글부터삭제해야함 트렌젝션 처리)
	int deleteBoard(BoardVO boardVO);
	//게시글 수정
	int updateBoard(BoardVO boardVO);
	//덧글 삭제
	int deleteReply(int replyNum);
	//덧글 수정
	int updateReply(ReplyVO replyVO);
	//게시판 답글 여부 확인(갯수리턴)
	int getReplyBoardCnt(BoardVO boardVO);
	//게시판 답글 정보 불러오기
	BoardVO selectReplyBoardList(BoardVO boardVO);
	//게시글 파일 추가
	int insertFile(FileVO fileVO);
	//게시글 파일 정보 불러오기 (다중삭제 할때 List)
	List<FileVO> selectBoardFileList(BoardVO boardVO);
	//게시글 파일 정보 불러오기 (게시글 번호로 파일조회)
	List<FileVO> selectBoardFile(int boardNum);
	//게시글 파일 정보 불러오기 (파일번호로 파일조회)
	FileVO selectFile(int fileNum);
	//게시글 안에있는 모든 첨부파일 삭제
	int deleteBoardFile(BoardVO boardVO);
	//게시글 안에있는 파일중 선택된 파일만 삭제(수정폼)
	int deleteFile(int fileNum);
	

}	




















