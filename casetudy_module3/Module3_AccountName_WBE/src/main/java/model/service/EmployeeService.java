package model.service;

import model.bean.Employee;
import model.bean.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface EmployeeService {
    List<Employee> findAll();

    Map<String,String> save(Employee employee);

    void remove(int id) throws SQLException;

    void update(int id, Employee employee);

    Employee findById(int id);

    List<Employee> findByName(String name);
}
