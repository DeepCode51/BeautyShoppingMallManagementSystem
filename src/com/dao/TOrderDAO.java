package com.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TOrder;

/**
 * Data access object (DAO) for domain model class TOrder.
 * 
 * @see com.model.TOrder
 * @author MyEclipse Persistence Tools
 */

public class TOrderDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TOrderDAO.class);

	// property constants
	public static final String ORDER_BIANHAO = "orderBianhao";

	public static final String ORDER_DATE = "orderDate";

	public static final String ORDER_ZHUANGTAI = "orderZhuangtai";

	public static final String ORDER_USER_ID = "orderUserId";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TOrder transientInstance)
	{
		log.debug("saving TOrder instance");
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

	public void delete(TOrder persistentInstance)
	{
		log.debug("deleting TOrder instance");
		try
		{
			final int oid=persistentInstance.getOrderId();
			getHibernateTemplate().execute(new HibernateCallback() {
				
				@Override
				public Object doInHibernate(Session arg0) throws HibernateException,
						SQLException {
					String hql="delete from TOrderItem where orderId="+oid;
					Query query=arg0.createQuery(hql);
					query.executeUpdate();
					return null;
				}
			});
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TOrder findById(java.lang.Integer id)
	{
		log.debug("getting TOrder instance with id: " + id);
		try
		{
			TOrder instance = (TOrder) getHibernateTemplate().get(
					"com.model.TOrder", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TOrder instance)
	{
		log.debug("finding TOrder instance by example");
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
		log.debug("finding TOrder instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TOrder as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	

	public List findByOrderBianhao(Object orderBianhao)
	{
		return findByProperty(ORDER_BIANHAO, orderBianhao);
	}

	public List findByOrderDate(Object orderDate)
	{
		return findByProperty(ORDER_DATE, orderDate);
	}

	public List findByOrderZhuangtai(Object orderZhuangtai)
	{
		return findByProperty(ORDER_ZHUANGTAI, orderZhuangtai);
	}

	public List findByOrderUserId(Object orderUserId)
	{
		return findByProperty(ORDER_USER_ID, orderUserId);
	}

	public List findAll()
	{
		log.debug("finding all TOrder instances");
		try
		{
			String queryString = "from TOrder";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TOrder merge(TOrder detachedInstance)
	{
		log.debug("merging TOrder instance");
		try
		{
			TOrder result = (TOrder) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TOrder instance)
	{
		log.debug("attaching dirty TOrder instance");
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

	public void attachClean(TOrder instance)
	{
		log.debug("attaching clean TOrder instance");
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

	public static TOrderDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TOrderDAO) ctx.getBean("TOrderDAO");
	}
}