package com.spring.view;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.support.SessionStatus;
//import org.springmodules.validation.commons.DefaultBeanValidator;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.MemberService;
import com.spring.biz.StudentService;
import com.spring.biz.util.IsHoliday;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.ClassDayVO;
import com.spring.biz.vo.ClassInfoVO;
import com.spring.biz.vo.ClassListVO;
import com.spring.biz.vo.ClassesVO;
import com.spring.biz.vo.InstructorInfoVO;
import com.spring.biz.vo.LoginInfoVO;
import com.spring.biz.vo.MemberVO;
import com.spring.biz.vo.RentalPlaceVO;
import com.spring.biz.vo.SurveyVO;
import com.spring.mail.SendEmail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
//import java.io.InputStream;
import java.io.InputStreamReader;
//import java.net.MalformedURLException;
import java.net.URL;
//import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
//import java.util.List;
import java.util.Random;

@Controller
public class CentreManageController {
	@Resource(name = "memberService")
	MemberService memberService;
	
	@Resource(name = "studentService")
	StudentService studentService;
	
	// 회원가입 페이지로 이동
	@RequestMapping(value = "/joinPage.do")
	public String joinMember() {
		return "member/joinMember";
	}
	
	// 회원가입폼을 작성하면 DB에 저장
	@RequestMapping(value = "/insertMember.do")
	public String insertMember(MemberVO memberVO) {
		memberService.insertMember(memberVO);
		return "redirect:joinSuccess.do";
	}
	
	// 회원가입완료
	@RequestMapping(value = "/joinSuccess.do")
	public String joinSuccess() {
		return "member/joinSuccess";
	}
	
	// 로그인화면으로 이동
	@RequestMapping(value = "/loginPage.do")
	public String loginPage() {
		return "member/loginMember";
	}
	
	// 입력받은 ID, 비밀번호로 로그인처리
	@RequestMapping(value = "/loginMember.do")
	public String loginMember(MemberVO memberVO, Model model, HttpSession session) {
		try {
			// 이미 비밀번호 틀린 횟수가 5회이면 로그인 안됨
			if(memberService.checkWrongPwCnt(memberVO) > 4) {
				model.addAttribute("wrongId", "5times");
				return "member/loginFail";
			}
		} catch (NullPointerException ne) {
			ne.printStackTrace();
		}
		// 로그인 할 때 입력받은 ID와 비밀번호가 정확한지 확인하여 로그인처리
		LoginInfoVO vo = memberService.login(memberVO);
		// 로그인 성공
		if (vo.getMemberId() != null && memberService.checkDelYn(memberVO.getMemberId()).equals("N")) {
			session.setAttribute("loginInfo", vo);
			return "redirect:mainPage.do";
		// 로그인 실패시 로그인 실패 페이지로 이동하면서 틀린 원인을 보내준다 
		} else {
			model.addAttribute("wrongId", vo.isWrongId());
			return "member/loginFail";
		}
	}
	
	// 비밀번호 찾는 화면으로 이동
	@RequestMapping(value = "/searchPwPage.do")
	public String searchPwPage() {
		return "member/searchPw";
	}
	
	// 비밀번호 찾기가 완료 되었을 때 결과를 보여주는 화면으로 이동
	@RequestMapping(value = "/displayMemberPw.do")
	public String displayMemberPw() {
		return "member/displayMemberPw";
	}
	
