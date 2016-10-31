package com.project.trabab;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trabab.service.MemberService;
import com.project.trabab.service.PlanService;
import com.project.trabab.vo.MemberVO;

@Controller("*.member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PlanService planService;

	@RequestMapping("login_view.member")
	public String loginView(@RequestParam(value = "go", defaultValue = "null") String go, MemberVO memberVo,
			HttpSession session, Model model) {

		if (!go.equals("null")) {
			String member_password = null;
			System.out.println(memberVo.getMember_email());
			try {
				MessageDigest sh = MessageDigest.getInstance("SHA-256");
				sh.update(memberVo.getMember_password().getBytes());
				byte byteData[] = sh.digest();
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < byteData.length; i++) {
					sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
				}
				member_password = sb.toString();

			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				member_password = null;
			}
			
			MemberVO db_memberVo = memberService.loginOk(memberVo);

			if (db_memberVo == null) {
				model.addAttribute("message", "존재하지 않는 이메일입니다.");

			} else if (!db_memberVo.getMember_password().equals(member_password)) {
				model.addAttribute("message", "비밀번호가 틀렸습니다.");

			} else {
				model.addAttribute("message", "환영합니다.");
				session.setAttribute("member_no", db_memberVo.getMember_no());
				session.setAttribute("member_nickname", db_memberVo.getMember_nickname());
				session.setAttribute("member_email", db_memberVo.getMember_email());
				session.setAttribute("member_profile_image", db_memberVo.getMember_profile_image());
				session.setAttribute("member_power", db_memberVo.getMember_power());
				session.setAttribute("isLogin", true);
			}
		}
		return "member/login_view";
	}
	
	@RequestMapping("mypage_confirm.member")
	public @ResponseBody HashMap<String, String> checkMemberInfo(
			MemberVO memberVo) { 
		System.out.println("asdf");
		String member_password = null;
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(memberVo.getMember_password().getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			member_password = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			member_password = null;
		}
		
		MemberVO db_memberVo = memberService.loginOk(memberVo);
		int flag = 0;
			
		if (db_memberVo.getMember_password().equals(member_password)) {
			flag = 1;
		} 
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", flag + "");
		return map;
	}

	@RequestMapping("join_view.member")
	public String joinView() {
		return "member/join_view";
	}

	@RequestMapping("joinOk.member")
	public String joinOk(@RequestParam("redirect") String redirect, MemberVO memberVo, Model model) {
		memberService.joinOk(memberVo);
		return "redirect:login_view.member?redirect=" + redirect;
	}

	@RequestMapping("logoutOk.member")
	public String logoutOk(HttpSession session) {
		session.removeAttribute("member_no");
		session.removeAttribute("member_email");
		session.removeAttribute("member_nickname");
		session.removeAttribute("isLogin");
		session.removeAttribute("member_power");
		session.removeAttribute("member_profile_image");
		return "redirect:index.main";
	}

	@RequestMapping("check_nickname.member")
	public @ResponseBody HashMap<String, String> checkNickName(
										@RequestParam("member_nickname") String member_nickname) {
		System.out.println(member_nickname);
		return memberService.checkNickName(member_nickname);
	}

	@RequestMapping("check_email.member")
	public @ResponseBody HashMap<String, String> checkEmail(@RequestParam("member_email") String member_email) {
		return memberService.checkEmail(member_email);
	}

	@RequestMapping("mypage_view.member")
	public String getMyPageView(HttpSession session, Model model) {
		model.addAttribute("memberVo", memberService.getMemberInfo((String) session.getAttribute("member_no")));
		return "member/mypage_view";
	}

	@RequestMapping("mypage_list.member")
	public @ResponseBody List<HashMap<String, String>> getMyPageList(
																							@RequestParam("cpage") String cpage,
																							@RequestParam("board_type") String board_type,
																							HttpSession session) {
		String member_no = (String) session.getAttribute("member_no");
		List<HashMap<String, String>> list = null;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", Integer.parseInt(member_no));
		map.put("start", (Integer.parseInt(cpage)-1)*5 + 1);
		map.put("end", Integer.parseInt(cpage)*5);

	
		//플랜
		if (board_type.equals("1")) {
			System.out.println("plan");
			list = planService.getPlanMyPageList(map);
			
		//좋아요
		} else if (board_type.equals("2")) {
			System.out.println("likeasdf");
			list = memberService.getMyLikeList(map);  
			
		//임시
		} else if (board_type.equals("3")) {

		//내가쓴글
		} else if (board_type.equals("4")) {
			list = memberService.getMyWrittenList(map);
			
		}
		return list;
	}
	
	@RequestMapping("mypage_map.member")
	public @ResponseBody List<HashMap<String, String>> getMyPageList(HttpSession session) {
		String member_no = (String) session.getAttribute("member_no");

		List<HashMap<String, String>> list = memberService.getMyListMap(member_no);
		
		return list;

	}
	
	@RequestMapping("follow_newcontent.member")
	public @ResponseBody List<HashMap<String, String>> checkFollowNewContent(HttpSession session) {
		System.out.println("follow");
		return memberService.checkFollowNewContent((String) session.getAttribute("member_no"));
	}
	
	@RequestMapping("add_following.member")
	public @ResponseBody HashMap<String, String> addFollowing(
														@RequestParam HashMap<String, String> params, HttpSession session) {
		params.put("my_member_no", (String) session.getAttribute("member_no"));
		params.put("flag", memberService.addFollowing(params) + "");
		return params;
	}
	
	@RequestMapping("delete_following.member")
	public @ResponseBody HashMap<String, String> deleteFollowing(
														@RequestParam HashMap<String, String> params, HttpSession session) {
		params.put("my_member_no", (String) session.getAttribute("member_no"));
		params.put("flag", memberService.deleteFollowing(params) + "");
		return params;
	}
	
	@RequestMapping("check_following.member")
	public @ResponseBody HashMap<String, String> checkFollowing(
														@RequestParam HashMap<String, String> params, HttpSession session) {
		int flag = 0;
		String my_member_no = (String) session.getAttribute("member_no");
		if(my_member_no != null) {
			params.put("my_member_no", my_member_no);
			flag =  memberService.checkFollowing(params);
		}
		params.clear();
		params.put("flag", flag + "");
		return params;
	}
	
	@RequestMapping("get_follower_list.member")
	public @ResponseBody List<HashMap<String, String>> getFollowerList(HttpSession session) {
		return memberService.getFollowerList((String) session.getAttribute("member_no"));
	}
	
	@RequestMapping("get_following_list.member")
	public @ResponseBody List<HashMap<String, String>> getFollowingList(HttpSession session) {
		return memberService.getFollowingList((String) session.getAttribute("member_no"));
	}
	
	@RequestMapping("myinfo_modify.member")
	public String getMyinfomodify(HttpSession session, Model model) {
		String member_no = (String) session.getAttribute("member_no");
		MemberVO memberVO=memberService.getMyinfoView(member_no);
		model.addAttribute("memberVo", memberVO);
		return "member/myinfo_modify";
	}
	
	@RequestMapping("myinfo_modifyOk.member")
	public @ResponseBody MemberVO modifyMyinfoOk(MemberVO memberVo,
											@RequestParam(value="change_pwd_flag", required=false) String change_pwd_flag,
											Model model,
											HttpSession session) {
		

		if(memberVo.getFile() != null) {
			String path = "C:/spring/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/trabab/resources/uploadimg/profile/";
			String originalName = memberVo.getFile().getOriginalFilename();
			originalName = originalName.replaceAll(" ", "_");
			String newName = System.currentTimeMillis() + "_" + originalName;
			
			memberVo.setMember_profile_image(newName);
			session.setAttribute("member_profile_image", newName);
			File f = new File(path + newName);
			try {
				memberVo.getFile().transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		memberService.modifyOk(memberVo);
		memberVo.setFile(null);
		return memberVo;
	}
	
	
	@RequestMapping("admin_view.member")
	public String getAdminView(HttpSession session, Model model) {
		model.addAttribute("ageCount", memberService.getAgeCount());
		model.addAttribute("boardCount", memberService.getBoardCount());
		model.addAttribute("boardHitSum", memberService.getBoardHitSum());
		model.addAttribute("normalMemberList", memberService.getNormalMemberList());
		model.addAttribute("powerMemberList", memberService.getPowerMemberList());
		model.addAttribute("genderCount", memberService.getGenderCount());
		model.addAttribute("powerCount", memberService.getPowerMember());
		return "member/admin_view";
	}
	
	@RequestMapping("outOk.member")
	public String outMemberOk(@RequestParam("member_no") String member_no) {
		memberService.outMemberOk(member_no);
		return "redirect:admin_view.member";
	}
	
	@RequestMapping("power_up.member")
	public String powerUp(@RequestParam("member_no") String member_no) {
		memberService.powerUp(member_no);
		return "redirect:admin_view.member";
	}
	
	@RequestMapping("power_down.member")
	public String powerDown(@RequestParam("member_no") String member_no) {
		memberService.powerDown(member_no);
		return "redirect:admin_view.member";
	}
	
}
