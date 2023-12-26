package com.fa.plus.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fa.plus.admin.domain.MemberChart;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.pdf.ScorePdfView;
import com.fa.plus.admin.service.MemberManageService;
import com.fa.plus.common.MyExcelView;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/memberManage/*")
public class MemberManageController {
	@Autowired
	private MemberManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;	
	
	@Autowired
	private MyExcelView excelView;	
	
	@RequestMapping("list")
	public String memberManage(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "useridx") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String enabled,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();	
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		// 멤버 리스트
		List<MemberManage> list = service.listMember(map);

		String query = "";
		String listUrl = cp + "/admin/memberManage/list";		
		
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (enabled.length() != 0) {
			if (query.length() != 0)
				query = query + "&enabled=" + enabled;
			else
				query = "enabled=" + enabled;
		}

		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("enabled", enabled);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.memberManage.list";
	}
	
	// 회원 상세정보 출력
	@GetMapping("profile")
	public String detaileMember(@RequestParam long useridx,
			Model model) throws Exception {
		MemberManage dto = service.findById(useridx);
		MemberManage memberState = service.findByState(useridx);
		List<MemberManage> listState = service.listMemberState(useridx);

		List<MemberManage> listRank = service.listRank();
	
		model.addAttribute("dto", dto);
		model.addAttribute("memberState", memberState);
		model.addAttribute("listState", listState);
		model.addAttribute("listRank", listRank);
		
		return "admin/memberManage/profile";
	}	
	
	@PostMapping("updateMemberState")
	@ResponseBody
	public Map<String, Object> updateMemberState(MemberManage dto) throws Exception {

		String state = "true";
		try {
			// 회원 활성/비활성 변경
			Map<String, Object> map = new HashMap<>();
			map.put("useridx", dto.getUseridx());
			if (dto.getIs_blocked() == 0) {
				map.put("enabled", 1);
			} else {
				map.put("enabled", 0);
			}
			service.updateMemberEnabled(map);

			// 회원 상태 변경 사항 저장
			service.insertMemberState(dto);

		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}	
	
	// 분석 통계
	@GetMapping("analysis")
	public String analysis(Model model) throws Exception {

		return ".admin.memberManage.analysis";
	}
	
	// AJAX-JSON : 회원 연령대별 인원수
	@GetMapping("ageAnalysis")
	@ResponseBody
	public Map<String, Object> listAgeSection() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();

		List<MemberChart> list = service.listAgeSection();
		
		model.put("list", list);
		
		return model;
	}	
	
	// update 회원등급
	@PostMapping("updateMemberRank")
	@ResponseBody
	public Map<String, Object> updateMemberRank(MemberManage dto) throws Exception {

		String rank_num = "true";
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("rank_num", dto.getRank_num());
			map.put("useridx", dto.getUseridx());
			
			// 회원 등급 변경
			service.insertMemberRank(map);

		} catch (Exception e) {
			rank_num = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("rank_num", rank_num);
		return model;
	}	
	
	@RequestMapping("excel")
	public View excel(Map<String, Object> model) throws Exception {
		List<MemberManage> list = service.listMember();
		String sheetName="회원목록";
		List<String> columnLabels = new ArrayList<String>();
		List<Object[]> columnValues=new ArrayList<Object[]>();
		
		columnLabels.add("회원번호");
		columnLabels.add("회원이름");
		columnLabels.add("회원구분");
		columnLabels.add("생년월일");
		columnLabels.add("가입일");
		columnLabels.add("회원등급");
		columnLabels.add("할인율");
		columnLabels.add("상태");
		
		for(MemberManage dto : list) {
			columnValues.add(new Object[]{dto.getUseridx(), dto.getUser_name(), dto.getUsership(), 
					dto.getBirth(), dto.getReg_date(), dto.getRank1(), dto.getSale(), dto.getEnabled()});
		}
		
		// model.put("filename", "score.xls"); // xlsx 파일을 인식하지 못하면 xls로 다운
		model.put("filename", "member.xlsx"); // 저장할 파일 이름
		model.put("sheetName", sheetName); // 시트이름
		model.put("columnLabels", columnLabels); // 타이틀
		model.put("columnValues", columnValues); // 값
		model.put("list", list);
		
		return excelView;  // 엑셀 파일 다운 로드
		// return new MyExcelView();
	}
	
	@RequestMapping("pdf")
	public View pdf(Map<String, Object> model) throws Exception {
		List<MemberManage> list = service.listMember();
		
		List<String> columnLabels = new ArrayList<String>();
		List<Object[]> columnValues=new ArrayList<Object[]>();
		
		columnLabels.add("회원번호");
		columnLabels.add("회원이름");
		columnLabels.add("회원구분");
		columnLabels.add("생년월일");
		columnLabels.add("가입일");
		columnLabels.add("회원등급");
		columnLabels.add("할인율");
		columnLabels.add("상태");
		
		for(MemberManage dto : list) {
			columnValues.add(new Object[]{dto.getUseridx(), dto.getUser_name(), dto.getUsership(), 
					dto.getBirth(), dto.getReg_date(), dto.getRank1(), dto.getSale(), dto.getEnabled()});
		}
		
		model.put("filename", "memberManage.pdf"); // 저장할 파일 이름
		model.put("columnLabels", columnLabels); // 타이틀
		model.put("columnValues", columnValues); // 값
		model.put("list", list);
		
		return new ScorePdfView();
	}
	
	@RequestMapping("print")
	public String print(Model model) throws Exception {
		List<MemberManage> list = service.listMember();
		model.addAttribute("list", list);
		
		return "/admin/memberManage/print";
	}		
	
}
