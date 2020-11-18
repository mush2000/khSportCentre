package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.ClassDayVO;
import com.spring.biz.vo.ClassInfoVO;
import com.spring.biz.vo.ClassListVO;
import com.spring.biz.vo.ClassesVO;
import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.MemberVO;
import com.spring.biz.vo.SurveyVO;

@Service("studentService") 
public class StudentServiceImpl implements StudentService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 전체 강좌 내용을 조회
	@Override
	public List<ClassesVO> classesList() {
		return sqlSession.selectList("selectClassesList");
	}
	
	@Override
	public List<ClassesVO> classesNameList() {
		return sqlSession.selectList("selectClassesNameList");
	}

	// 강좌의 상세정보를 조회
	@Override
	public ClassesVO classesDetail(ClassesVO classesVO) {
		ClassesVO vo = sqlSession.selectOne("selectClassesDetail", classesVO);
		// 강좌의 사진들을 조회
		List<String> list = sqlSession.selectList("selectClassesPicture", classesVO);
		
		vo.setClassesPic(list);
		return vo;
	}

	// 해당 종목의 강사 목록을 조회
	@Override
	public List<InstructorInfoVO> instInfo(int classesCode) {
		return sqlSession.selectList("instInfo", classesCode);
	}

	// 전체 강사정보를 조회
	@Override
	public List<InstructorInfoVO> instList() {
		return sqlSession.selectList("instList");
	}
	
	// 강습의 강습날을 선택하기 위해서 목록을 불러옴(월~금, 월수금, 화목)
	@Override
	public List<ClassDayVO> selectClassDayList(int classesCode) {
		return sqlSession.selectList("selectClassDayList", classesCode);
	}

	@Override
	public List<String> selectClassTimeList(ClassInfoVO classInfoVO) {
		return sqlSession.selectList("selectClassTimeList", classInfoVO);
	}
	
	@Override
	public ClassesVO selectMaxMinMember(int classesCode) {
		return sqlSession.selectOne("selectMaxMinMember", classesCode);
	}

	@Override
	public List<ClassInfoVO> selectClassLvList(ClassInfoVO classInfoVO) {
		return sqlSession.selectList("selectClassLvList", classInfoVO);
	}

	@Override
	public ClassInfoVO registerClass(int classNum) {
		return sqlSession.selectOne("registerClass", classNum);
	}

	// 회원이 게시판에 글을 작성 했는지를 조회
	@Override
	public List<BoardVO> myBoard(String memberId) {
		return sqlSession.selectList("myBoard", memberId);
	}
	
	@Override
	public List<BoardVO> myBoardList(String memberId) {
		return sqlSession.selectList("myBoardList", memberId);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertSurvey(SurveyVO surveyVO) {
		int result = sqlSession.insert("insertSurvey", surveyVO);;
		int r2 = insertSurveyNum(surveyVO);
		
		if(result + r2 != 2)
			try {
				throw new Exception();
			}
			catch (Exception e) {}
		return result;
	}

	@Override
	public int insertSurveyNum(SurveyVO surveyVO) {
		return sqlSession.update("insertSurveyNum", surveyVO);
	}

	@Override
	public SurveyVO selectSurvey(int surveyNum) {
		return sqlSession.selectOne("selectSurvey", surveyNum);
	}

	@Override
	public List<SurveyVO> surveyList(String memberId) {
		return sqlSession.selectList("surveyList", memberId);
	}

	@Override
	public List<MemberVO> nowClassStudentInfo(int classNum) {
		return sqlSession.selectList("nowClassStudentInfo", classNum);
	}

	@Override
	public SurveyVO pastClassSurveyScore(int classNum) {
		return sqlSession.selectOne("pastClassSurveyScore", classNum);
	}

	@Override
	public List<SurveyVO> pastClassSurveyOpinion(int classNum) {
		return sqlSession.selectList("pastClassSurveyOpinion", classNum);
	}

	@Override
	public List<MemberVO> pastClassStudentInfo(int classNum) {
		return sqlSession.selectList("pastClassStudentInfo", classNum);
	}

	// 강의관리시 오래된 REGISTER_CLASS 데이터가 있는지 확인
	@Override
	public List<Integer> oldRegisterClassNum() {
		return sqlSession.selectList("oldRegisterClassNum");
	}
	
	// 오래된 REGISTER_CLASS를 CLASS_LIST로 이동
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int copyOldRegisterClassToClassList(List<ClassListVO> list) {
		return sqlSession.insert("copyOldRegisterClassToClassList", list) + deleteOldRegisterClass(list);
	}

	@Override
	public int deleteOldRegisterClass(List<ClassListVO> list) {
		return sqlSession.delete("deleteOldRegisterClass", list);
	}

	@Override
	public int deleteRegisterClass(int regClassNum) {
		int classNum = sqlSession.selectOne("classNumOfRegClass", regClassNum);
		int result = sqlSession.delete("deleteRegisterClass", regClassNum);
		sqlSession.update("updateRegCnt", classNum);
		return result;
	}
	
	
}