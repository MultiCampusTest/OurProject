package tm.member.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.image.dao.IImageDao;
import tm.image.service.ImageService;
import tm.image.vo.ImageVo;
import tm.member.dao.IMemberDao;
import tm.member.vo.EmailVo;
import tm.member.vo.MemberVo;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private IMemberDao memberDao;
	
	@Autowired
	private IImageDao imageDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ImageService imageService;

	@Override
	public void memberJoin(MemberVo memberVo, String img_url, MultipartHttpServletRequest req) {
		memberDao.memberInsert(memberVo);
		if(img_url.equals("default")) {
			ImageVo imageVo = new ImageVo();
			imageService.insertImg(imageVo, memberVo.getUserid(), req);
		} else {
			HashMap<String, Object> params = new HashMap<>();
			params.put("userid", memberVo.getUserid());
			params.put("img_code", img_url);
			imageService.insertUrl(params);
		}
	}
	

	@Override
	public boolean checkLogin(String userid, String pwd) {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		if(memberVo != null) {
			if(memberVo.getPwd().equals(pwd))
				return true;
			else
				return false;			
		} else
			return false;
	}


	@Override
	public boolean checkId(String userid) {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		if(memberVo == null)
			return false;
		else
			return true;
	}


	@Override
	public boolean memberRemove(MemberVo memberVo) {
		// TODO Auto-generated method stub
		int result = memberDao.memberDelete(memberVo);
		
		if(result > 0)
			return true;
		else
			return false;
	}


	@Override
	public HashMap<String, Object> memberSelectOne(String userid) {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		HashMap<String, Object> memberInfo=new HashMap<>();
		memberInfo.put("member", memberVo);
		return memberInfo;
	}


	@Override
	public boolean memberModify(MemberVo memberVo, String userid, MultipartHttpServletRequest req) {
		ImageVo imageVo = new ImageVo();
		imageVo.setImg_code(userid);
		imageService.updateImg(imageVo, userid, req);
		int result=memberDao.memberUpdate(memberVo);
		if(result>0)
			return true;
		else
			return false;
			
	}
	


	@Override
	public boolean searchPassword(MemberVo memberVo) {
		// TODO Auto-generated method stub
		int result = memberDao.passwordReset(memberVo);
		if(result > 0)
			return true;
		else
			return false;
	}

	@Override
	public void sendEmail(EmailVo emailVo) throws Exception {
		// TODO Auto-generated method stub
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setSubject(emailVo.getSubject());
        msg.setText(emailVo.getContent());
        msg.setRecipient(RecipientType.TO , new InternetAddress(emailVo.getReciver()));
        mailSender.send(msg);
		
	}
}
