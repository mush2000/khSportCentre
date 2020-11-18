package com.spring.biz;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.ClassDayVO;
import com.spring.biz.vo.ClassInfoVO;
import com.spring.biz.vo.ClassLevelVO;
import com.spring.biz.vo.ClassListVO;
import com.spring.biz.vo.ClassPlaceVO;
import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.LoginInfoVO;
import com.spring.biz.vo.MemberVO;
import com.spring.biz.vo.RentalPlaceVO;

@Service("memberService") 
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 입력받은 정보로 새로운 회원 정보를 저장
	@Override
	public int insertMember(MemberVO memberVO) {
		return sqlSession.insert("insertMember", memberVO);
	}

	@Override
	public String checkId(String memberId) {
		return sqlSession.selectOne("checkId", memberId);
	}

	@Override
	public String checkDelYn(String memberId) {
		return sqlSession.selectOne("checkDelYn", memberId);
	}
	
	// 로그인 할 때 입력받은 ID와 비밀번호가 정확한지 확인하여 로그인처리
	@Override
	public LoginInfoVO login(MemberVO memberVO) {
		// 로그인시 입력받은 정보로 ID, 이름, 비밀번호 틀린 회수를 조회
		LoginInfoVO loginInfoVO = sqlSession.selectOne("loginMemberInfo", memberVO);
		// 조회된 정보가 있을 때
		if(loginInfoVO != null) {
			// 비밀번호 틀린 적이 있으면 회수를 0으로 초기화
			if(loginInfoVO.getWrongPwCnt() != 0)
				sqlSession.update("setWrongPwCntZero", memberVO);
			// 로그인 회원이 강사이면 강사번호를 조회
			List<LoginInfoVO> vo = sqlSession.selectList("loginInstructorInfo", memberVO);
			// 만약 여러종목의 강사면 첫번째 강사번호를 대표로 로그인정보에 저장
			if (vo.size() != 0)
				loginInfoVO.setInstNum(vo.get(0).getInstNum());
		} else {
			loginInfoVO = new LoginInfoVO();
			// 로그인 실패시 아이디가 있고 비번이 틀린경우라면 틀린 원인을 로그인정보에 저장하고 비번 틀린 회수를 1증가
			loginInfoVO.setWrongId(checkId(memberVO.getMemberId()) == null || checkDelYn(memberVO.getMemberId()).equals("Y"));
			if(!loginInfoVO.isWrongId())
				sqlSession.update("wrongPw", memberVO);
		}
		return loginInfoVO;
	}
	
	// 로그인시 비밀번호 틀린회수를 조회
	@Override
	public int checkWrongPwCnt(MemberVO memberVO) {
		return sqlSession.selectOne("checkWrongPwCnt", memberVO);
	}

	// 비밀번호를 찾기위해 입력한정보가 맞는지 확인하여 맞으면 ID값을 넘겨줌
	@Override
	public String searchPw(MemberVO memberVO) {
		return sqlSession.selectOne("searchPw", memberVO);
	}

	// 비밀번호 찾기를 통해 새로 만든 비밀번호를 저장
	@Override
	public int newPw(MemberVO memberVO) {
		return sqlSession.update("newPw", memberVO);
	}

	@Override
	public String searchId(MemberVO memberVO) {
		return sqlSession.selectOne("searchId", memberVO);
	}

	// 내정보관리에서 회원의 정보를 조회
	@Override
	public MemberVO memberInfo(String memberId) {
		return sqlSession.selectOne("memberInfo", memberId);
	}

	// 회원 상세 정보를 조회
	@Override
	public MemberVO memberInfoByAdmin(String memberId) {
		return sqlSession.selectOne("memberInfoByAdmin", memberId);
	}
	
	// 회원이 강사면 강사상세정보를 조회
	@Override
	public InstructorInfoVO instDetail(String memberId) {
		List<InstructorInfoVO> list = sqlSession.selectList("instDetail", memberId);
		if(list.size() != 0) {
			InstructorInfoVO result = list.get(0);
			// 여러종목의 강사인 경우 대표 정보만 보여주고 종목은 모두 보여줌
			for(int i = 1 ; i < list.size() ; i++)
				list.get(0).setClassesName(list.get(0).getClassesName() + ", " + list.get(i).getClassesName());
			return result;
		} else return null;
	}
	
	// 회원이 강사면 강사상세정보를 조회
	@Override
	public InstructorInfoVO instDetailByAdmin(String memberId) {
		List<InstructorInfoVO> list = sqlSession.selectList("instDetailByAdmin", memberId);
		// 회원이 여러 종목의 강사면 첫번째 정보만 보내고 종목은 전부를 나열해서 보내준다
		if(list.size() != 0) {
			InstructorInfoVO result = list.get(0);
			
			for(int i = 1 ; i < list.size() ; i++)
				list.get(0).setClassesName(list.get(0).getClassesName() + ", " + list.get(i).getClassesName());
			return result;
		} else return null;
	}

	@Override
	public int changePw(MemberVO memberVO) {
		return sqlSession.update("changePw", memberVO);
	}

	@Override
	public int changeAddr(MemberVO memberVO) {
		return sqlSession.update("changeAddr", memberVO);
	}

	@Override
	public int changeTel(MemberVO memberVO) {
		return sqlSession.update("changeTel", memberVO);
	}

	@Override
	public int changeTel2(MemberVO memberVO) {
		return sqlSession.update("changeTel2", memberVO);
	}

	@Override
	public int changeEmail(MemberVO memberVO) {
		return sqlSession.update("changeEmail", memberVO);
	}

	@Override
	public int registerClass(ClassListVO classListVO) {
		int result = sqlSession.insert("regsterClass", classListVO);
		sqlSession.update("updateRegCnt", classListVO);
		return result;
	}

	// 현재 강습중이거나 다음달 신청한 강습을 조회
	@Override
	public List<ClassListVO> regClassList(String memberId) {
		return sqlSession.selectList("regClassList", memberId);
	}

	// 이전 수강정보를 조회
	@Override
	public List<ClassListVO> selectClassList(String memberId) {
		return sqlSession.selectList("selectClassList", memberId);
	}

	// 수강중인 반과 수강신청중인 반을 조회
	@Override
	public List<ClassInfoVO> registerClassList(String memberId) {
		return sqlSession.selectList("registerClassList", memberId);
	}
	
	@Override
	public List<ClassInfoVO> myClassList(String memberId) {
		return sqlSession.selectList("myClassList", memberId);
	}

	@Override
	public List<ClassInfoVO> checkRegclass(String memberId) {
		return sqlSession.selectList("checkRegclass", memberId);
	}

	@Override
	public int withdrawMember(MemberVO memberVO) {
		return sqlSession.update("withdrawMember", memberVO);
	}
	
	// 관리자가 회원을 탈퇴시킴
	@Override
	public int withdrawMemberByAdmin(MemberVO memberVO) {
		return sqlSession.update("withdrawMemberByAdmin", memberVO);
	}
	
	// 관리자가 탈퇴된 회원을 복구함
	@Override
	public int restoreMemberByAdmin(MemberVO memberVO) {
		return sqlSession.update("restoreMemberByAdmin", memberVO);
	}

	// 강사인 경우 강습반이 있는지를 조회
	@Override
	public List<ClassInfoVO> selectInstClassList(String memberId) {
		return sqlSession.selectList("selectInstClassList", memberId);
	}

	@Override
	public List<ClassInfoVO> instClassInfoList(String memberId) {
		return sqlSession.selectList("instClassInfoList", memberId);
	}

	// 회원의 대관 정보를 조회
	@Override
	public List<RentalPlaceVO> selectMyRentalPlaceInfo(String memberId) {
		return sqlSession.selectList("selectMyRentalPlaceInfo", memberId);
	}

	@Override
	public List<RentalPlaceVO> pastMyRentalPlaceInfo(String memberId) {
		return sqlSession.selectList("pastMyRentalPlaceInfo", memberId);
	}

	@Override
	public int updateNote(MemberVO memberVO) {
		return sqlSession.update("updateNote", memberVO);
	}

	// 강사관리에서 페이지작업을 위해 강사수를 조회
	@Override
	public int selectInstCnt(Map<String, Object> listCntMap) {
		return sqlSession.selectOne("selectInstCnt", listCntMap);
	}

	// 강사관리에서 강사목록을 조회
	@Override
	public List<InstructorInfoVO> selectInstInfoByAdmin(Map<String, Object> InstDelYnList) {
		return sqlSession.selectList("selectInstInfoByAdmin", InstDelYnList);
	}

	// 페이지작업을 위해서 이번달(다음달)전체 강습반 개수를 가져옴
	@Override
	public int selectClassesCnt(ClassInfoVO classInfoVO) {
		return sqlSession.selectOne("selectClassesCnt", classInfoVO);
	}

	// 강의관리 페이지에 출력할 이번달(다음달) 강습반을 조회
	@Override
	public List<ClassInfoVO> selectClassInfoList2(Map<String, Object> classInfoMap) {
		return sqlSession.selectList("selectClassInfoList2", classInfoMap);
	}
	
	// 강의관리 페이지에 출력할 다음달 강습반 중 현재 신청한 수강생이 있는 반을 조회
	@Override
	public List<Integer> selectClassInfoListStudent(ClassInfoVO classInfoVO) {
		return sqlSession.selectList("selectClassInfoListStudent", classInfoVO);
	}

	// 다음달에 강습을 추가
	@Override
	public int insertNextMonthClass(int classNum) {
		return sqlSession.insert("insertNextMonthClass", classNum);
	}
	
	// 다음달에 강습을 여러개 동시에 추가
	@Override
	public int insertNextMonthClassList(RentalPlaceVO classNumList) {
		return sqlSession.delete("insertNextMonthClassList", classNumList);
	}
	
	// 다음달에 새로운 강습을 개설
	@Override
	public int insertNewNextMonthClass(ClassInfoVO classInfoVO) {
		return sqlSession.insert("insertNewNextMonthClass", classInfoVO);
	}
	
	// 다음달에 개설된 강습을 삭제
	@Override
	public int deleteNextMonthClass(int classNum) {
		return sqlSession.delete("deleteNextMonthClass", classNum);
	}
	
	// 다음달에 개설된 강습을 여러개 동시에 삭제
	@Override
	public int deleteNextMonthClassList(RentalPlaceVO classNumList) {
		return sqlSession.delete("deleteNextMonthClassList", classNumList);
	}

	// 강습관리 페이지에서 해당 종목의 강습수준 리스트를 조회
	@Override
	public List<ClassLevelVO> selectClassLevelList(int classesCode) {
		return sqlSession.selectList("selectClassLevelList", classesCode);
	}

	// 강습관리 페이지에서 해당 종목의 장소 이름을 조회
	@Override
	public List<ClassPlaceVO> selectRegClassPlaceList(int classesCode) {
		return sqlSession.selectList("selectRegClassPlaceList", classesCode);
	}

	// 강습관리 페이지에서 해당 종목이 매일 하는지 격일로 하는지 조회
	@Override
	public List<ClassDayVO> selectRegClassDayList(int classesCode) {
		return sqlSession.selectList("selectRegClassDayList", classesCode);
	}

	// 강의관리 페이지에서 해당 종목의 강사 리스트를 조회
	@Override
	public List<InstructorInfoVO> selectInstructorList2(int classesCode) {
		return sqlSession.selectList("selectInstructorList2", classesCode);
	}

	// 강사를 추가, 삭제 강사지원자를 합격 탈락 시킨다.
	@Override
	public int updateInstructorInstDel(InstructorInfoVO instructorInfoVO) {
		return sqlSession.update("updateInstructorInstDel", instructorInfoVO);
	}

	@Override
	public int sendResume(InstructorInfoVO instructorInfoVO) {
		return sqlSession.insert("sendResume", instructorInfoVO);
	}

	@Override
	public List<InstructorInfoVO> selectClassesCodeForResume(String memberId) {
		return sqlSession.selectList("selectClassesCodeForResume", memberId);
	}

	// 다음달 헬쓰가 개설됐는지 확인
	@Override
	public int selectNextHealthClassExist(String classDate) {
		return sqlSession.selectOne("selectNextHealthClassExist", classDate);
	}

	// 수강신청 종료후 인원 미달인 반이 있는지 확인
	@Override
	public int lackOfRegMemberClassCnt() {
		return sqlSession.selectOne("lackOfRegMemberClassCnt");
	}

	// 수강신청 종료후 인원 미달인 반을 폐강
	@Override
	public int cancelLackOfRegMemberClass() {
		return sqlSession.update("cancelLackOfRegMemberClass");
	}

	// 폐강된 반을 공지하기 위해서 목록을 불러옴
	@Override
	public List<ClassInfoVO> lackOfRegMemberClassList() {
		return sqlSession.selectList("lackOfRegMemberClassList");
	}

	// 지난달에 폐강된 반이 있는지 조회
	@Override
	public int lastMonthLackOfRegMemberClassCnt() {
		return sqlSession.selectOne("lastMonthLackOfRegMemberClassCnt");
	}

	// 지난달에 폐강된 반에 신청한 정보를 삭제
	@Override
	public int deleteLackOfRegMemberRegisterClass() {
		return sqlSession.delete("deleteLackOfRegMemberRegisterClass");
	}
	
	// 지난달 폐강된 반에 신청한 정보를 삭제하고 폐강된 반을 삭제함
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteLackOfRegMemberClass() {
		// 지난달에 폐강된 반에 신청한 정보를 삭제
		int result = deleteLackOfRegMemberRegisterClass();
		// 지단달에 폐강된 반을 삭제
		result += sqlSession.delete("deleteLackOfRegMemberClass");
		return result;
	}
	
}

