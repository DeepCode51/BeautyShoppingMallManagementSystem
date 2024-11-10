package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderDAO;
import com.dao.TOrderItemDAO;


import com.model.TGoods;
import com.model.TOrder;
import com.model.TOrderItem;

import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class xiaoshouAction extends ActionSupport
{
	private TOrderItemDAO orderItemDAO;
	private TGoodsDAO goodsDAO;
	private TOrderDAO orderDAO;
	private int type;

	private int orderId;
	private String message;
	private String path;
	public String xiaoshouMine()
	{
		Map session= ServletActionContext.getContext().getSession();

	    String sql="from TOrderItem  order by zt";
	    List orderItemList=orderItemDAO.getHibernateTemplate().find(sql);
	    for(int i=0;i<orderItemList.size();i++)
	    {
	    	TOrderItem orderItem=(TOrderItem)orderItemList.get(i);
	    	orderItem.setOrder(orderDAO.findById(orderItem.getOrderId()));
	    	orderItem.setGoods(goodsDAO.findById(orderItem.getGoodsId()));
	    }
	    
	    System.out.println(orderItemList.size()+"**");
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderItemList", orderItemList);
		return ActionSupport.SUCCESS;
		
	}
	
	public String orderdata() throws IOException{
		String result="";
		//每日销量
		if(type==1){
			result=(String)orderDAO.getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public String doInHibernate(Session session) throws HibernateException,
						SQLException {
					SimpleDateFormat f=new SimpleDateFormat("yyyy-MM");
					String ym=f.format(new Date());
					String sql="select SUBSTRING(order_date,1,10) orderdate,sum(order_jine) jine from t_order  where order_date like '"+ym+"%' group by orderdate";
					SQLQuery query=session.createSQLQuery(sql);
					List<Object[]> list=query.list();
					JSONObject obj=new JSONObject();
					JSONArray categories=new JSONArray();
					JSONArray data=new JSONArray();
					for(int i=0;i<list.size();i++){
						categories.add(list.get(i)[0].toString());
						data.add(list.get(i)[1].toString());
					}
					obj.put("categories", categories);
					obj.put("data", data);
					return obj.toJSONString();
				}
			});
		}
		//每日订单数
		if(type==2){
			
			result=(String)orderDAO.getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public String doInHibernate(Session session) throws HibernateException,
						SQLException {
					SimpleDateFormat f=new SimpleDateFormat("yyyy-MM");
					String ym=f.format(new Date());
					String sql="select SUBSTRING(o.order_date,1,10) orderdate,sum(oi.goods_quantity) oinum from t_order o,t_orderitem oi where o.order_id=oi.order_id and o.order_date like '"+ym+"%' and oi.zt='已收货' group by orderdate;";
					SQLQuery query=session.createSQLQuery(sql);
					List<Object[]> list=query.list();
					JSONObject obj=new JSONObject();
					JSONArray categories=new JSONArray();
					JSONArray data=new JSONArray();
					for(int i=0;i<list.size();i++){
						categories.add(list.get(i)[0].toString());
						data.add(list.get(i)[1].toString());
					}
					obj.put("categories", categories);
					obj.put("data", data);
					return obj.toJSONString();
				}
			});
		}
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		
		out.print(result);
		out.close();
		return null;

	}
	

	public String shouli()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int orderItemId=Integer.parseInt(request.getParameter("orderItemId"));
		
		TOrderItem orderItem=orderItemDAO.findById(orderItemId);
		orderItem.setZt("已发货");
		
		orderItemDAO.attachDirty(orderItem);

		//修改库存
		TGoods g=goodsDAO.findById(orderItem.getGoodsId());
		g.setGoodsNum(g.getGoodsNum()-orderItem.getGoodsQuantity());
		goodsDAO.attachDirty(g);
		
		this.setMessage("发货成功");
		this.setPath("xiaoshouMine.action");
		return "succeed";
		
		
		
	}
	
	public String orderDelByAd()//删除订单
	{

	
		TOrder order=orderDAO.findById(orderId);
		orderDAO.delete(order);
		String sql="delete from TOrderItem where orderId="+orderId;
		orderItemDAO.getHibernateTemplate().bulkUpdate(sql);
		
		this.setMessage("删除成功");
		this.setPath("xiaoshouMine.action");
		return "succeed";
	}
	
	public int getOrderId()
	{
		return orderId;
	}



	public void setOrderId(int orderId)
	{
		this.orderId = orderId;
	}


	public TOrderItemDAO getOrderItemDAO()
	{
		return orderItemDAO;
	}


	public void setOrderItemDAO(TOrderItemDAO orderItemDAO)
	{
		this.orderItemDAO = orderItemDAO;
	}


	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}


	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}


	public TOrderDAO getOrderDAO()
	{
		return orderDAO;
	}


	public void setOrderDAO(TOrderDAO orderDAO)
	{
		this.orderDAO = orderDAO;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}



	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
}
