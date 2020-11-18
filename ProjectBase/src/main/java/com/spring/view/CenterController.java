package com.spring.view;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.spring.biz.BoardService;
import com.spring.biz.CenterService;
import com.spring.biz.StudentService;
import com.spring.biz.util.IsHoliday;
import com.spring.biz.util.Pagination;
import com.spring.biz.vo.BaseVO;
import com.spring.biz.vo.BoardKindVO;
import com.spring.biz.vo.ClassPlaceVO;
import com.spring.biz.vo.ClassesVO;
import com.spring.biz.vo.MainBoardVO;
import com.spring.biz.vo.RentalPlaceVO;
import com.spring.biz.vo.SearchClassVO;
import com.spring.biz.vo.SearchVO;
import com.spring.biz.util.DateUtil;

@Controller
public class CenterController {
	@Resource(name = "centerService")
	CenterService centerService;
	
	@Resource(name = "studentService")
	StudentService studentService;
	
	@Resource(name = "boardService")
	BoardService boardService;

	//메인페이지이동
	@RequestMapping(value = "/mainPage.do")
	public String mainPage(Model model, MainBoardVO mainBoardVO) {
		model.addAttribute("selectNoticeList", centerService.selectNoticeList());
		model.addAttribute("selectQnaList", centerService.selectQnaList());
		model.addAttribute("selectFaqList", centerService.selectFaqList());
		return "common/mainPage";
	}
	
	//센터소개페이지이동
	@RequestMapping(value = "/centerIntroPage.do")
	public String centerIntroPage(BaseVO baseVO, Model model) {
		model.addAttribute("introTab", baseVO.getIntroTab());
		return "center/centerIntroPage";
	}
	
	//menu.jsp에 강의목록 및 강사목록 불러오기(Ajax)
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	@RequestMapping(value = "/lectureList.do")
//	public void lectureList(HttpSession session) {
	public List<ClassesVO> lectureList(HttpSession session) {
//		List<ClassesVO> list = studentService.classesNameList();
		if(session.getAttribute("classesList") == null) {
//			System.out.println(123);
//			session.setAttribute("classesList", list);
			session.setAttribute("classesList", studentService.classesNameList());
		}
//		list11.forEach(t -> System.out.println(t));
		return (List)session.getAttribute("classesList");
	}
	
	//menu.jsp에 게시판 종류 불러오기(Ajax)
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	@RequestMapping(value = "/boardKindList.do")
	public List<BoardKindVO> selectBoardKindList(HttpSession session) {
		if(session.getAttribute("selectBoardKindList") == null) {
			session.setAttribute("selectBoardKindList", boardService.selectBoardKindList());
		}
		return (List)session.getAttribute("selectBoardKindList");
	}
	
	//menu.jsp에 admin 로그인 시 신규대관예약 배지알람(Ajax)
	@ResponseBody
	@RequestMapping(value = "/selectPlaceRentalCnt.do")
	public int selectPlaceRentalCnt() {
		int result = centerService.selectPlaceRentalCnt();
		return result;
	}
	
	//대관안내페이지이동
	@RequestMapping(value = "/placeRentalIntroPage.do")
	public String placeRentalIntroPage(ClassPlaceVO classPlaceVO, Model model) {
		model.addAttribute("classPlaceList", centerService.selectClassPlaceList());
		return "center/placeRentalIntroPage";
	}
	
