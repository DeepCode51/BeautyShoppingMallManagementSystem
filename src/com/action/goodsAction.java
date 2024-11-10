package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TCommentDAO;
import com.dao.TGoodsDAO;
import com.dao.TOrderItemDAO;
import com.model.TCatelog;
import com.model.TGoods;
import com.model.TOrderItem;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class goodsAction extends ActionSupport
{
	private Integer goodsId;
	private Integer dianpuId;
	private String goodsName;
	private String publisher;
	private String isbn;
	private String author;

	private String publishtime;	
	private String goodsMiaoshu;
	private String goodsPic;
	private Integer goodsShichangjia;
	private Integer goodsTejia;
	private String goodsYangshi;
	private Integer goodsCatelogId;
	private Integer goodsNum;
	private String goodsDel;
	
	private String message;
	private String path;
	
	private TGoodsDAO goodsDAO;
	private TCommentDAO commentDAO;
	private TOrderItemDAO orderItemDAO;
	
	
	public String goodsAdd()
	{
		HttpServletRequest re=ServletActionContext.getRequest();
		String fujian=re.getParameter("fujian");

		TGoods goods=new TGoods();
		goods.setGoodsCatelogId(goodsCatelogId);
		goods.setGoodsName(goodsName);
		goods.setPublisher(publisher);
		goods.setIsbn(isbn);
		goods.setPublishtime(publishtime);
		goods.setAuthor(author);
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic(fujian);
		goods.setGoodsShichangjia(goodsShichangjia);
		goods.setGoodsTejia(goodsShichangjia);
		goods.setGoodsYangshi(goodsYangshi);
		goods.setGoodsNum(goodsNum);
		goods.setGoodsDel("no");
		
		goodsDAO.save(goods);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "商品发布完毕");
		return "msg";
		
	}
	public String toUpdate(){
		TGoods goods=goodsDAO.findById(goodsId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goods", goods);
		return SUCCESS;
	}
	public String update(){
		HttpServletRequest re=ServletActionContext.getRequest();
		String fujian=re.getParameter("fujian");
		TGoods goods=goodsDAO.findById(goodsId);

		goods.setGoodsName(goodsName);
		goods.setPublisher(publisher);
		goods.setIsbn(isbn);
		goods.setPublishtime(publishtime);
		goods.setAuthor(author);
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic(fujian);
		goods.setGoodsShichangjia(goodsShichangjia);
		goods.setGoodsTejia(goodsShichangjia);
		goods.setGoodsYangshi(goodsYangshi);
		goods.setGoodsNum(goodsNum);
		goodsDAO.attachDirty(goods);
		this.setMessage("操作成功");
		this.setPath("goodsMana.action");
		return "succeed";
	}
	
	public String goodsMine()
	{
		Map session = ActionContext.getContext().getSession();
		
		String sql="from TGoods where goodsDel='no'";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	public String goodsDel()
	{
		TGoods goods=goodsDAO.findById(goodsId);
		goods.setGoodsDel("yes");
		goodsDAO.attachDirty(goods);

		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "删除完毕");
		return "msg";
	}
	
	
	
	public String goodsMana()
	{
		String sql="from TGoods where goodsDel='no'";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String goodsDetailHou()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	public String goodsAllNoTejia()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' order by goodsCatelogId";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	public String goodsDetailQian()
	{
		Map session= ServletActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");
		
		
		
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		Integer count=0;
		if(user!=null){
			count=orderItemDAO.shifougoumai(goods.getGoodsId(),user.getUserId());
			request.put("count", count);
		}
		List comments=commentDAO.findByProperty("goods.goodsId", goods.getGoodsId());
		request.put("comments", comments);
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String goodsByCatelog()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and goodsCatelogId=? order by goodsCatelogId";
		Object[] con={goodsCatelogId};
		List goodsList=goodsDAO.getHibernateTemplate().find(sql,con);
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}
	
	

	public Integer getGoodsId()
	{
		return goodsId;
	}


	public void setGoodsId(Integer goodsId)
	{
		this.goodsId = goodsId;
	}


	public Integer getDianpuId()
	{
		return dianpuId;
	}


	public void setDianpuId(Integer dianpuId)
	{
		this.dianpuId = dianpuId;
	}


	public String getGoodsName()
	{
		return goodsName;
	}


	public void setGoodsName(String goodsName)
	{
		this.goodsName = goodsName;
	}
	



	
	public String getPublisher()
	{
		return publisher;
	}


	public void setPublisher(String publisher)
	{
		this.publisher = publisher;
	}

	public String getIsbn()
	{
		return isbn;
	}


	public void setIsbn(String isbn)
	{
		this.isbn = isbn;
	}
	
	public String getAuthor()
	{
		return author;
	}


	public void setAuthor(String author)
	{
		this.author = author;
	}


	public String getPublishtime()
	{
		return publishtime;
	}


	public void setPublishtime(String publishtime)
	{
		this.publishtime = publishtime;
	}
	
	
	
	
	
	
	
	
	
	
	public String getGoodsMiaoshu()
	{
		return goodsMiaoshu;
	}


	public void setGoodsMiaoshu(String goodsMiaoshu)
	{
		this.goodsMiaoshu = goodsMiaoshu;
	}


	public String getGoodsPic()
	{
		return goodsPic;
	}


	public void setGoodsPic(String goodsPic)
	{
		this.goodsPic = goodsPic;
	}


	public Integer getGoodsShichangjia()
	{
		return goodsShichangjia;
	}


	public void setGoodsShichangjia(Integer goodsShichangjia)
	{
		this.goodsShichangjia = goodsShichangjia;
	}


	public Integer getGoodsTejia()
	{
		return goodsTejia;
	}


	public void setGoodsTejia(Integer goodsTejia)
	{
		this.goodsTejia = goodsTejia;
	}

	public Integer getGoodsCatelogId()
	{
		return goodsCatelogId;
	}


	public void setGoodsCatelogId(Integer goodsCatelogId)
	{
		this.goodsCatelogId = goodsCatelogId;
	}


	public String getGoodsDel()
	{
		return goodsDel;
	}


	public void setGoodsDel(String goodsDel)
	{
		this.goodsDel = goodsDel;
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



	public String getGoodsYangshi() {
		return goodsYangshi;
	}


	public void setGoodsYangshi(String goodsYangshi) {
		this.goodsYangshi = goodsYangshi;
	}


	public TCommentDAO getCommentDAO() {
		return commentDAO;
	}


	public void setCommentDAO(TCommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	public TOrderItemDAO getOrderItemDAO() {
		return orderItemDAO;
	}
	public void setOrderItemDAO(TOrderItemDAO orderItemDAO) {
		this.orderItemDAO = orderItemDAO;
	}
	public Integer getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}

	
}
