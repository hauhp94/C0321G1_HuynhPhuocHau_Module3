package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface CustomerRepository {
    List<Customer> findAll();

    void save(Customer customer);

    void remove(int id) throws SQLException;

    void update(int id, Customer customer);

    Customer findById(int id);

    List<Customer> findByName(String name);

}
