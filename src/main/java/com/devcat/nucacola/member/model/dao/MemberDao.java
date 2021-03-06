package com.devcat.nucacola.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.devcat.nucacola.common.model.vo.PageInfo;
import com.devcat.nucacola.common.model.vo.Skills;
import com.devcat.nucacola.member.model.vo.Bookmark;
import com.devcat.nucacola.member.model.vo.Carrer;
import com.devcat.nucacola.member.model.vo.CompSub;
import com.devcat.nucacola.member.model.vo.Connection;
import com.devcat.nucacola.member.model.vo.Member;
import com.devcat.nucacola.member.model.vo.Project;
import com.devcat.nucacola.member.model.vo.UserFiled;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	//이메일 인증용 키 삽입
	public int setAuthKey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.setAuthKey", m);
	}
	
	//이메일 인증값 변경
	public int confirmEmail(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.confirmEmail",m);
	}
	
	//이메일 중복체크
	public String checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	
	
	
	


	
	// 한줄 소개
	public int updateUserInfo(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("memberMapper.updateUserInfo",m);
	}

	
	//활동 분야, 기술
	public ArrayList<Skills> checkSkill(SqlSessionTemplate sqlSession, String skillName) {

		return (ArrayList)sqlSession.selectList("memberMapper.checkSkill",skillName);
	}

	public int insertUserFiled(SqlSessionTemplate sqlSession, HashMap<String,Object> hm) {
		
		return sqlSession.insert("memberMapper.insertUserFiled", hm);
		
	}

	public int deleteUserFiled(SqlSessionTemplate sqlSession,UserFiled uf ) {
		// TODO Auto-generated method stub
		return sqlSession.delete("memberMapper.deleteUserField",uf);
	}
	
	
	
	
	// 업무분야
	public int insertUserPosi(SqlSessionTemplate sqlSession, String userPosi) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateUserPosi(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateUserPosi",m);
	}
	
	
	//프로젝트
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		
		return sqlSession.insert("projectMapper.insertUserProject", p);
	}
	// 프로젝트수정
	public int updateProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.update("projectMapper.updateUserProject", p);
	}
	

	// 학력
	public int insertUserEdu(SqlSessionTemplate sqlSession, Member m) {
		return 0;
	}
	
	
	// 학력 조회
	public String selectUserEdu(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectUserEdu", userNo);
	}


	public int updateUserEdu(SqlSessionTemplate sqlSession,Member m) {
		
		return sqlSession.update("memberMapper.updateUserEdu", m);

	}

	
	// 경력
	public int insertCarrer(SqlSessionTemplate sqlSession, Carrer c) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateCarrer(SqlSessionTemplate sqlSession, Carrer c) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertBookmark(SqlSessionTemplate sqlSession, Bookmark b) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 북마크 조회
	public int countBookmark(SqlSessionTemplate sqlSession, int uno) {
		return sqlSession.selectOne("memberMapper.countBookmark",uno);
	}
	//북마크 페이징 처리
	public ArrayList<Bookmark> selectBookmark(SqlSessionTemplate sqlSession,int uno,PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectBookmark", uno,rowBounds);
	}
	public ArrayList<Bookmark> selectRecruitSkills(SqlSessionTemplate sqlSession,int uno) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecruitSkills", uno);
	}

	public int deleteBookmark(SqlSessionTemplate sqlSession, Bookmark bno) {
		return sqlSession.delete("memberMapper.deleteBookmark",bno);
	}

	//기업구독
	public int insertSubComp(SqlSessionTemplate sqlSession, CompSub cs) {
		// TODO Auto-generated method stub
		return 0;
	}
	// 기업구독 조회
	public int countSubComp(SqlSessionTemplate sqlSession, int uno) {
		return sqlSession.selectOne("memberMapper.countSubComp",uno);
	}
	public ArrayList<CompSub> selectSubComp(SqlSessionTemplate sqlSession, int uno, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectSubComp",uno);
	}

	public int deleteSubComp(SqlSessionTemplate sqlSession, CompSub cs) {
		return sqlSession.delete("memberMapper.deleteSubComp", cs);
	}

	public String selectUserInfo(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.selectOne("memberMapper.selectUserInfo", userNo);
	}

	public ArrayList<Skills> getSkillNo(SqlSessionTemplate sqlSession, String[] arr) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.getSkillNo",arr);
	}

	public Member selectUserProfile(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectUserProfile", userNo);
	}

	public ArrayList<Skills> selectUserSkill(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectUserSkill", userNo);
	}

	
	//인맥 (팔로워, 팔로잉, 연결)
	
	//팔로워(나를팔로우하는사람)
	public ArrayList<Member> selectFollowers(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowers",userNo,rowBounds);
		
	}
	
	public int countFollowers(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.countFollowers",userNo);
		
	}
	
	
	
	//팔로잉(내가팔로우하는사람)
	public ArrayList<Member> selectFollowings(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectFollowings",userNo,rowBounds);
		
	}
	
	public int countFollowings(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.countFollowings",userNo);
		
	}
	
	//연결된사람(맞팔)
	public ArrayList<Member> selectConnections(SqlSessionTemplate sqlSession, int userNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectConnections", userNo,rowBounds);
		
	}
	
	public int countConnections(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.countConnections",userNo);
		
	}
	
	
	//팔로잉 추가(내가 다른 사람 팔로우)
	public int addFollowing(SqlSessionTemplate sqlSession, Connection conn) {
		return sqlSession.insert("memberMapper.addFollowing",conn);
	}
	//팔로우 취소
	public int cancelFollowing(SqlSessionTemplate sqlSession, Connection conn) {
		return sqlSession.delete("memberMapper.cancelFollowing",conn);
	}

	
	
	
	
	
	
	
}
