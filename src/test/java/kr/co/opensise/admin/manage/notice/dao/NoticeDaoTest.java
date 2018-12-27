package kr.co.opensise.admin.manage.notice.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.model.PostVo;

public class NoticeDaoTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(NoticeDaoTest.class);
	
	@Resource(name="noticeDao")
	private NoticeDaoInf noticeDao;
	
	@Test
	public void insertNoticeTest() {
//		/***Given***/
//		String post_ttl = "공지사항테스트";
//		String post_cntnt = "공지사항내용";
//		
//		PostVo noticeVo = new PostVo();
//		noticeVo.setPost_ttl(post_ttl);
//		noticeVo.setPost_cntnt(post_cntnt);
//		
//		/***When***/
//		int cnt = noticeDao.insertNotice(noticeVo);
//
//		/***Then***/
//		assertEquals(1, cnt);
		
	}
		
}