	//대관일정페이지이동
	@RequestMapping(value = "/placeRentalSchedulePage.do")
	public String placeRentalSchedulePage(Model model) {
		try {
			model.addAttribute("holiday", IsHoliday.isHoliday(IsHoliday.getNowDate("yyyy"), IsHoliday.getNowDate("MM")));
		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
		return "center/placeRentalSchedulePage";
	}
	
	//예약 상황 조회(Ajax)
	@ResponseBody
	@RequestMapping(value = "/selectReserveStatus.do")
	public List<RentalPlaceVO> selectReserveStatus(RentalPlaceVO rentalPlaceVO, String clickYear, int clickMonth, int clickDay) {
		String year = clickYear;
		String month = String.format("%02d", clickMonth);
		String day = String.format("%02d", clickDay);
		
		rentalPlaceVO.setRentalDate(year+month+day);
		
		return centerService.selectReserveStatusList(rentalPlaceVO);
	}
	
	//휴일조회API(Ajax)
	@ResponseBody
	@RequestMapping(value = "/placeRentalChangeMonth.do")
	public String placeRentalChangeMonth(String year, String month) {
		String result = "";
		try {
			result = IsHoliday.isHoliday(year, month);
		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//대관신청페이지이동
	@RequestMapping(value = "/placeRentalApplyPage.do")
	public String placeRentalApplyPage(Model model) {
		try {
			model.addAttribute("holiday", IsHoliday.isHoliday(IsHoliday.getNowDate("yyyy"), IsHoliday.getNowDate("MM")));
		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
		return "center/placeRentalApplyPage";
	}
	
	//대관신청페이지 step1 화면전환 (Ajax)
	@ResponseBody
	@RequestMapping(value = "/step1.do")
	public List<RentalPlaceVO> step1(Model model, RentalPlaceVO rentalPlaceVO, String clickYear, int clickMonth, int clickDay) {
		try {
			model.addAttribute("holiday", IsHoliday.isHoliday(IsHoliday.getNowDate("yyyy"), IsHoliday.getNowDate("MM")));
		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
		String year = clickYear;
		String month = String.format("%02d", clickMonth);
		String day = String.format("%02d", clickDay);
		
		rentalPlaceVO.setRentalDate(year+month+day);
		
		return centerService.selectStep1(rentalPlaceVO);
	}
	
	//대관신청페이지 step2 화면전환 (Ajax)
	@ResponseBody
	@RequestMapping(value = "/step2.do")
	public RentalPlaceVO step2(Model model, RentalPlaceVO rentalPlaceVO, String clickYear, int clickMonth, int clickDay, int clickRentalPlaceCode) {
		try {
			model.addAttribute("holiday", IsHoliday.isHoliday(IsHoliday.getNowDate("yyyy"), IsHoliday.getNowDate("MM")));
		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
		String year = clickYear;
		String month = String.format("%02d", clickMonth);
		String day = String.format("%02d", clickDay);
		int rentalPlaceCode = clickRentalPlaceCode;
		
		rentalPlaceVO.setRentalDate(year+month+day);
		rentalPlaceVO.setRentalPlaceCode(rentalPlaceCode);
		
		return centerService.selectStep2(rentalPlaceVO);
	}
	
	//대관예약하기 (Ajax)
	@ResponseBody
	@RequestMapping(value = "/insertReserve.do")
	public int insertReserve(Model model, RentalPlaceVO rentalPlaceVO, String clickYear, int clickMonth, int clickDay, int clickRentalPlaceCode, String clickRentalTime, String loginInfo) {
		try {
			model.addAttribute("holiday", IsHoliday.isHoliday(IsHoliday.getNowDate("yyyy"), IsHoliday.getNowDate("MM")));
		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
		String year = clickYear;
		String month = String.format("%02d", clickMonth);
		String day = String.format("%02d", clickDay);
		int rentalPlaceCode = clickRentalPlaceCode;
		String rentalTime = clickRentalTime;
		String rentalMemberId = loginInfo;
		
		rentalPlaceVO.setRentalDate(year+month+day);
		rentalPlaceVO.setRentalPlaceCode(rentalPlaceCode);
		rentalPlaceVO.setRentalTime(rentalTime);
		rentalPlaceVO.setRentalMemberId(rentalMemberId);
		
		int result = centerService.insertReserve(rentalPlaceVO);
		
		return result;
	}
	
	//검색페이지이동
	@RequestMapping(value = "/searchPage.do")
	public String searchPage(Model model, SearchClassVO searchClassVO, String searchWord, 
				@RequestParam(required = false, defaultValue = "1") int page,
				@RequestParam(required = false, defaultValue = "1") int range) {
		
		int listCnt = centerService.selectSearchPageCnt(searchWord);
		Pagination pagination = new Pagination(page, range, listCnt);
		model.addAttribute("pagination", pagination);
		
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("searchWord", searchWord);
			
		model.addAttribute("searchClassList", centerService.selectSearchClassList(map));
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("listTotalCnt", listCnt);
		
		return "center/searchPage";
	}
	
	
	//대관관리페이지이동
	@RequestMapping(value = "/placeRentalManager.do")
	public String placeRentalManager(RentalPlaceVO rentalPlaceVO, Model model, SearchVO searchVO) {
		//toDate와 fromDate에 들어갈 날짜
		String toDate = searchVO.getToDate();
		String fromDate = searchVO.getFromDate();
		
		//받아오는 날짜가 없다면 (처음 페이지가 열렸을 때)
		if(searchVO.getFromDate() == null || searchVO.getFromDate().equals("")) {
			
			//DateUtil 메소드에 static을 붙여서 객체 생성 안해도 메소드에 바로 접근 가능
			//toDate에 두달 후 날짜를 세팅
			toDate = DateUtil.getBeforeDate();
			//fromDate에 현재 날짜를 세팅
			fromDate = DateUtil.getNowDate();
					
			searchVO.setToDate(toDate);
			searchVO.setFromDate(fromDate);
		}
		
		model.addAttribute("selectRentalList", centerService.selectRentalList(searchVO));
		model.addAttribute("toDate", toDate);
		model.addAttribute("fromDate", fromDate);
		
		return "admin/placeRentalManager";
	}
	
	//선택 예약 승인하기
	@RequestMapping(value = "/updateRentalApprovalYNList.do")
	public String updateRentalApprovalYNList(RentalPlaceVO rentalPlaceVO, Model model, String[] rentalCodes) {
		List<String> rentalCodeList = Arrays.asList(rentalCodes);
		rentalPlaceVO.setRentalCodeList(rentalCodeList);
		centerService.updateRentalApprovalYNList(rentalPlaceVO);
		return "redirect:placeRentalManager.do";
	}
	
	//선택 예약 승인하기
	@RequestMapping(value = "/deleteRentalList.do")
	public String deleteRentalList(RentalPlaceVO rentalPlaceVO, Model model, String[] rentalCodes) {
		List<String> rentalCodeList = Arrays.asList(rentalCodes);
		rentalPlaceVO.setRentalCodeList(rentalCodeList);
		centerService.deleteRentalList(rentalPlaceVO);
		return "redirect:placeRentalManager.do";
	}
			
	//대관예약 승인하기(Ajax)
	@ResponseBody
	@RequestMapping(value = "/updateRentalApprovalYN.do")
	public int updateRentalApprovalYN(RentalPlaceVO rentalPlaceVO) {
		int result = centerService.updateRentalApprovalYN(rentalPlaceVO);
		return result;
	}
	
	//대관예약 취소하기(Ajax)
	@ResponseBody
	@RequestMapping(value = "/deleteRental.do")
	public int deleteRental(String rentalCode) {
		int result = centerService.deleteRental(rentalCode);
		return result;
	}
	
	
}










