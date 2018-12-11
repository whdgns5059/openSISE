package kr.co.opensise.admin.statis.service;

import java.util.List;

import kr.co.opensise.admin.statis.model.MemberVo;

public interface StatisServiceInf {

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
	* Method 설명 : 12월부터 오늘까지 일별 가입한 회원 수
	*/
	public List<MemberVo> signInMonthly();
	
	/**
	* Method : signOutMonthly
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 12월부터 오늘까지 월별 탈퇴한 회원 수
	*/
	public List<MemberVo> signOutMonthly();
	
	
	
	
	
	
	
}
