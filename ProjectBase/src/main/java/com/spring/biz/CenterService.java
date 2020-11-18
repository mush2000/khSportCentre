package com.spring.biz;

import java.util.List;
import java.util.Map;

import com.spring.biz.vo.ClassPlaceVO;
import com.spring.biz.vo.MainBoardVO;
import com.spring.biz.vo.RentalPlaceVO;
import com.spring.biz.vo.SearchClassVO;
import com.spring.biz.vo.SearchVO;

public interface CenterService {
	//대관 정보 리스트
	List<ClassPlaceVO> selectClassPlaceList();
	
	//예약 상황 조회
	List<RentalPlaceVO> selectReserveStatusList(RentalPlaceVO rentalPlaceVO);
	
	//예약신청 step1 -> step2 화면전환
	List<RentalPlaceVO> selectStep1(RentalPlaceVO rentalPlaceVO);
	
	//예약신청 step2 -> step3 화면전환
	RentalPlaceVO selectStep2(RentalPlaceVO rentalPlaceVO);
	
	//대관 예약하기
	int insertReserve(RentalPlaceVO rentalPlaceVO);
	
	//메인 검색창
	List<SearchClassVO> selectSearchClassList(Map<String, Object> map);
	
	//메인 공지사항 리스트 조회
	List<MainBoardVO> selectNoticeList();
	
	//메인 Q&A 리스트 조회
	List<MainBoardVO> selectQnaList();
	
	//메인 FAQ 리스트 조회
	List<MainBoardVO> selectFaqList();
	
	//검색내역 총 수량
	int selectSearchPageCnt(String searchWord);
	
	//예약내역 리스트 조회
	List<RentalPlaceVO> selectRentalList(SearchVO searchVO);
	
	//예약승인
	int updateRentalApprovalYN(RentalPlaceVO rentalPlaceVO);
	
	//예약취소
	int deleteRental(String	rentalCode);
	
	//선택예약승인
	int updateRentalApprovalYNList(RentalPlaceVO rentalPlaceVO);
	
	//선택예약취소
	int deleteRentalList(RentalPlaceVO rentalPlaceVO);
	
	//신규예약 배지알람
	int selectPlaceRentalCnt();
	
}




