	// ID, 이름, 이메일로 비밀번호를 찾음
	@RequestMapping(value = "/searchPw.do")
	public String searchPw(MemberVO memberVO) {
		// 비밀번호를 찾기위해 입력한정보가 맞는지 확인하여 맞으면 ID값을 받음
		String memberId = memberService.searchPw(memberVO);
		// 입력받은 정보와 일치하는 회원이 없으면 찾기실패화면으로 이동
		if(memberId == null) {
			return "member/failSearchIdPw";
		// 정확한 정보를 입력한 경우
		} else {
			// 8~18자리의 비밀번호를 랜덤하게 생성
			int num = new Random().nextInt(11) + 8;
			String newPw = "";
			// UNI코드를 이용해서 키보드상에 있는 숫자, 알파벳대소문자, 특수문자를 이용해서 생성
			for (int i = 0; i < num; i++) {
				int ch = new Random().nextInt(94) + 33;
				newPw += (char)ch;
			}
			// 새로운 비밀번호를 저장
			memberVO.setMemberPw(newPw);
			memberService.newPw(memberVO);
			// 회원의 이메일로 새로운 비밀번호를 전송
			SendEmail se = new SendEmail();
			se.mailSend(memberVO.getMemberName(), memberVO.getMemberEmail(), newPw);
		}
		return "member/displayMemberPw";
	}
	
	// 이름과 이메일로 ID를 찾음
	@RequestMapping(value = "/searchId.do")
	public String searchId(MemberVO memberVO, Model model) {
		String memberId = memberService.searchId(memberVO);
		// 입력받은 정보와 일치하는 회원이 없으면 찾기실패화면으로 이동
		if(memberId == null) {
			return "member/failSearchIdPw";
		// 정확한 정보를 입력한 경우
		} else {
			int idLen = memberId.length();
			// 아이디 뒤의 4자리는 가리고 알려줌
			memberId = memberId.substring(0, idLen - 4);
			char ch = 183;		// '·'
			memberId += new String(new char[] {ch,ch,ch,ch});
			model.addAttribute("memberId", memberId);
		}
		return "member/displayMemberId";
	}
	
	// 아이디를 찾는 화면으로 이동
	@RequestMapping(value = "/searchIdPage.do")
	public String searchIdPage() {
		return "member/searchId";
	}
	
	// 내정보관리 화면으로 이동
	@RequestMapping(value = "/memberInformation.do")
	public String memberInformation(Model model, LoginInfoVO loginInfoVO, HttpSession session) {
		// 세션의 아이디 정보를 이용해서 회원의 정보를 조회
		loginInfoVO =  (LoginInfoVO)session.getAttribute("loginInfo");
		String memberId = loginInfoVO.getMemberId();
		// 내정보관리에서 회원의 정보를 조회
		model.addAttribute("memberInfo", memberService.memberInfo(memberId));
		// 회원의 등록중인 강습을 조회
		model.addAttribute("regclassList", memberService.regClassList(memberId));
		// 회원의 과거 수강한 강습을 조회
		model.addAttribute("selectClassList", memberService.selectClassList(memberId));
		// 회원이 게시판에 글을 작성 했는지를 조회
		model.addAttribute("myBoard", studentService.myBoard(memberId));
		// 회원이 강사면 강사상세정보를 조회
		model.addAttribute("instInfo", memberService.instDetail(memberId));
		// 강사인 경우 강습반이 있는지를 조회
		model.addAttribute("instClassList", memberService.selectInstClassList(memberId));
		// 회원의 대관 정보를 조회
		List<RentalPlaceVO> list = memberService.selectMyRentalPlaceInfo(memberId);
		// 대관정보를 현재 예약중인 것과 과거 사용한 것을 구분
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
		
		return "member/memberInformation";
	}
	
	// 상단의 로그아웃 선택시 확인하는 화면으로 이동
	@RequestMapping(value = "/logout.do")
	public String logout() {
		return "member/logout";
	}
	
