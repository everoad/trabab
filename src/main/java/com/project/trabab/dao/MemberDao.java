package com.project.trabab.dao;

import java.util.HashMap;
import java.util.List;

import com.project.trabab.vo.MemberVO;

public interface MemberDao {

	public MemberVO loginOk(MemberVO memberVo);
	
	public int joinOk(MemberVO memberVo);
	
	public int checkNickName(String member_nickname);
	
	public int checkEmail(String member_email);
	
	public MemberVO getMemberInfo(String member_no);
	
	public List<HashMap<String, String>> getMyWrittenList(HashMap<String, Integer> map);
	
	public List<HashMap<String, String>> getMyLikeList(HashMap<String, Integer> map);
	
	public List<HashMap<String, String>> getMyListMap(String member_no);
	
	
	
	
	public List<HashMap<String, String>> checkFollowNewContent(String member_no);
	
	public int addFollowing(HashMap<String, String> map);
	
	public int checkFollowing(HashMap<String, String> map);
	
	public int deleteFollowing(HashMap<String, String> map);
	
	
	
	public int increaseFollowerCnt(String flw_member_no);
	
	public int decreaseFollowerCnt(String flw_member_no);
	
	public int increaseFollowingCnt(String my_member_no);
	
	public int decreaseFollowingCnt(String my_member_no);
	
	
	
	public List<HashMap<String,String>> getFollowingList(String member_no);
	
	public List<HashMap<String, String>> getFollowerList(String member_no);
  	
	
	
	public MemberVO getMyinfoView(String member_no);
	
	public int modifyMyinfoOk(MemberVO memberVo);
	
	
	
	public List<HashMap<String, Integer>> getAgeCount();
	
	public List<HashMap<String, Integer>> getBoardCount();
	
	public List<HashMap<String, Integer>> getBoardHitSum();
	
	public List<MemberVO> getNormalMemberList();

	public List<MemberVO> getPowerMemberList();
	
	public List<HashMap<String, Integer>> getGenderCount();
	
	
	public void outMemberOk(String member_no);
	
	public void powerUp(String member_no);
	
	public void powerDown(String member_no);

	
	public String getPowerMember();
}
