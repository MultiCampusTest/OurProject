package tm.member.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
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
	public void memberJoin(MemberVo memberVo, String img_url, MultipartHttpServletRequest req) throws Exception {
		memberVo.setPwd(generateKey(memberVo.getPwd()));
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
	public boolean checkLogin(String userid, String pwd) throws Exception {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		System.out.println(memberVo.getPwd());
		if(memberVo != null) {
			String inputKey = generateKey(pwd);
			System.out.println(inputKey);
			if(memberVo.getPwd().equals(inputKey))
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
	public HashMap<String, Object> findUsername(String firstName, String birthday) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("firstName", firstName);
		params.put("birthday", birthday);
		MemberVo memberVo = memberDao.findEmail(params);
		
		if(memberVo != null) {
			HashMap<String, Object> memberInfo = new HashMap<>();
			memberInfo.put("member", memberVo);
			return memberInfo;			
		} else {
			return null;
		}
	}


	@Override
	public HashMap<String, Object> findPassword(String userid, String firstName) {
		// TODO Auto-generated method stub
		MemberVo memberVo = memberDao.memberSelectOne(userid);
		if(memberVo != null) {
			if(firstName.equals(memberVo.getFirstName())) {
				HashMap<String, Object> memberInfo = new HashMap<>();
				memberInfo.put("member", memberVo);
				return memberInfo;			
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	
	//비밀번호 알고리즘
	@Override
	public String generateKey(String pwd) throws Exception {
		// TODO Auto-generated method stub
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
				
		String key = "abcdefghijklmnop";
		byte[] keyByte = key.getBytes();
				
		String plainText = pwd;
		byte[] plainByte = plainText.getBytes();
				
		SecretKeySpec keySpec = new SecretKeySpec(keyByte, "AES");
		IvParameterSpec ivSpec = new IvParameterSpec(keyByte);
		cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
		
		byte[] encryptData = cipher.doFinal(plainByte);
		
		return new String(encryptData);
	}
}
