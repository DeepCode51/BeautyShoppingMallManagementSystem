package com.service;

import java.util.List;

import com.dao.TCatelogDAO;

public class catelogService
{
    private TCatelogDAO catelogDAO;
    
    
    public List findAllCatelog()
    {
    	
    	String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		return cateLogList;
    }

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}
    
}
