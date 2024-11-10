package com.action;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.dao.TGoodsDAO;

import com.dao.TUserDAO;
import com.model.TGoods;

import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class UserAction extends ActionSupport
{
    private int userId;
	private String userName;
	private String userPw;
	private String userRealname;
	
	private String userAddress;
	private String userTel;
	private String userEmail;
	private String userDel;
   
	
	
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	private TGoodsDAO goodsDAO;

	
	public String userReg()
	{
		TUser user=new TUser();
		
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserDel("no");
		
		userDAO.save(user);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		//request.put("msg", "注册成功，请登录购买");
		this.setMessage("注册成功，请登录购买");
		this.setPath("index.action");
		return "succeed";
	}
	
	
	public String userLogin()
	{
		String sql="from TUser where userName=? and userPw=? and userDel='no'";
		Object[] con={userName,userPw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		
		System.out.println(userList.size()+"%%");
		if(userList.size()==0)
		{
			this.setMessage("用户名或密码错误");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 TUser user=(TUser)userList.get(0);
			 session.put("user", user);
			 session.put("userType", 2);
			 
			 Cart cart=new Cart();
			 session.put("cart", cart);
			 

			 


			 
			 this.setMessage("成功登录");
			 this.setPath("qiantai/default.jsp");
		}
		
		return "succeed";
	}
	
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.put("user", null);
		session.put("userType", null);
		 
		this.setMessage("安全退出系统");
		this.setPath("qiantai/default.jsp");
		return "succeed";
	}
	
	public String userEdit()
	{
		Map session= ServletActionContext.getContext().getSession();
		TUser user=userDAO.findById(userId);
		
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		
		user.setUserRealname(userRealname);
		user.setUserEmail(userEmail);
		user.setUserDel("no");
		
		userDAO.attachDirty(user);
		session.put("user", user);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "修改成功,重新登陆后生效");
		return "msg";
	}
	
	
	
	
	public String userMana()
	{
		String sql="from TUser where userDel='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		
		userDAO.attachDirty(user);
		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserPw()
	{
		return userPw;
	}
	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	public String getUserRealname()
	{
		return userRealname;
	}
	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}
	public String getUserAddress()
	{
		return userAddress;
	}
	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}
	public String getUserTel()
	{
		return userTel;
	}
	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}
	public String getUserEmail()
	{
		return userEmail;
	}
	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}
	public String getUserDel()
	{
		return userDel;
	}
	public void setUserDel(String userDel)
	{
		this.userDel = userDel;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public TGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}


	public void setGoodsDAO(TGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}



	
}
