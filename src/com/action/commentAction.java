package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCommentDAO;
import com.dao.TGoodsDAO;
import com.model.TAdmin;
import com.model.TComment;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class commentAction extends ActionSupport
{
	private int id;
	private int goodsId;
	private String comment;
	private String cstart;
	
	private TCommentDAO commentDAO;
	private TGoodsDAO goodsDAO;
	
	private String message;
	private String path;
	private String creply;
	
	
	public String commentMana()
	{
		List commentList=commentDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("commentList", commentList);
		return ActionSupport.SUCCESS;
	}
	
	public String commentAdd()
	{
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		TComment c=new TComment();
		c.setComment(comment);
		c.setUser(user);
		c.setCstart(cstart);
		c.setGoods(goodsDAO.findById(goodsId));
		c.setCtime(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
				
		commentDAO.save(c);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		this.setMessage("评价成功");
		this.setPath("goodsDetailQian.action?goodsId="+goodsId);
		return "succeed";
	}
	
	
	public String commentDel()
	{
		TComment comment=commentDAO.findById(id);
		commentDAO.delete(comment);
		this.setMessage("删除成功");
		this.setPath("commentMana.action");
		return "succeed";
	}
	
	public String commentReply()
	{
		TComment comment=commentDAO.findById(id);
		comment.setCreply(creply);
		commentDAO.attachDirty(comment);
		this.setMessage("回复成功");
		this.setPath("commentMana.action");
		return "succeed";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String commentAll()
	{
		List commentList=commentDAO.findAll();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("commentList", commentList);
		return ActionSupport.SUCCESS;
	}
	

	
	public TCommentDAO getCommentDAO()
	{
		return commentDAO;
	}

	public void setCommentDAO(TCommentDAO commentDAO)
	{
		this.commentDAO = commentDAO;
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

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCstart() {
		return cstart;
	}

	public void setCstart(String cstart) {
		this.cstart = cstart;
	}

	public TGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(TGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getCreply() {
		return creply;
	}

	public void setCreply(String creply) {
		this.creply = creply;
	}


	

}
