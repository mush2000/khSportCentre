package com.spring.biz;

import java.util.List;
import java.util.Map;

import com.spring.biz.vo.MemberVO;


public interface AdminService {

	// 해당테이블(회원)의 개수를 조회
	int getListCntMap(Map<String, Object> listCntMap);
	
	// 삭제여부, 키워드를 이용해서 회원을 조회
	List<MemberVO> selectMemberInfoList2(Map<String, Object> memberPageDelYn);
}	




















