package com.spring.view;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.AdminService;
import com.spring.biz.BoardService;
import com.spring.biz.MemberService;
import com.spring.biz.StudentService;
import com.spring.biz.util.IsHoliday;
import com.spring.biz.util.Pagination;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.ClassInfoVO;
import com.spring.biz.vo.ClassListVO;
import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.MemberVO;
import com.spring.biz.vo.RentalPlaceVO;

@Controller
public class AdminController {
	@Resource(name = "adminService")
	AdminService adminService;
	
	@Resource(name = "memberService")
	MemberService memberService;
	
	@Resource(name = "studentService")
	StudentService studentService;
	
	@Resource(name = "boardService")
	BoardService boardService;
	
	//관리자 강의관리 페이지
	@RequestMapping(value = "/lectureListManager.do")
	public String lectureListManager2(ClassInfoVO classInfoVO, Model model, HttpSession session
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "1") int nextPage
			, @RequestParam(required = false, defaultValue = "1") int nextRange
			, @RequestParam(required = false, defaultValue = "11") int classesCode
			, @RequestParam(required = false, defaultValue = "6") String classTime
			) {
		// 이번달을 불러옴
		int year = Integer.parseInt(IsHoliday.getNowDate("yyyy"));
		int month = Integer.parseInt(IsHoliday.getNowDate("MM"));
		
		// 종목에 따른 장소, 매일(격일)인지, 강사정보, 강습수준을 DB에서 가져옴
		model.addAttribute("classPlaceList", memberService.selectRegClassPlaceList(classesCode));
		// 강습관리 페이지에서 해당 종목이 매일 하는지 격일로 하는지 조회
		model.addAttribute("classDayList", memberService.selectRegClassDayList(classesCode));
		// 강의관리 페이지에서 해당 종목의 강사 리스트를 조회
		model.addAttribute("instructorInfoList", memberService.selectInstructorList2(classesCode));
		// 강습관리 페이지에서 해당 종목의 강습수준 리스트를 조회
		model.addAttribute("classLevelList", memberService.selectClassLevelList(classesCode));

		// 페이지에 출력할 종목과 시간을 보냄
		classInfoVO.setClassTime(classTime);
		classInfoVO.setClassesCode(classesCode);
		
		// 저번에 개설되서 이번달에 진행중인 강습목록을 표현하기 위해서 날짜과 종목 보냄
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("classesList", session.getAttribute("classesList"));
		
		// 아직 지난달강습이 신청DB에 있다면 이전 신청목록으로 옮긴다
		List<Integer> classListNum = studentService.oldRegisterClassNum();
		if(classListNum.size() > 0) {
			List<ClassListVO> list = new ArrayList<>();
			classListNum.forEach(t -> {
				ClassListVO vo = new ClassListVO();
				vo.setClassListNum(t);
				list.add(vo);
			});
			studentService.copyOldRegisterClassToClassList(list);
		}
		
		int today = Integer.parseInt(IsHoliday.getNowDate("yyyyMMdd"));
		
		// 지난달 폐강된 반을 테이블에서 삭제
		if(today % 100 < 15) {
//		if(today % 100 != 12) {		// 테스트용 조건문
			if(memberService.lastMonthLackOfRegMemberClassCnt() > 0) {
				memberService.deleteLackOfRegMemberClass();
			}
		}
		
		// 수강신청 종료 후 인원미달인 반을 폐강
		if(today % 100 > 25) {
//		if(today % 100 == 17) {		//테스트용 조건문
			if(memberService.lackOfRegMemberClassCnt() > 0) {
				memberService.cancelLackOfRegMemberClass();
				List<ClassInfoVO> list =  memberService.lackOfRegMemberClassList();
				String title = (today / 10000) + "년 " + (today % 10000 / 100) + "월 인원미달 폐강과목 안내";

				// 폐강된 반을 공지사항으로 알려줌
				String tmp = "";
				for (ClassInfoVO e : list) {
					tmp += e.getClassesName() + "-";
					tmp += e.getClassTime() + "시 ";
					tmp += e.getPlaceName() + " ";
					tmp += e.getLevelName() + "(";
					tmp += e.getMemberName() + ")\n";
					// 게시판 최대 용량을 넘으면 공지를 여러개 올림
					if (tmp.length() > 300) {
						tmp += "\n위의 반은 인원부족으로 폐강되었습니다.";
						BoardVO boardVO = new BoardVO(1, title, tmp, 0, "admin", "N");
						boardService.insertBoard(boardVO);
						tmp = "";
					}
				}
				if (!tmp.equals("")) {
					tmp += "\n위의 반은 인원부족으로 폐강되었습니다.";
					BoardVO boardVO = new BoardVO(1, title, tmp, 0, "admin", "N");
					boardService.insertBoard(boardVO);
				}
			}
		}
				
		// 이번달에 진행중인 강습 데이터를 불러옴
		classInfoVO.setClassDate("" + year + month);
		
		int listCnt = memberService.selectClassesCnt(classInfoVO);
		Pagination pagination = new Pagination(page, range, listCnt);
		
		Map<String, Object> classInfoMap = new HashMap<>();
		classInfoMap.put("classInfoVO", classInfoVO);
		classInfoMap.put("pagination", pagination);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("classInfoList", memberService.selectClassInfoList2(classInfoMap));
		
		// 다음달에 진행될 강습 데이터를 불러옴
		// 헬쓰종목은 단일 클래스라서 다음달 개설이 안되어 있으면 자동으로 생성시킨다.
		classInfoVO.setClassDate("" + year + ++month);
		if(memberService.selectNextHealthClassExist("" + year + month) == 0) {
			memberService.insertNewNextMonthClass(new ClassInfoVO(61, "-", 1, "" + year + "-" + month + "-01", 1, 11, 18));
		}
		
		listCnt = memberService.selectClassesCnt(classInfoVO);
		Pagination nextPagination = new Pagination(nextPage, nextRange, listCnt);
		
		
		classInfoMap.put("classInfoVO", classInfoVO);
		classInfoMap.put("pagination", nextPagination);
		
		
		List<Integer> intList = memberService.selectClassInfoListStudent(classInfoVO);
		List<ClassInfoVO> list = memberService.selectClassInfoList2(classInfoMap);
		List<ClassInfoVO> list2 = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			for(int e : intList) {
				if(i >= 0 && list.get(i).getClassNum() == e) {
					list2.add(list.get(i));
					list.remove(i--);
				}
			}
		}
		model.addAttribute("nextClassInfoList1", list);
		model.addAttribute("nextClassInfoList2", list2);
		model.addAttribute("nextPagination", nextPagination);
		
		return "admin/lectureListManager2";
	}
	
	// 다음달 강습을 추가
	@RequestMapping(value = "/registerNextMonthClass.do")
	public String registerNextMonthClass(int classNum, int page, int range, int nextPage, int nextRange, int classesCode, String classTime, Model model) {
		memberService.insertNextMonthClass(classNum);
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("nextRange", nextRange);
		model.addAttribute("classesCode", classesCode);
		model.addAttribute("classTime", classTime);
		
		return "redirect:lectureListManager.do";
	}
	
	// 다음달 강습 여러개를 동시에 추가
	@RequestMapping(value = "/registerNextMonthClassList.do")
	public String registerNextMonthClassList(String classNumList, int page, int range, int nextPage, int nextRange, int classesCode, String classTime, Model model, RentalPlaceVO vo) {
		vo.setRentalCodeList(Arrays.asList(classNumList.split(",")));
		memberService.insertNextMonthClassList(vo);
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("nextRange", nextRange);
		model.addAttribute("classesCode", classesCode);
		model.addAttribute("classTime", classTime);
		
		return "redirect:lectureListManager.do";
	}
	
	// 다음달 개설된 강습을 취소
	@RequestMapping(value = "/deleteNextMonthClass.do")
	public String deleteNextMonthClass(int classNum, int page, int range, int nextPage, int nextRange, int classesCode, String classTime, Model model) {
		memberService.deleteNextMonthClass(classNum);
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("nextRange", nextRange);
		model.addAttribute("classesCode", classesCode);
		model.addAttribute("classTime", classTime);
		
		return "redirect:lectureListManager.do";
	}
	
	// 다음달 개설된 강습 여러개를 동시에 취소
	@RequestMapping(value = "/deleteNextMonthClassList.do")
	public String deleteNextMonthClassList(String classNumList, int page, int range, int nextPage, int nextRange, int classesCode, String classTime, Model model, RentalPlaceVO vo) {
		vo.setRentalCodeList(Arrays.asList(classNumList.split(",")));
		memberService.deleteNextMonthClassList(vo);
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("nextRange", nextRange);
		model.addAttribute("classesCode", classesCode);
		model.addAttribute("classTime", classTime);

		return "redirect:lectureListManager.do";
	}
	
	// 다음달에 새로운 강습을 추가
	@RequestMapping(value = "/registerNewNextMonthClass.do")
	public String registerNewNextMonthClass(ClassInfoVO classInfoVO , int page, int range, int nextPage, int nextRange, Model model) {
		memberService.insertNewNextMonthClass(classInfoVO);
		
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("nextRange", nextRange);
		model.addAttribute("classesCode", classInfoVO.getClassesCode());
		model.addAttribute("classTime", classInfoVO.getClassTime());
		
		return "redirect:lectureListManager.do";
	}
	
	//멤버 리스트 보기 
	@RequestMapping(value = "/memberListManager.do")
	public String memberInfo(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "all") String delYn, String keyword, String idKeyword, String nameKeyword) {
		
		// 회원관리 페이지에서 현재회원인지 탈퇴한 회원인지와 검색중인 키워드가 있다면 키워드를 포함시키는 부분
		Map<String, Object> listCntMap = new HashMap<>();
		if(!delYn.equals("all")) { 
			listCntMap.put("delYn", delYn);
		}
		
		listCntMap.put("table", "MEMBER_INFO");
		listCntMap.put("idKeyword", idKeyword);
		listCntMap.put("nameKeyword", nameKeyword);
		
		// 페이지처리를 위한 회원수 조회
		int listCnt = adminService.getListCntMap(listCntMap);
		Map<String, Object> memberDelYnList = new HashMap<>();
		
		Pagination pagination = new Pagination(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		
		// 회원목록을 조회
		memberDelYnList.put("pagination", pagination);
		if(!delYn.equals("all")) { 
			memberDelYnList.put("delYn", delYn);
		}
		
		memberDelYnList.put("idKeyword", idKeyword);
		memberDelYnList.put("nameKeyword", nameKeyword);
			
		model.addAttribute("memberInfoList", adminService.selectMemberInfoList2(memberDelYnList));
		model.addAttribute("delYn", delYn);
		model.addAttribute("keyword", keyword);
		
		return "admin/memberInfoManager2";
	}
	
	//강사 리스트 보기 
	@RequestMapping(value = "/adminB.do")
	public String instructorInfo(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "N") String delYn, String keyword, String idKeyword, String nameKeyword) {
		
		// 강사관리 페이지에서 현재강사인지 그만둔 강사인지와 검색중인 키워드가 있다면 키워드를 포함시키는 부분
		Map<String, Object> listCntMap = new HashMap<>();
		listCntMap.put("instDel", delYn);
		listCntMap.put("idKeyword", idKeyword);
		listCntMap.put("nameKeyword", nameKeyword);
		
		// 페이지작업을 위한 강사수를 조회
		int listCnt = memberService.selectInstCnt(listCntMap);
		Pagination pagination = new Pagination(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		model.addAttribute("instDel", delYn);
		model.addAttribute("keyword", keyword);
		
		// 강사 목록을 조회
		Map<String, Object> InstDelYnList = new HashMap<>();
		InstDelYnList.put("pagination", pagination);
		InstDelYnList.put("instDel", delYn);
		InstDelYnList.put("idKeyword", idKeyword);
		InstDelYnList.put("nameKeyword", nameKeyword);
		model.addAttribute("instInfoList", memberService.selectInstInfoByAdmin(InstDelYnList));
		
		return "admin/instInfoManager";
	}
	
	// 강사를 추가, 삭제 강사지원자를 합격 탈락 시킨다.
	@RequestMapping(value = "/updateInstructorInstDel.do")
	public String updateInstructorInstDel(InstructorInfoVO instructorInfoVO, int page, int range, String keyword, String idKeyword, String nameKeyword, String delYn, Model model) {
		memberService.updateInstructorInstDel(instructorInfoVO);
		model.addAttribute("delYn", delYn);
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("keyword", keyword);
		model.addAttribute("idKeyword", idKeyword);
		model.addAttribute("nameKeyword", nameKeyword);
		return "redirect:adminB.do";
	}
	
	// 관리자가 비고를 작성
	@ResponseBody
	@RequestMapping(value = "/updateNote.do")
	public int updateNote(MemberVO memberVO) {
		return memberService.updateNote(memberVO);
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/wrongPwCntReset.do")
//	public int wrongPwCntReset(MemberVO memberVO) {
//		int result = adminService.resetWrongPwCnt(memberVO);
//		return result;
//	}
	
//	@RequestMapping(value = "/modifyMemberInfoForm.do")
//	public String modifyMemberInfoForm(Model model
//			, @RequestParam String memberId
//			, @RequestParam int page
//			, @RequestParam int range) {
//		model.addAttribute("page", page);
//		model.addAttribute("range", range);
//		model.addAttribute("memberInfo", adminService.selectMemberInfo(memberId));
//		return "admin/modifyMemberInfoForm";
//	}
	
	// 회원 상세 정보 페이지로 이동
	@RequestMapping(value = "/memberInfoDetailForm.do")
	public String memberInfoDetailForm(Model model
			, @RequestParam String memberId
			, @RequestParam int page
			, @RequestParam int range, String delYn, String b4Page, String keyword) {
		model.addAttribute("page", page);
		model.addAttribute("range", range);
		model.addAttribute("delYn", delYn);
		model.addAttribute("b4Page", b4Page);
		model.addAttribute("keyword", keyword);
		
		// 회원 상세 정보를 조회
		model.addAttribute("memberInfo", memberService.memberInfoByAdmin(memberId));
		// 현재 강습중이거나 다음달 신청한 강습을 조회
		model.addAttribute("regclassList", memberService.regClassList(memberId));
		// 이전 수강정보를 조회
		model.addAttribute("selectClassList", memberService.selectClassList(memberId));
		// 회원이 게시판을 작성 했는지를 조회
		model.addAttribute("myBoard", studentService.myBoard(memberId));
		// 회원이 강사면 강사상세정보를 조회
		model.addAttribute("instInfo", memberService.instDetailByAdmin(memberId));
		// 강사인 경우 강습반 정보를 조회
		model.addAttribute("instClassList", memberService.selectInstClassList(memberId));
		// 대관 정보를 조회
		List<RentalPlaceVO> list = memberService.selectMyRentalPlaceInfo(memberId);
		// 대관정보를 현재 예약중인 정보와 이미 이용완료한 정보를 나눠서 전달
		List<RentalPlaceVO> nextList = new ArrayList<>(), pastList = new ArrayList<>();
		Calendar today = Calendar.getInstance();
		int now = today.get(Calendar.YEAR) * 10000 + (today.get(Calendar.MONTH) + 1) * 100 + today.get(Calendar.DATE);
		list.forEach(t -> {
			String str = t.getRentalDate().replace(".", "");
			int tDay = Integer.parseInt(str);
			if (tDay < now)
				pastList.add(t);
			else nextList.add(t);
		});
		model.addAttribute("pastRentalList", pastList);
		model.addAttribute("nextRentalList", nextList);
		
		return "admin/memberInfoDetailForm";
	}
	
	
//	@RequestMapping(value = "/modifyMemberInfo.do")
//	public String modifyMemberInfo(MemberVO memberVO
//			, @RequestParam int page
//			, @RequestParam int range) {
//		
//		adminService.updateMemberInfo(memberVO);
//		
//		
//		return "redirect:memberListManager.do?page="+page+"&range="+range;
//	}
	
	
//	@RequestMapping(value = "/deleteMember.do")
//	public String deleteMember(MemberVO memberVO
//			, @RequestParam int page
//			, @RequestParam int range) {
//		return "redirect:memberListManager.do?page="+page+"&range="+range;
//	}
	
	// 관리자가 회원을 탈퇴시킴
	@RequestMapping(value = "/deleteMember2.do")
	public String deleteMember2(MemberVO memberVO, String delYn) {
		memberService.withdrawMemberByAdmin(memberVO);
		return "redirect:memberListManager.do?delYn=" + delYn;
	}

	// 관리자가 탈퇴된 회원을 복구함
	@RequestMapping(value = "/restoreMember.do")
	public String restoreMember(MemberVO memberVO, String delYn) {
		memberService.restoreMemberByAdmin(memberVO);
		return "redirect:memberListManager.do?delYn=" + delYn;
	}
		
//	@ResponseBody
//	@RequestMapping(value = "/getAddrApis.do")
//	public void getAddrApis(HttpServletRequest req, ModelMap model, HttpServletResponse response) throws Exception {
//		String currentPage = req.getParameter("currentPage"); // (currentPage : n > 0)
//		String keyword = req.getParameter("keyword");
//		String apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage=" + currentPage + "&countPerPage=10&keyword="
//				+ URLEncoder.encode(keyword, "UTF-8") + "&confmKey=U01TX0FVVEgyMDIwMDkyODE1MTkzMjExMDI0MTI=&resultType=json";
//		URL url = new URL(apiUrl);
//		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
//		StringBuffer sb = new StringBuffer();
//		String tempStr = null;
//
//		while (true) {
//			tempStr = br.readLine();
//			if (tempStr == null)
//				break;
//			sb.append(tempStr); // JSON
//		}
//		br.close();
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/xml");
//		response.getWriter().write(sb.toString());
//	}	
}
