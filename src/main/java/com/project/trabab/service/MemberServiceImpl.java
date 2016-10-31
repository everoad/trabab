package com.project.trabab.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trabab.dao.MemberDao;
import com.project.trabab.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public MemberVO loginOk(MemberVO memberVo) {
		System.out.println("login");
		memberVo = memberDao.loginOk(memberVo);
		
		return memberVo;
	}

	@Override
	public void joinOk(MemberVO memberVo) {
		System.out.println("join");
		String member_password;
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
		
		memberVo.setMember_password(member_password);
		
		int cnt = memberDao.joinOk(memberVo);
		
		System.out.println(cnt);
	}

	@Override
	public HashMap<String, String> checkNickName(String member_nickname) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", memberDao.checkNickName(member_nickname) + "");
		return map;
	}

	@Override
	public HashMap<String, String> checkEmail(String member_email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("flag", memberDao.checkEmail(member_email) + "");
		return map;
	}

	@Override
	public List<HashMap<String, String>> checkFollowNewContent(String member_no) {
		return memberDao.checkFollowNewContent(member_no);
	}

	@Override
	public int addFollowing(HashMap<String, String> map) {
		memberDao.increaseFollowerCnt(map.get("flw_member_no"));
		memberDao.increaseFollowingCnt(map.get("my_member_no"));
		return memberDao.addFollowing(map);
	}

	@Override
	public int checkFollowing(HashMap<String, String> map) {
		return memberDao.checkFollowing(map);
	}

	@Override
	public int deleteFollowing(HashMap<String, String> map) {
		memberDao.decreaseFollowerCnt(map.get("flw_member_no"));
		memberDao.decreaseFollowingCnt(map.get("my_member_no"));
		return memberDao.deleteFollowing(map);
	}

	@Override
	public List<HashMap<String, String>> getMyWrittenList(HashMap<String, Integer> map){
		List<HashMap<String, String>> list =memberDao.getMyWrittenList(map);
		return list;
	};
	
	@Override
	public List<HashMap<String, String>> getMyLikeList(HashMap<String, Integer> map){
		List<HashMap<String, String>> list =memberDao.getMyLikeList(map);
		return list;
	};
	
	@Override
	public List<HashMap<String, String>> getMyListMap(String member_no){
		List<HashMap<String, String>> list =memberDao.getMyListMap(member_no);
		return list;
	}

	@Override
	public MemberVO getMemberInfo(String member_no) {
		return memberDao.getMemberInfo(member_no);
	}

	@Override
	public List<HashMap<String, String>> getFollowingList(String member_no) {
		return memberDao.getFollowingList(member_no);
	}

	@Override
	public List<HashMap<String, String>> getFollowerList(String member_no) {
		// TODO Auto-generated method stub
		return memberDao.getFollowerList(member_no);
	};
	
	@Override
	public MemberVO getMyinfoView(String member_no){
		return memberDao.getMyinfoView(member_no);
	};

	@Override
	public void modifyOk(MemberVO memberVo) {
		String member_password;
		if(memberVo.getMember_password() != null) {
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
			
			memberVo.setMember_password(member_password);
		}
		int cnt = memberDao.modifyMyinfoOk(memberVo);
		System.out.println(cnt);
	}

	@Override
	public List<HashMap<String, Integer>> getAgeCount() {
		return memberDao.getAgeCount();
	}

	@Override
	public List<HashMap<String, Integer>> getBoardCount() {
		return memberDao.getBoardCount();
	}

	@Override
	public List<HashMap<String, Integer>> getBoardHitSum() {
		return memberDao.getBoardHitSum();
	}


	@Override
	public List<HashMap<String, Integer>> getGenderCount() {
		return memberDao.getGenderCount();
	}

	@Override
	public List<MemberVO> getNormalMemberList() {
		return memberDao.getNormalMemberList();
	}

	@Override
	public List<MemberVO> getPowerMemberList() {
		return memberDao.getPowerMemberList();
	}

	@Override
	public void outMemberOk(String member_no) {
		memberDao.outMemberOk(member_no);
	}

	@Override
	public void powerUp(String member_no) {
		memberDao.powerUp(member_no);
	}

	@Override
	public void powerDown(String member_no) {
		memberDao.powerDown(member_no);
	}

	@Override
	public String getPowerMember() {
		return memberDao.getPowerMember();
	}

	

}
