package tm.member.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import tm.image.dao.IImageDao;
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

	@Override
	public void memberJoin(MemberVo memberVo, MultipartHttpServletRequest req) {
		memberDao.memberInsert(memberVo);
		String userid = memberVo.getUserid();
		
		String path = "/Users/student/Upload/";
		File folder = new File(path);
		if( !folder.exists() ) {
			folder.mkdirs();			
		}
		
		List<MultipartFile> files = req.getFiles("file");
		
		
		for(int i=0; i<files.size(); i++) { 
			UUID uuid = UUID.randomUUID();
			String fileName = files.get(i).getOriginalFilename();
			int fileSize = (int) files.get(i).getSize();
			String ext = fileName.substring(fileName.lastIndexOf('.'));
			String fileuri = path + uuid + ext;
			ImageVo image = new ImageVo();
			image.setImg_ori_name(fileName);
			image.setImg_code(memberVo.getUserid());
			image.setImg_path(fileuri);
		
			File localFile = new File(fileuri);
			try{
				files.get(i).transferTo(localFile);
			} catch (IllegalStateException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			imageDao.insertImage(image);
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
	public boolean memberModify(MemberVo memberVo) {
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
