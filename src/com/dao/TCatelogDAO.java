package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TCatelog;

/**
 * Data access object (DAO) for domain model class TCatelog.
 * 
 * @see com.model.TCatelog
 * @author MyEclipse Persistence Tools
 */

public class TCatelogDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TCatelogDAO.class);

	// property constants
	public static final String CATELOG_NAME = "catelogName";

	public static final String CATELOG_MIAOSHU = "catelogMiaoshu";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TCatelog transientInstance)
	{
		log.debug("saving TCatelog instance");
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

	public void delete(TCatelog persistentInstance)
	{
		log.debug("deleting TCatelog instance");
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

	public TCatelog findById(java.lang.Integer id)
	{
		log.debug("getting TCatelog instance with id: " + id);
		try
		{
			TCatelog instance = (TCatelog) getHibernateTemplate().get(
					"com.model.TCatelog", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TCatelog instance)
	{
		log.debug("finding TCatelog instance by example");
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
		log.debug("finding TCatelog instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TCatelog as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCatelogName(Object catelogName)
	{
		return findByProperty(CATELOG_NAME, catelogName);
	}

	public List findByCatelogMiaoshu(Object catelogMiaoshu)
	{
		return findByProperty(CATELOG_MIAOSHU, catelogMiaoshu);
	}

	public List findAll()
	{
		log.debug("finding all TCatelog instances");
		try
		{
			String queryString = "from TCatelog";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TCatelog merge(TCatelog detachedInstance)
	{
		log.debug("merging TCatelog instance");
		try
		{
			TCatelog result = (TCatelog) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TCatelog instance)
	{
		log.debug("attaching dirty TCatelog instance");
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

	public void attachClean(TCatelog instance)
	{
		log.debug("attaching clean TCatelog instance");
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

	public static TCatelogDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TCatelogDAO) ctx.getBean("TCatelogDAO");
	}
}