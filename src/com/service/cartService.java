package com.service;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TGoodsDAO;
import com.util.Cart;

public class cartService
{
	private TGoodsDAO goodsDAO;
	public String modiNum(int goodsId,int quantity)
	{
		try
		{
			Thread.sleep(1000);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession();
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.updateCart(goodsId, quantity);
		 session.setAttribute("cart", cart);
		 return "yes";
	}
	
	public String delGoodsFromCart(int goodsId)
	{
		try
		{
			Thread.sleep(1000);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession();
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.delGoods(goodsId);
		 session.setAttribute("cart", cart);
		 return "yes";
	}
	
	
	public String clearCart()
	{
		try
		{
			Thread.sleep(1000);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession();
		 Cart cart=(Cart)session.getAttribute("cart");
		 cart.getItems().clear();
		 session.setAttribute("cart", cart);
		 return "yes";
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
