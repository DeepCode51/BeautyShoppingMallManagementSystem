package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.model.TCatelog;
import com.opensymphony.xwork2.ActionSupport;

public class catelogAction extends ActionSupport
{
	private int catelogId;
	private String catelogName;
	private String catelogMiaoshu;
	
	private String message;
	private String path;
	
	private TCatelogDAO catelogDAO;
	private TGoodsDAO goodsDAO;
	
	public String catelogAdd()
	{
		TCatelog catelog=new TCatelog();
		
		catelog.setCatelogName(catelogName);
		catelog.setCatelogDel("no");
		
		catelogDAO.save(catelog);
		
		this.setMessage("操作成功");
		this.setPath("catelogMana.action");
		return "succeed";
	}
	
	public String toUpdate(){
		TCatelog catelog=catelogDAO.findById(catelogId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("catelog", catelog);
		return SUCCESS;
	}
	public String update(){
		TCatelog catelog=catelogDAO.findById(catelogId);
		catelog.setCatelogName(catelogName);
		catelogDAO.attachDirty(catelog);
		this.setMessage("操作成功");
		this.setPath("catelogMana.action");
		return "succeed";
	}
	
	public String catelogMana()
	{
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("cateLogList", cateLogList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String catelogDel()
	{
		String sql="from TGoods where goodsDel='no' and goodsCatelogId="+catelogId;
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		if(goodsList.size()>0)
		{
			this.setMessage("请先删除此类别下的苗圃");
			this.setPath("catelogMana.action");
		}
		else
		{
			TCatelog catelog=catelogDAO.findById(catelogId);
			catelog.setCatelogDel("yes");
			catelogDAO.attachDirty(catelog);
			this.setMessage("操作成功");
			this.setPath("catelogMana.action");
		}
		return "succeed";
	}
	
	public String catelogAll()
	{
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("cateLogList", cateLogList);
		return ActionSupport.SUCCESS;
	}
	
	
	

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}

	public int getCatelogId()
	{
		return catelogId;
	}

	public void setCatelogId(int catelogId)
	{
		this.catelogId = catelogId;
	}

	public String getCatelogMiaoshu()
	{
		return catelogMiaoshu;
	}

	public void setCatelogMiaoshu(String catelogMiaoshu)
	{
		this.catelogMiaoshu = catelogMiaoshu;
	}

	public String getCatelogName()
	{
		return catelogName;
	}

	public void setCatelogName(String catelogName)
	{
		this.catelogName = catelogName;
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



	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}



	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}
	

}
