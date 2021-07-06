package model.repository;

import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository{
    @Override
    public List<Employee> findAll() {
        return null;
    }

    @Override
    public void save(Employee employee) {

    }

    @Override
    public void remove(int id) throws SQLException {

    }

    @Override
    public void update(int id, Employee employee) {

    }

    @Override
    public Employee findById(int id) {
        return null;
    }

    @Override
    public Employee findByName(String name) {
        return null;
    }
}
