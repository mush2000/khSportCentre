package com.spring.biz;

import java.util.List;
import java.util.Map;

//import org.apache.ibatis.annotations.Param;

//import com.spring.biz.util.Pagination;
import com.spring.biz.vo.ClassDayVO;
import com.spring.biz.vo.ClassInfoVO;
import com.spring.biz.vo.ClassLevelVO;
import com.spring.biz.vo.ClassPlaceVO;
import com.spring.biz.vo.ClassesVO;
import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.MemberVO;


public interface AdminService {
//	List<ClassesVO> getClassesList();
//	ClassesVO selectClasses(int classNum);
//	List<ClassPlaceVO> selectClassPlaceFront(int frontPlaceCode);
//	List<ClassPlaceVO> selectClassPlaceAll();
//	List<ClassDayVO> selectClassDay(int frontDayCode);
//	List<InstructorInfoVO> selectInstructorInfo(int classesCode);
//	List<ClassLevelVO> selectClassLevel();
//	int getListCnt(String fromTable);
	
	// 해당테이블(회원)의 개수를 조회
	int getListCntMap(Map<String, Object> listCntMap);
	
//	ClassInfoVO selectClassInfo(int classNum);
//	int modifyClassInfo(ClassInfoVO classInfoVO);
//	List<MemberVO> selectMemberInfoList(Map<String, Object> memberPageDelYn);
	
	// 삭제여부, 키워드를 이용해서 회원을 조회
	List<MemberVO> selectMemberInfoList2(Map<String, Object> memberPageDelYn);
}	




















