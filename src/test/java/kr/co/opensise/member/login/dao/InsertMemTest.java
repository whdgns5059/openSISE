package kr.co.opensise.member.login.dao;

import static org.junit.Assert.*;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.member.Login.dao.LoginDao;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.util.CommonUtilTest;

public class InsertMemTest extends RootSetup{
	private Logger log = LoggerFactory.getLogger(CommonUtilTest.class);

	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	@Before
	public void setup() {
		//loginDao.delete();
	}
	
	@Test
	public void signup() {
		
		for(int j =0 ; j< 1000 ; j++) {
			
			MemberVo memberVo = new MemberVo();
			
			// 이메일 만들기
			String email = "";
			for (int i = 1; i < 6; i++) {
			      char ch = (char) ((Math.random() * 26) + 97);
			      email += ch;
			}
			for (int i = 1; i < 4; i++) {
			      int num = (int)(Math.random() * 10);
			      email += num;
			}
			
			// 이름 만들기
			String[] lastName = {"김","이","박","최","정","강","조","윤","장","임","한","오","서","신","권","황","안","송","전","홍","류","고","문","량","손","배","조","백","허","유","남",
					"심","로","정","하","곽","성","차","주","우","구","신","임","전","민","유","류","나","진","지","엄","채","원","천","방","공","강","현","함","변","염","양","신","석",
					"방","공","강","현","함","변","양","여","추","도","소","선","설","마","길","주","연","방","표","명","기","반","라","옥","육","인","맹","제","모","장","탁",
					"여","진","어","은","편"};
			String[] firstName = {"가","나","다","라","마","바","사","아","자","차","파","하","윤","훈","치","용","훈","민","선","환","빈","태","양","준","성","희","민","진","미","실",
					"인","수","찬","배","지","정","현","영","규","승","우","소","형","석","균","재","연","동","주","효","종","린","화","광","만","순","대","중","무","필","석","봉","현",
					"유","란","한","보","설","혜","은","설","비","포","장","원","후","기","홍","신","섭","야","방","길","위","표","명","금","왕","반","옥","육","도","완","비","경","호",
					"실","신","숙","갑","돌","연","애","종","달","산","너","공","구","주","문","탁","허","도","란","원","염","편","원","희","효","요","빛","한","대","기","혁","욱","창"};
					
			String ran_name = lastName[(int)(Math.random()*lastName.length)];
			for(int i= 0 ; i< 2 ; i++) {
				ran_name += firstName[(int)(Math.random()*firstName.length)];
			}
			
			// 성별 만들기
			String[] gndr = {"F", "M"};
			String ran_gndr = gndr[(int)(Math.random()*gndr.length)];
			
			// 연령대 만들기
			int[] ages = {10, 20, 30, 40, 50, 60};
			
			memberVo.setMem_email(email + "@gmail.com");
			memberVo.setMem_pass(email);
			memberVo.setMem_nm(ran_name);
			memberVo.setMem_gndr(ran_gndr);
			memberVo.setMem_job((int)(Math.random()*7)); // 0~6 랜덤 숫자
			memberVo.setMem_age(String.valueOf((int)(Math.random()*ages.length)));
			
			//int insertCnt = loginDao.signup(memberVo);
			
			//log.info("성공 여부 : {}", insertCnt);
		
		}
	}
	
	
}
