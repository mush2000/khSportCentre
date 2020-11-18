package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.ClassDayVO;
import com.spring.biz.vo.ClassInfoVO;
import com.spring.biz.vo.ClassListVO;
import com.spring.biz.vo.ClassesVO;
import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.MemberVO;
import com.spring.biz.vo.SurveyVO;

public interface StudentService {
	
	// 전체 강좌내용을 조회
	List<ClassesVO> classesList();
	
	List<ClassesVO> classesNameList();
	
	// 강좌의 상세정보를 조회
	ClassesVO classesDetail(ClassesVO classesVO);
	
	// 해당 종목의 강사 목록을 조회
	List<InstructorInfoVO> instInfo(int classesCode);
	
	// 전체 강사정보를 조회
	List<InstructorInfoVO> instList();

	// 강습의 강습날을 선택하기 위해서 목록을 불러옴(월~금, 월수금, 화목)
	List<ClassDayVO> selectClassDayList(int classesCode);
	
	List<String> selectClassTimeList(ClassInfoVO classInfoVO);

	ClassesVO selectMaxMinMember(int classesCode);

	List<ClassInfoVO> selectClassLvList(ClassInfoVO classInfoVO);
	
	ClassInfoVO registerClass(int classNum);
	
	// 회원이 게시판에 글을 작성 했는지를 조회
	List<BoardVO> myBoard(String memberId);
	
	List<BoardVO> myBoardList(String memberId);
	
	int insertSurvey(SurveyVO surveyVO);
	
	int insertSurveyNum(SurveyVO surveyVO);
	
	SurveyVO selectSurvey(int surveyNum);
	
	List<SurveyVO> surveyList(String memberId);
	
	List<MemberVO> nowClassStudentInfo(int classNum);
	
	SurveyVO pastClassSurveyScore(int classNum);
	
	List<SurveyVO> pastClassSurveyOpinion(int classNum);
	
	List<MemberVO> pastClassStudentInfo(int classNum);
	
	// 강의관리시 오래된 REGISTER_CLASS 데이터가 있는지 확인
	List<Integer> oldRegisterClassNum();
	
	// 오래된 REGISTER_CLASS를 CLASS_LIST로 이동
	int copyOldRegisterClassToClassList(List<ClassListVO> list);
	
	int deleteOldRegisterClass(List<ClassListVO> list);
	
	int deleteRegisterClass(int regClassNum);
	
}
