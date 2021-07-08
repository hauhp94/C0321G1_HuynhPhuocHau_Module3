package model.service;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    List<Customer> findAll();

    Map<String, String> save(Customer customer);

    void remove(int id) throws SQLException;

    void update(int id, Customer customer);

    Customer findById(int id);

    List<Customer> findByName(String name);

    List<Customer> findAllAndService();

}
