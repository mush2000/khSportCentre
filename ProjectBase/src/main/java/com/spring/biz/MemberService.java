package com.spring.biz;

import java.util.List;
import java.util.Map;

import com.spring.biz.vo.ClassDayVO;
import com.spring.biz.vo.ClassInfoVO;
import com.spring.biz.vo.ClassLevelVO;
import com.spring.biz.vo.ClassListVO;
import com.spring.biz.vo.ClassPlaceVO;
import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.LoginInfoVO;
import com.spring.biz.vo.MemberVO;
import com.spring.biz.vo.RentalPlaceVO;

public interface MemberService {
	// 입력받은 정보로 새로운 회원 정보를 저장
	int insertMember(MemberVO memberVO);
	
	String checkId(String memberId);
	
	String checkDelYn(String memberId);
	
	// 로그인 할 때 입력받은 ID와 비밀번호가 정확한지 확인하여 로그인처리
	LoginInfoVO login(MemberVO memberVO);
	
	// 로그인시 비밀번호 틀린회수를 조회
	int checkWrongPwCnt(MemberVO memberVO);
	
	// 비밀번호를 찾기위해 입력한정보가 맞는지 확인하여 맞으면 ID값을 넘겨줌
	String searchPw(MemberVO memberVO);
	
	// 비밀번호 찾기를 통해 새로 만든 비밀번호를 저장
	int newPw(MemberVO memberVO);

	String searchId(MemberVO memberVO);
	
	// 내정보관리에서 회원의 정보를 조회
	MemberVO memberInfo(String memberId);
	
	// 회원 상세 정보를 조회
	MemberVO memberInfoByAdmin(String memberId);
	
	// 회원이 강사면 강사상세정보를 조회
	InstructorInfoVO instDetail(String memberId);

	// 회원이 강사면 강사상세정보를 조회
	InstructorInfoVO instDetailByAdmin(String memberId);
	
	int changePw(MemberVO memberVO);
	
	int changeAddr(MemberVO memberVO);
	
	int changeTel(MemberVO memberVO);
	
	int changeTel2(MemberVO memberVO);
	
	int changeEmail(MemberVO memberVO);
	
	int registerClass(ClassListVO classListVO);
	
	// 현재 강습중이거나 다음달 신청한 강습을 조회
	List<ClassListVO> regClassList(String memberId);
	
	// 이전 수강정보를 조회
	List<ClassListVO> selectClassList(String memberId);
	
	// 수강중인 반과 수강신청중인 반을 조회
	List<ClassInfoVO> registerClassList(String memberId);
	
	List<ClassInfoVO> myClassList(String memberId);
	
	List<ClassInfoVO> checkRegclass(String memberId);
	
	int withdrawMember(MemberVO memberVO);
	
	// 관리자가 회원을 탈퇴시킴
	int withdrawMemberByAdmin(MemberVO memberVO);
	
	// 관리자가 탈퇴된 회원을 복구함
	int restoreMemberByAdmin(MemberVO memberVO);
	
	// 강사인 경우 강습반이 있는지를 조회
	List<ClassInfoVO> selectInstClassList(String memberId);
	
	List<ClassInfoVO> instClassInfoList(String memberId);
	
	// 회원의 대관 정보를 조회
	List<RentalPlaceVO> selectMyRentalPlaceInfo(String memberId);
	
	List<RentalPlaceVO> pastMyRentalPlaceInfo(String memberId);
	
	int updateNote(MemberVO memberVO);
	
	// 강사관리에서 페이지작업을 위해 강사수를 조회
	int selectInstCnt(Map<String, Object> listCntMap);
	
	// 강사관리에서 강사목록을 조회
	List<InstructorInfoVO> selectInstInfoByAdmin(Map<String, Object> InstDelYnList);
	
	// 페이지작업을 위해서 이번달(다음달)전체 강습반 개수를 가져옴
	int selectClassesCnt(ClassInfoVO classInfoVO);
	
	// 강의관리 페이지에 출력할 이번달(다음달) 강습반을 조회
	List<ClassInfoVO> selectClassInfoList2(Map<String, Object> classInfoMap);
	
	// 강의관리 페이지에 출력할 다음달 강습반 중 현재 신청한 수강생이 있는 반을 조회
	List<Integer> selectClassInfoListStudent(ClassInfoVO classInfoVO);
	
	// 다음달에 강습을 추가
	int insertNextMonthClass(int classNum);
	
	// 다음달에 강습을 여러개 동시에 추가
	int insertNextMonthClassList(RentalPlaceVO classNumList);
	
	// 다음달에 새로운 강습을 개설
	int insertNewNextMonthClass(ClassInfoVO classInfoVO);
	
	// 다음달에 개설된 강습을 삭제
	int deleteNextMonthClass(int classNum);
	
	// 다음달에 개설된 강습을 여러개 동시에 삭제
	int deleteNextMonthClassList(RentalPlaceVO classNumList);
	
	// 강습관리 페이지에서 해당 종목의 강습수준 리스트를 조회
	List<ClassLevelVO> selectClassLevelList(int classesCode);
	
	// 강습관리 페이지에서 해당 종목의 장소 이름을 조회
	List<ClassPlaceVO> selectRegClassPlaceList(int classesCode);
	
	// 강습관리 페이지에서 해당 종목이 매일 하는지 격일로 하는지 조회
	List<ClassDayVO> selectRegClassDayList(int classesCode);
	
	// 강의관리 페이지에서 해당 종목의 강사 리스트를 조회
	List<InstructorInfoVO> selectInstructorList2(int classesCode);
	
	// 강사를 추가, 삭제 강사지원자를 합격 탈락 시킨다.
	int updateInstructorInstDel(InstructorInfoVO instructorInfoVO);
	
	int sendResume(InstructorInfoVO instructorInfoVO);
	
	List<InstructorInfoVO> selectClassesCodeForResume(String memberId);
	
	// 다음달 헬쓰가 개설됐는지 확인
	int selectNextHealthClassExist(String classDate);
	
	// 수강신청 종료후 인원 미달인 반이 있는지 확인
	int lackOfRegMemberClassCnt();
	
	// 수강신청 종료후 인원 미달인 반을 폐강
	int cancelLackOfRegMemberClass();
	
	// 폐강된 반을 공지하기 위해서 목록을 불러옴
	List<ClassInfoVO> lackOfRegMemberClassList();
	
	// 지난달에 폐강된 반이 있는지 조회
	int lastMonthLackOfRegMemberClassCnt();
	
	// 지난달에 폐강된 반에 신청한 정보를 삭제
	int deleteLackOfRegMemberRegisterClass();
	
	// 지난달 폐강된 반에 신청한 정보를 삭제하고 폐강된 반을 삭제한다
	int deleteLackOfRegMemberClass();
}
