package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TComment;

/**
 * Data access object (DAO) for domain model class TComment.
 * 
 * @see com.model.TComment
 * @author MyEclipse Persistence Tools
 */

public class TCommentDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TCommentDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TComment transientInstance)
	{
		log.debug("saving TComment instance");
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

	public void delete(TComment persistentInstance)
	{
		log.debug("deleting TComment instance");
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

	public TComment findById(java.lang.Integer id)
	{
		log.debug("getting TComment instance with id: " + id);
		try
		{
			TComment instance = (TComment) getHibernateTemplate().get(
					"com.model.TComment", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TComment instance)
	{
		log.debug("finding TComment instance by example");
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
		log.debug("finding TComment instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TComment as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TComment instances");
		try
		{
			String queryString = "from TComment";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TComment merge(TComment detachedInstance)
	{
		log.debug("merging TComment instance");
		try
		{
			TComment result = (TComment) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TComment instance)
	{
		log.debug("attaching dirty TComment instance");
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

	public void attachClean(TComment instance)
	{
		log.debug("attaching clean TComment instance");
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

	public static TCommentDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TCommentDAO) ctx.getBean("TCommentDAO");
	}
}