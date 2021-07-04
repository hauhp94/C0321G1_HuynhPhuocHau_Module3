package model.repository;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepository {
    List<Employee> findAll();

    void save(Employee employee);

    void remove(int id) throws SQLException;

    void update(int id, Employee employee);

    Employee findById(int id);

    Employee findByName(String name);
}
