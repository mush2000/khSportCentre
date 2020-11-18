package com.spring.biz;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.ClassPlaceVO;
import com.spring.biz.vo.MainBoardVO;
import com.spring.biz.vo.RentalPlaceVO;
import com.spring.biz.vo.SearchClassVO;
import com.spring.biz.vo.SearchVO;

@Service("centerService") 
public class CenterServiceImpl implements CenterService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//대관 정보 리스트 
	@Override
	public List<ClassPlaceVO> selectClassPlaceList() {
		return sqlSession.selectList("selectClassPlaceList");
	}

	//예약 상황 조회
	@Override
	public List<RentalPlaceVO> selectReserveStatusList(RentalPlaceVO rentalPlaceVO) {
		return sqlSession.selectList("selectReserveStatus", rentalPlaceVO);
	}
	
	//예약신청 step1 -> step2 화면전환
	@Override
	public List<RentalPlaceVO> selectStep1(RentalPlaceVO rentalPlaceVO) {
		return sqlSession.selectList("selectStep1", rentalPlaceVO);
	}
	
	//예약신청 step2 -> step3 화면전환
	@Override
	public RentalPlaceVO selectStep2(RentalPlaceVO rentalPlaceVO) {
		return sqlSession.selectOne("selectStep2", rentalPlaceVO);
	}

	//대관 예약하기
	@Override
	public int insertReserve(RentalPlaceVO rentalPlaceVO) {
		return sqlSession.insert("insertReserve", rentalPlaceVO);
	}

	//메인 검색창
	@Override
	public List<SearchClassVO> selectSearchClassList(Map<String, Object> map) {
		return sqlSession.selectList("selectSearchClassList", map);
	}

	//메인 공지사항 리스트 조회
	@Override
	public List<MainBoardVO> selectNoticeList() {
		return sqlSession.selectList("selectNoticeList");
	}

	//메인 Q&A 리스트 조회
	@Override
	public List<MainBoardVO> selectQnaList() {
		return sqlSession.selectList("selectQnaList");
	}

	//메인 FAQ 리스트 조회
	@Override
	public List<MainBoardVO> selectFaqList() {
		return sqlSession.selectList("selectFaqList");
	}

	//검색내역 총수량
	@Override
	public int selectSearchPageCnt(String searchWord) {
		return sqlSession.selectOne("selectSearchPageCnt", searchWord);
	}

	//예약내역 리스트 조회
	@Override
	public List<RentalPlaceVO> selectRentalList(SearchVO searchVO) {
		return sqlSession.selectList("selectRentalList", searchVO);
	}

	//예약승인
	@Override
	public int updateRentalApprovalYN(RentalPlaceVO rentalPlaceVO) {
		return sqlSession.update("updateRentalApprovalYN", rentalPlaceVO);
	}

	//예약취소
	@Override
	public int deleteRental(String rentalCode) {
		return sqlSession.delete("deleteRental", rentalCode);
	}

	//선택예약승인
	@Override
	public int updateRentalApprovalYNList(RentalPlaceVO rentalPlaceVO) {
		return sqlSession.update("updateRentalApprovalYNList", rentalPlaceVO);
	}

	//선택예약취소
	@Override
	public int deleteRentalList(RentalPlaceVO rentalPlaceVO) {
		return sqlSession.delete("deleteRentalList", rentalPlaceVO);
	}

	//신규예약 배지알람
	@Override
	public int selectPlaceRentalCnt() {
		return sqlSession.selectOne("selectPlaceRentalCnt");
	}
	
	
}












