package com.action;



import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderItemDAO;
import com.model.TGoods;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport
{
	private TGoodsDAO goodsDAO;
	private String goodsName;
	private TOrderItemDAO orderItemDAO;
	
	
	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");

		String sql="from TGoods where goodsDel='no'";
		if(goodsName!=null && !"".equals(goodsName)){
			sql+=" and goodsName like '%"+goodsName+"%'";
		}
		sql+=" order by goodsId desc";
		
		List goodsNoTejiaList=goodsDAO.getHibernateTemplate().find(sql);
		if(goodsNoTejiaList.size()>10)
		{
			goodsNoTejiaList=goodsNoTejiaList.subList(0, 10);
		}
		
		for(int i=0;i<goodsNoTejiaList.size();i++){
			TGoods g=(TGoods)goodsNoTejiaList.get(i);
			g.setXiaoliang(orderItemDAO.getXiaoliang(g.getGoodsId()));
		}
		
		Collections.sort(goodsNoTejiaList);
		
		request.put("goodsNoTejiaList", goodsNoTejiaList);
	
		//paihangbang
		List goodsList=new ArrayList();
		sql="select sum(goodsQuantity),goodsId from TOrderItem group by goodsId order by sum(goodsQuantity) desc";
		List list=orderItemDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<list.size();i++)
		{
			Object[] b=(Object[])list.get(i);
			int goodsId=Integer.parseInt(b[1].toString());
			System.out.println(goodsId+"&&");
			TGoods goods=goodsDAO.findById(goodsId);
			goodsList.add(goods);
		}
		if(goodsList.size()>5)
		{
			goodsList=goodsList.subList(0, 5);
		}
		request.put("goodsList", goodsList);
		//paihangbang
		
		
		return ActionSupport.SUCCESS;
	}
	

	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}

	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}


	public TOrderItemDAO getOrderItemDAO()
	{
		return orderItemDAO;
	}


	public void setOrderItemDAO(TOrderItemDAO orderItemDAO)
	{
		this.orderItemDAO = orderItemDAO;
	}


	public String getGoodsName() {
		return goodsName;
	}


	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	
}
