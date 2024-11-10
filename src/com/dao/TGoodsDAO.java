package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TGoods;

/**
 * Data access object (DAO) for domain model class TGoods.
 * 
 * @see com.model.TGoods
 * @author MyEclipse Persistence Tools
 */

public class TGoodsDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TGoodsDAO.class);

	// property constants
	public static final String GOODS_NAME = "goodsName";

	public static final String GOODS_MIAOSHU = "goodsMiaoshu";

	public static final String GOODS_PIC = "goodsPic";

	public static final String GOODS_SHICHANGJIA = "goodsShichangjia";

	public static final String GOODS_TEJIA = "goodsTejia";

	public static final String GOODS_CATELOG_ID = "goodsCatelogId";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TGoods transientInstance)
	{
		log.debug("saving TGoods instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TGoods persistentInstance)
	{
		log.debug("deleting TGoods instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TGoods findById(java.lang.Integer id)
	{
		log.debug("getting TGoods instance with id: " + id);
		try
		{
			TGoods instance = (TGoods) getHibernateTemplate().get(
					"com.model.TGoods", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TGoods instance)
	{
		log.debug("finding TGoods instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TGoods instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TGoods as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGoodsName(Object goodsName)
	{
		return findByProperty(GOODS_NAME, goodsName);
	}

	public List findByGoodsMiaoshu(Object goodsMiaoshu)
	{
		return findByProperty(GOODS_MIAOSHU, goodsMiaoshu);
	}

	public List findByGoodsPic(Object goodsPic)
	{
		return findByProperty(GOODS_PIC, goodsPic);
	}

	public List findByGoodsShichangjia(Object goodsShichangjia)
	{
		return findByProperty(GOODS_SHICHANGJIA, goodsShichangjia);
	}

	public List findByGoodsTejia(Object goodsTejia)
	{
		return findByProperty(GOODS_TEJIA, goodsTejia);
	}

	public List findAll()
	{
		log.debug("finding all TGoods instances");
		try
		{
			String queryString = "from TGoods";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TGoods merge(TGoods detachedInstance)
	{
		log.debug("merging TGoods instance");
		try
		{
			TGoods result = (TGoods) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TGoods instance)
	{
		log.debug("attaching dirty TGoods instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TGoods instance)
	{
		log.debug("attaching clean TGoods instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TGoodsDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TGoodsDAO) ctx.getBean("TGoodsDAO");
	}
}