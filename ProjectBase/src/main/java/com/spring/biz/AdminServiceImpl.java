package com.spring.biz;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.spring.biz.util.Pagination;
//import com.spring.biz.vo.ClassDayVO;
//import com.spring.biz.vo.ClassInfoVO;
//import com.spring.biz.vo.ClassLevelVO;
//import com.spring.biz.vo.ClassPlaceVO;
//import com.spring.biz.vo.ClassesVO;
//import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.MemberVO;

@Service("adminService") 
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;

//	@Override
//	public List<ClassesVO> getClassesList() {
//		return sqlSession.selectList("getClassesList");
//	}
//
//	@Override
//	public ClassesVO selectClasses(int classNum) {
//		return sqlSession.selectOne("selectClasses", classNum);
//	}
//
//	
//	@Override
//	public List<ClassPlaceVO> selectClassPlaceAll() {
//		return sqlSession.selectList("selectClassPlaceAll");
//	}
//
//	@Override
//	public List<ClassPlaceVO> selectClassPlaceFront(int frontPlaceCode) {
//		return sqlSession.selectList("selectClassPlaceFront", frontPlaceCode);
//	}
//
//	@Override
//	public List<ClassDayVO> selectClassDay(int frontDayCode) {
//		return sqlSession.selectList("selectClassDay", frontDayCode);
//	}
//
//	@Override
//	public List<InstructorInfoVO> selectInstructorInfo(int classesCode) {
//		return sqlSession.selectList("selectInstructorInfo", classesCode);
//	}
//
//	@Override
//	public List<ClassLevelVO> selectClassLevel() {
//		return sqlSession.selectList("selectClassLevel");
//	}
//
//	@Override
//	public ClassInfoVO selectClassInfo(int classNum) {
//		return sqlSession.selectOne("selectClassInfo", classNum);
//	}
//
//	@Override
//	public int modifyClassInfo(ClassInfoVO classInfoVO) {
//		return sqlSession.update("modifyClassInfo", classInfoVO);
//	}
//
//	@Override
//	public List<MemberVO> selectMemberInfoList(Map<String, Object> memberPageDelYn) {
//		return sqlSession.selectList("selectMemberInfoList", memberPageDelYn);
//	}
	
	// 삭제여부, 키워드를 이용해서 회원을 조회
	@Override
	public List<MemberVO> selectMemberInfoList2(Map<String, Object> memberPageDelYn) {
		return sqlSession.selectList("selectMemberInfoList2", memberPageDelYn);
	}
	
//	@Override
//	public int getListCnt(String fromTable) {
//		return sqlSession.selectOne("getListCnt", fromTable);
//	}

	// 해당테이블(회원)의 개수를 조회
	@Override
	public int getListCntMap(Map<String, Object> listCntMap) {
		return sqlSession.selectOne("getListCntMap", listCntMap);
	}
	
}