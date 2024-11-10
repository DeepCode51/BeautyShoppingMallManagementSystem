package com.dao;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TOrderItem;

/**
 * Data access object (DAO) for domain model class TOrderItem.
 * 
 * @see com.model.TOrderItem
 * @author MyEclipse Persistence Tools
 */

public class TOrderItemDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TOrderItemDAO.class);

	// property constants
	public static final String ORDER_ID = "orderId";

	public static final String GOODS_ID = "goodsId";

	public static final String GOODS_QUANTITY = "goodsQuantity";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TOrderItem transientInstance)
	{
		log.debug("saving TOrderItem instance");
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

	public void delete(TOrderItem persistentInstance)
	{
		log.debug("deleting TOrderItem instance");
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

	public TOrderItem findById(java.lang.Integer id)
	{
		log.debug("getting TOrderItem instance with id: " + id);
		try
		{
			TOrderItem instance = (TOrderItem) getHibernateTemplate().get(
					"com.model.TOrderItem", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TOrderItem instance)
	{
		log.debug("finding TOrderItem instance by example");
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
		log.debug("finding TOrderItem instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TOrderItem as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}
	//是否购买
	public Integer shifougoumai(final Integer goodsId,final Integer orderUserId)
	{	
		
			return (Integer)getHibernateTemplate().execute(new HibernateCallback() {
				
				@Override
				public Integer doInHibernate(Session session) throws HibernateException,
						SQLException {
					int n=0;
					String sql="select count(*) from t_order torder,t_orderitem titem where torder.order_id=titem.order_id and torder.order_user_id="+orderUserId+" and titem.goods_id="+goodsId;
					SQLQuery query=session.createSQLQuery(sql);
					List list=query.list();
					BigInteger n2=(BigInteger)list.get(0);
					return n2.intValue();
				}
			});
		
	}

	public List findByOrderId(Object orderId)
	{
		return findByProperty(ORDER_ID, orderId);
	}

	public List findByGoodsId(Object goodsId)
	{
		return findByProperty(GOODS_ID, goodsId);
	}

	public List findByGoodsQuantity(Object goodsQuantity)
	{
		return findByProperty(GOODS_QUANTITY, goodsQuantity);
	}

	public List findAll()
	{
		log.debug("finding all TOrderItem instances");
		try
		{
			String queryString = "from TOrderItem";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TOrderItem merge(TOrderItem detachedInstance)
	{
		log.debug("merging TOrderItem instance");
		try
		{
			TOrderItem result = (TOrderItem) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TOrderItem instance)
	{
		log.debug("attaching dirty TOrderItem instance");
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

	public void attachClean(TOrderItem instance)
	{
		log.debug("attaching clean TOrderItem instance");
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
	
	
	public Integer getXiaoliang(int goodsId)
	{
		
		final int gid=goodsId;
		return (Integer) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Integer doInHibernate(Session session) throws HibernateException,
					SQLException {
				Integer n=0;
				String hql="select sum(t.goodsQuantity) from TOrderItem t where t.zt='已发货' and t.goodsId="+gid;				
				Object obj=session.createQuery(hql).uniqueResult();
				if(obj instanceof Integer){
					n=(Integer)obj;
				}
				if(obj instanceof Long){
					int n2=((Long)obj).intValue();
					n=n2;
				}
				return n;
			}
		});
		
		
	}

	public static TOrderItemDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TOrderItemDAO) ctx.getBean("TOrderItemDAO");
	}
}