	// 로그아웃시 세션에서 로그인 정보를 지우고 메인으로 이동
	@RequestMapping(value = "/logoutMember.do")
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:mainPage.do";
	}
	
	// 메뉴에서 강의안내 선택시 전체 강의의 이름, 사진, 정원 수강료를 출력
	// 수강신청기간이면 수강신청가능
	@RequestMapping(value = "/lectureInfo.do")
	public String lectureInfo(Model model) {
		model.addAttribute("classList", studentService.classesList());
		return "member/lectureInfo";
	}
	
	// 강의안내 세부메뉴에서 종목을 선택시 그 종목의 상세 정보를 출력
	// 수강신청기간이면 수강신청가능
	@RequestMapping(value = "/classesDetail.do")
	public String classesDetail(ClassesVO classesVO, Model model, HttpServletRequest re) {
		// 강좌의 상세정보를 조회
		ClassesVO vo = studentService.classesDetail(classesVO);
		
		// 강좌정보를 파일명을 이용해서 상세 정보를 가져옴
		String content = "";
		// 실제 파일이 저장된 위치
		String filePath = re.getSession().getServletContext().getRealPath("\\resources\\textfile")  + "\\" + vo.getClassesDetail();
		
		try {
			// 파일 객체 생성
			File file = new File(filePath);
			// 입력 스트림 생성
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			String line = null;
			// 파일에서 한줄씩 받으면서 한줄마다 <br>을 이용해 웹화면에서도 한줄씩 바뀌게 출력
			while ((line = br.readLine()) != null) {
				content += line + "<br>";
			}
			br.close();
			fr.close();
		} catch (FileNotFoundException e) {
			e.getStackTrace();
		} catch (IOException e) {
			e.getStackTrace();
		}
		vo.setClassesDetail(content);
		model.addAttribute("classesDetail", vo);
		return "member/classesDetail";
	}
	
	// 수강신청화면으로 이동
	@RequestMapping(value = "/registerClass.do")
	public String registerClass(int classesCode, Model model) {
		model.addAttribute("classesCode", classesCode);
		// 선택한 강습의 강습날을 선택하기 위해서 목록을 불러옴(월~금, 월수금, 화목)
		model.addAttribute("classDayList", studentService.selectClassDayList(classesCode));
		return "member/registerClass";
	}
	
	// 메뉴에서 강사안내를 선택시 강사목록을 출력
	@RequestMapping(value = "/instList.do")
	public String instList(Model model) {
		List<InstructorInfoVO> list = studentService.instList();
		// 강사의 강습종목이 여러개인 경우 종목은 다 보여주고 나머지는 대표 정보만 보여줌
		for(int i = 0 ; i < list.size() - 1 ; i++) {
			if(list.get(i).getMemberId().equals(list.get(i + 1).getMemberId())) {
				list.get(i).setClassesName(list.get(i).getClassesName() + ", " + list.get(i + 1).getClassesName());
				list.remove(1 + i--);
			}
		}
		model.addAttribute("instList", list);
		return "member/instructorList";
	}
	
	// 강사안내 세부메뉴에서 종목을 선택시 해당 종목의 강사를 출력
	@RequestMapping(value = "/instructorDetail.do")
	public String instructorDetail(int classesCode, Model model) {
		model.addAttribute("instDetail", studentService.instInfo(classesCode));
		return "member/instructorDetail";
	}
	
	// 수강신청에서 선택을 완료하면 선택 정보를 다시 보여주고 수강신청 완료 할수 있는 화면으로 이동
	@RequestMapping(value = "/registerPage.do")
	public String registerPage(int classNum, Model model) {
		ClassInfoVO result = studentService.registerClass(classNum);
		// 격일 수업의 경우 화목을 선택하면 월수금보다 70%의 가격으로 설정
		if (result.getClassDay().equals("화목"))
			result.setClassesFee((int)(Math.round(result.getClassesFee() / 100 * .7) * 100));
		model.addAttribute("registerInfo", result);
		return "member/registerPage";
	}
	
	// 수강신청을 완료하면 데이터를 저장하고 수강신청정보 화면으로 이동
	@RequestMapping(value = "/joinClass.do")
	public String joinClass(ClassListVO classListVO, Model model, HttpSession session) {
		classListVO.setMemberId(((LoginInfoVO)session.getAttribute("loginInfo")).getMemberId());
		memberService.registerClass(classListVO);
		return "redirect:registerClassList.do";
	}
	
	// 내정보관리에서 수강신청내역 선택시 현재 수강중인 반과 수강신청중인 반의 정보를 출력
	// 신청중인 반은 수강신청기간일 경우 취소 가능
	@RequestMapping(value = "/registerClassList.do")
	public String registerClassList(String memberId, Model model, HttpSession session) {
		memberId = ((LoginInfoVO)session.getAttribute("loginInfo")).getMemberId();
		// 수강중인 반과 수강신청중인 반을 조회
		List<ClassInfoVO> list = memberService.registerClassList(memberId);
		// 수강중인 반과 수강신청중인 반을 구분
		List<ClassInfoVO> thisMonth = new ArrayList<>();
		List<ClassInfoVO> nextMonth = new ArrayList<>();
		for (ClassInfoVO e : list) {
			if((e.getClassDate().split("년 ")[1].split("월")[0]).equals(IsHoliday.getNowDate("MM")))
				thisMonth.add(e);
			else
				nextMonth.add(e);
		}
		
		model.addAttribute("thisMonthRegClassList", thisMonth);
		model.addAttribute("nextMonthRegClassList", nextMonth);
		return "member/registerClassList";
	}
	
	// 현재 수강중인 강습 리스트(관리자페이지)
	@RequestMapping(value = "/registerClassListByAdmin.do")
	public String registerClassListByAdmin(String memberId, int page, int range, String delYn, String b4Page, String keyword, Model model) {
		model.addAttribute("page", page);
		model.addAttribute("range", range); 
		model.addAttribute("memberId", memberId); 
		model.addAttribute("delYn", delYn);
		model.addAttribute("b4Page", b4Page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("regClassList", memberService.registerClassList(memberId));
		return "member/registerClassListByAdmin";
	}
	
	// 예전 수강했던 강습 리스트
	@RequestMapping(value = "/selectClassList.do")
	public String selectClassList(String memberId, Model model) {
		model.addAttribute("memberId", memberId);
		model.addAttribute("myClassList", memberService.myClassList(memberId));
		return "member/selectClassList";
	}

	// 예전 수강했던 강습 리스트(관리자페이지)
	@RequestMapping(value = "/selectClassListByAdmin.do")
	public String selectClassListByAdmin(String memberId, int page, int range, String delYn, String b4Page, String keyword, Model model) {
		model.addAttribute("page", page);
		model.addAttribute("range", range); 
		model.addAttribute("memberId", memberId); 
		model.addAttribute("delYn", delYn);
		model.addAttribute("b4Page", b4Page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("myClassList", memberService.myClassList(memberId));
		return "member/selectClassListByAdmin";
	}
	
	// 회원이 탈퇴하면 세션에서 로그인 정보를 삭제하고 메인화면으로 이동
	@RequestMapping(value = "/delMember.do")
	public String delMember(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:mainPage.do";
	}
	
	// 지난 강습 후기 작성
	@RequestMapping(value = "/writeSurvey.do")
	public String writeSurvey(ClassInfoVO classInfoVO, Model model) {
		return "member/writeSurvey";
	}
	
	// 작성한 후기 DB에 저장
	@RequestMapping(value = "/insertSurvey.do")
	public String insertSurvey(SurveyVO surveyVO, Model model, HttpSession session) {
		String memberId = ((LoginInfoVO)session.getAttribute("loginInfo")).getMemberId();
		surveyVO.setMemberId(memberId);
		studentService.insertSurvey(surveyVO);
		model.addAttribute("memberId", memberId);
		return "redirect:selectClassList.do";
	}
	
	@RequestMapping(value = "/selectSurvey.do")
	public String selectSurvey(ClassInfoVO classInfoVO, Model model) {
		model.addAttribute("surveyVO", studentService.selectSurvey(classInfoVO.getSurveyNum()));
		return "member/selectSurvey";
	}
	
	// 작성된 후기 내용 확인(관리자페이지)
	@RequestMapping(value = "/selectSurveyByAdmin.do")
	public String selectSurveyByAdmin(ClassInfoVO classInfoVO, String memberId2, int page, int range, String delYn, String b4Page, String keyword, Model model) {
		model.addAttribute("page", page);
		model.addAttribute("range", range); 
		model.addAttribute("memberId", memberId2);
		model.addAttribute("delYn", delYn);
		model.addAttribute("b4Page", b4Page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("surveyVO", studentService.selectSurvey(classInfoVO.getSurveyNum()));
		return "member/selectSurveyByAdmin";
	}
	
	@RequestMapping(value = "/surveyList.do")
	public String surveyList(Model model ,HttpSession session) {
		String memberId = ((LoginInfoVO)session.getAttribute("loginInfo")).getMemberId();;
		model.addAttribute("surveyList", studentService.surveyList(memberId));
		return "member/surveyList";
	}
	
	@RequestMapping(value = "/instClassInfo.do")
	public String instClassInfo(String memberId, Model model) {
		List<ClassInfoVO> list = memberService.instClassInfoList(memberId);
		List<ClassInfoVO> nextList = new ArrayList<>(), pastList = new ArrayList<>(), nowList = new ArrayList<>();
		Calendar today = Calendar.getInstance();
		int now = today.get(Calendar.YEAR) * 100 + today.get(Calendar.MONTH) + 1;
		list.forEach(t -> {
			String str = (t.getClassDate().replaceAll("년 ", "")).replaceAll("월", "");
			int tDay = Integer.parseInt(str);
			if (tDay < now)
				pastList.add(t);
			else if (tDay == now)
				nowList.add(t);
			else nextList.add(t);
		});
		model.addAttribute("pastClassList", pastList);
		model.addAttribute("nowClassList", nowList);
		model.addAttribute("nextClassList", nextList);
		return "member/instructorClassManager";
	}
	
	// 강사로 강습중인 수업목록(관리자페이지)
	@RequestMapping(value = "/instClassInfoByAdmin.do")
	public String instClassInfoByAdmin(String memberId, int page, int range, String delYn, String b4Page, String keyword, Model model) {
		List<ClassInfoVO> list = memberService.instClassInfoList(memberId);
		// 이전강습, 현재강습, 다음달강습으로 구분
		List<ClassInfoVO> nextList = new ArrayList<>(), pastList = new ArrayList<>(), nowList = new ArrayList<>();
		Calendar today = Calendar.getInstance();
		int now = today.get(Calendar.YEAR) * 100 + today.get(Calendar.MONTH) + 1;
		list.forEach(t -> {
			String str = (t.getClassDate().replaceAll("년 ", "")).replaceAll("월", "");
			int tDay = Integer.parseInt(str);
			if (tDay < now)
				pastList.add(t);
			else if (tDay == now)
				nowList.add(t);
			else nextList.add(t);
		});
		model.addAttribute("page", page);
		model.addAttribute("range", range); 
		model.addAttribute("memberId", memberId); 
		model.addAttribute("delYn", delYn);
		model.addAttribute("b4Page", b4Page);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("pastClassList", pastList);
		model.addAttribute("nowClassList", nowList);
		model.addAttribute("nextClassList", nextList);
		return "member/instructorClassManagerByAdmin";
	}
	
	// 현재 진행중인 강습의 수강생 정보 확인
	@RequestMapping(value = "/nowClassStudentInfo.do")
	public String nowClassStudentInfo(Model model, int classNum) {
		model.addAttribute("memberInfoList", studentService.nowClassStudentInfo(classNum));
		return "member/nowClassStudentInfo";
	}
	
	// 이전 강습의 수강생 정보 확인, 후기 확인
	@RequestMapping(value = "/pastClassStudentInfo.do")
	public String pastClassStudentInfo(Model model, int classNum) {
		model.addAttribute("myClassScore", studentService.pastClassSurveyScore(classNum));
		model.addAttribute("myClassOpinionList", studentService.pastClassSurveyOpinion(classNum));
		model.addAttribute("memberInfoList", studentService.pastClassStudentInfo(classNum));
		return "member/pastClassStudentInfo";
	}
	
	// 
	@RequestMapping(value = "/pastRentalList.do")
	public String pastRentalList(Model model, HttpSession session) {
		model.addAttribute("pastRentalList", memberService.pastMyRentalPlaceInfo(((LoginInfoVO)session.getAttribute("loginInfo")).getMemberId()));
		return "member/pastRentalList";
	}
	
	// 예전 대관 이력 확인(관리자페이지)
	@RequestMapping(value = "/pastRentalListByAdmin.do")
	public String pastRentalListByAdmin(Model model, String memberId, int page, int range, String delYn, String b4Page, String keyword) {
		model.addAttribute("page", page);
		model.addAttribute("range", range); 
		model.addAttribute("memberId", memberId);
		model.addAttribute("delYn", delYn);
		model.addAttribute("b4Page", b4Page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pastRentalList", memberService.pastMyRentalPlaceInfo(memberId));
		return "member/pastRentalListByAdmin";
	}
	
	@RequestMapping(value = "/applyInstructor.do")
	public String applyInstructor(LoginInfoVO loginInfoVO, Model model, HttpSession session) {
		loginInfoVO = (LoginInfoVO)session.getAttribute("loginInfo");
		@SuppressWarnings("unchecked")
		List<ClassesVO> list = (List<ClassesVO>)(session.getAttribute("classesList"));
		List<ClassesVO> classesVOList = new ArrayList<ClassesVO>();
		for(int i = 0; i < list.size(); i++) {
			ClassesVO vo = (ClassesVO)list.get(i).clone();
			classesVOList.add(vo);
		}
		classesVOList.forEach(t->System.out.println(t));
		List<InstructorInfoVO> instructorInfoVOList = memberService.selectClassesCodeForResume(loginInfoVO.getMemberId());
		if(instructorInfoVOList.size() != 0) {
			int s = instructorInfoVOList.size() - 1;
			for(int i = classesVOList.size() - 1 ; i >= 0 ; i--) {
				if (instructorInfoVOList.get(s).getClassesCode() == classesVOList.get(i).getClassesCode()) {
					if (instructorInfoVOList.get(s).getInstDel().equals("N") || instructorInfoVOList.get(s).getInstDel().equals("A"))
						classesVOList.remove(i);
					s--;
					if(s < 0) break;
				}
			}
			model.addAttribute("instInfo", instructorInfoVOList.get(0));
		}
		model.addAttribute("loginInfo", loginInfoVO);
		model.addAttribute("classesNameList", classesVOList);
		return "member/applyInstructor";
	}
	
	@RequestMapping(value = "/sendResume.do")
	public String sendResume(InstructorInfoVO instructorInfoVO, HttpServletRequest re, MultipartFile file) {
		if(file != null) {
			String filePath = re.getSession().getServletContext().getRealPath("\\resources\\images\\instructor");
			String picture = instructorInfoVO.getMemberId() + file.getOriginalFilename();
			instructorInfoVO.setPicture(picture);
			File destdir = new File(filePath, picture);
			
			try {
			        //파일을 경로에 저장한다
		        FileCopyUtils.copy(file.getBytes(), destdir);
	 		        
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		memberService.sendResume(instructorInfoVO);		
		return "redirect:memberInformation.do";
	}
	
	@RequestMapping(value = "/cancelClass.do")
	public String cancelClass(int regClassNum, int listSize) {
		studentService.deleteRegisterClass(regClassNum);
		String loc;
		if(listSize > 1) {
			loc = "registerClassList.do";
		} else {
			loc = "memberInformation.do";
		}
		return "redirect:" + loc;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/checkId.do")
	public int checkId(String memberId) {
		return memberService.checkId(memberId) != null ? 1 : 0;
	}
	
	@ResponseBody
	@RequestMapping(value = "/changePw.do")
	public int changePw(MemberVO memberVO) {
		return memberService.changePw(memberVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeAddr.do")
	public int changeAddr(MemberVO memberVO) {
		return memberService.changeAddr(memberVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeTel.do")
	public int changeTel(MemberVO memberVO) {
		return memberService.changeTel(memberVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeTel2.do")
	public int changeTel2(MemberVO memberVO) {
		return memberService.changeTel2(memberVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeEmail.do")
	public int changeEmail(MemberVO memberVO) {
		return memberService.changeEmail(memberVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeClasses.do")
	public List<ClassDayVO> changeClasses(int classesCode) {
		return studentService.selectClassDayList(classesCode);
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectClassDay.do")
	public List<String> selectClassDay(ClassInfoVO classInfoVO) {
		if(classInfoVO.getClassesCode() == 61) {
			List<String> result= new ArrayList<String>();
			result.add("-");
			return result;
		} else {
			return studentService.selectClassTimeList(classInfoVO);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectClassTime.do")
	public List<ClassInfoVO> selectClassTime(ClassInfoVO classInfoVO) {
		return studentService.selectClassLvList(classInfoVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkRegClass.do")
	public List<ClassInfoVO> checkRegClass(int classDayCode, HttpSession session) {
		List<ClassInfoVO> list = memberService.checkRegclass(((LoginInfoVO)session.getAttribute("loginInfo")).getMemberId());
		List<ClassInfoVO> result = new ArrayList<>();
		list.forEach(t -> {
			int tCode =  t.getClassDayCode();
			if(tCode == 11 || classDayCode == 11 || tCode == classDayCode) {
				result.add(t);
			}
		});
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectMaxMinMember.do")
	public ClassesVO selectMaxMinMember(int classesCode) {
		return studentService.selectMaxMinMember(classesCode);
	}
	
	@ResponseBody
	@RequestMapping(value = "/withdrawMember.do")
	public int withdrawMember(MemberVO memberVO) {
		return memberService.withdrawMember(memberVO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/myBoardList.do")
	public List<BoardVO> myBoardList(String memberId) {
		return studentService.myBoardList(memberId);
	}

	@ResponseBody
	@RequestMapping(value = "/getAddrApi.do")
	public void getAddrApi(HttpServletRequest req, ModelMap model, HttpServletResponse response) throws Exception {
	//public String getAddrApi(String currentPage, String keyword, ModelMap model, HttpServletResponse response) throws Exception {
		String currentPage = req.getParameter("currentPage"); // (currentPage : n > 0)
//		String countPerPage = req.getParameter("countPerPage"); // (countPerPage : 0 < n <= 100)
//		String resultType = req.getParameter("resultType"); //(json)
//		String confmKey = req.getParameter("confmKey");
		String keyword = req.getParameter("keyword");
		// OPEN API
//		String apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage=" + currentPage + "&countPerPage="
//				+ countPerPage + "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&confmKey=" + confmKey
//				+ "&resultType=" + resultType;
		String apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage=" + currentPage + "&countPerPage=10&keyword="
				+ URLEncoder.encode(keyword, "UTF-8") + "&confmKey=U01TX0FVVEgyMDIwMDkyODE1MTkzMjExMDI0MTI=&resultType=json";
		URL url = new URL(apiUrl);
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		StringBuffer sb = new StringBuffer();
		String tempStr = null;

		while (true) {
			tempStr = br.readLine();
			if (tempStr == null)
				break;
			sb.append(tempStr); // JSON
		}
		br.close();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());
	}	
}
