package edu.nju.cineplex.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.cineplex.dao.BankDao;
import edu.nju.cineplex.dao.BaseDao;
import edu.nju.cineplex.model.Bank;
@Repository
public class BankDaoImpl implements BankDao {

	@Autowired
	private BaseDao baseDao;
	@Override
	public Bank load(String id) {
		return (Bank)baseDao.load(Bank.class, id);
	}

}
