package edu.nju.cineplex.dao;

import java.util.List;

import org.hibernate.Session;

public interface BaseDao {
	/**
	 * 用于查询时获取session
	 * @return session
	 */
	public Session getSession();

	/**
	 * 用于增删改时获取session，必须flush，clear，close
	 * @return
	 */
	public Session getNewSession();
	
	public void flush();

	public void clear() ;
	
	/**
	 * 根据int型id返回对象
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object load(Class c,int id);
	/**
	 * 根据String型id返回对象
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Object load(Class c,String id);
	
	/**
	 * 对象更新
	 * @param o
	 */
	public void update(Object o);
	
	public void merge(Object o);
	
	/**
	 * 对象存储
	 * @param o
	 */
	public void save(Object o);
	/**
	 * 获取所有对象
	 * @param c
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAllList(Class c) ;
	
	/**
	 * 获取对象个数
	 * @param c
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public int getTotalCount(Class c) ;
	
	/**
	 * 删除某个对象
	 * @param bean
	 */
	public void delete(Object o) ;
	
	/**
	 * 根据String型id删除
	 * @param c
	 * @param id
	 */
	@SuppressWarnings("rawtypes")
	public void delete(Class c, String id) ;

	/**
	 * 根据int型id删除
	 * @param c
	 * @param ids
	 */
	@SuppressWarnings("rawtypes")
	public void delete(Class c, int id) ;
	
	/**
	 * 根据属性值返回list
	 * @param c 
	 * @param column 属性
	 * @param value 值
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findByColumn(Class c,String column,String value);
	
	@SuppressWarnings("rawtypes")
	public Object findByUnique(Class c,String column,String value);

}
