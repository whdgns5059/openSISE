package kr.co.opensise.admin.statis.dao;


import java.util.List;

import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.MemberVo;

public interface StatisDaoInf {

	/**
	* Method : countAllMembers
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 누적 회원 수
	*/
	public int countAllMembers();
	
	/**
	* Method : countSignIn
	* 작성자 : Bella
	* 변경이력 :
	* Method 설명 : 현재 가입되어 있는 회원 수
	*/
	public int countSignIn();
	
	/**
	* Method : signInDaily
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 5일부터 오늘까지 일별 가입한 회원 수
	*/
	public List<MemberVo> signInDaily();
	
	/**
	* Method : signOutDaily
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 5일부터 오늘까지 일별 탈퇴한 회원 수
	*/
	public List<MemberVo> signOutDaily();
	
	/**
	* Method : signInMonthly
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 2018.11 이후 달별 가입한 회원 수
	*/ 
	public List<MemberVo> signInMonthly();
	
	/**
	* Method : signOutMonthly
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 2018.11 이후 달별 탈퇴한 회원 수
	*/
	public List<MemberVo> signOutMonthly();
	
	/**
	* Method : signInAgeGndr
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 연령별/성별 가입 회원 수
	*/
	public List<MemberVo> signInAgeGndr();
	
	/**
	* Method : favorEach
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 개별 찜 받은 개수
	*/
	public List<FavoriteVo> favorEach();
	
	/**
	 * Method : favorDong
	 * 작성자 : Bella
	 * 변경이력 :
	 * @return
	 * Method 설명 : 동별 찜 받은 개수
	 */
	public List<FavoriteVo> favorDong();
	
	/**
	* Method : favorGu
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 구별 찜 받은 개수
	*/
	public List<FavoriteVo> favorGu();
	
	
	
	
	
	
	
	
	
	
	
	
//	public int test(MemberVo memVo);
	
	
	
	
	
	
	
	
}
