package com.iitr.customerRelationManagement.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitr.customerRelationManagement.entity.Customer;

@Repository
public class CustomerServiceImpl implements CustomerService {

	private SessionFactory sessionFactory;

	// create session
	private Session session;

	@Autowired
	CustomerServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

	}

	@Transactional
	public List<Customer> findAll() {

		Transaction tx = session.beginTransaction();

		// find all the records from the database table
		List<Customer> customers = session.createQuery("from Customer").list();

		tx.commit();

		return customers;
	}

	@Transactional
	public Customer findById(int id) {

		Customer customer = new Customer();

		Transaction tx = session.beginTransaction();

		// find record with Id from the database table
		customer = session.get(Customer.class, id);

		tx.commit();

		return customer;
	}

	@Transactional
	public void save(Customer theCustomer) {

		Transaction tx = session.beginTransaction();

		// save transaction
		session.saveOrUpdate(theCustomer);

		tx.commit();

	}

	@Transactional
	public void deleteById(int id) {

		Transaction tx = session.beginTransaction();

		// get transaction
		Customer customer = session.get(Customer.class, id);

		// delete record
		session.delete(customer);

		tx.commit();

	}

	@Transactional
	public List<Customer> searchBy(String FirstName, String LastName) {

		Transaction tx = session.beginTransaction();
		String query = "";
		if (FirstName.length() != 0 && LastName.length() != 0)
			query = "from Customer where firstName like '%" + FirstName + "%' or lastName like '%" + LastName + "%'";
		else if (FirstName.length() != 0)
			query = "from Customer where firstName like '%" + FirstName + "%'";
		else if (LastName.length() != 0)
			query = "from Customer where lastName like '%" + LastName + "%'";
		else
			System.out.println("Cannot search without input data");

		List<Customer> customer = session.createQuery(query).list();

		tx.commit();

		return customer;
	}

	// print the loop
	@Transactional
	public void print(List<Customer> customer) {

		for (Customer cstmr : customer) {
			System.out.println(cstmr);
		}
	}

}