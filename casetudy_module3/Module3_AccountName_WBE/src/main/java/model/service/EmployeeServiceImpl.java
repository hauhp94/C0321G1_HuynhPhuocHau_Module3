package model.service;

import model.bean.Employee;
import model.bean.Service;
import model.repository.EmployeeRepository;
import model.repository.EmployeeRepositoryImpl;
import model.service.common.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Map<String,String> save(Employee employee) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validatePhoneNumber(employee.getEmployee_phone()) != null
                || Validate.validateIdCard(employee.getEmployee_id_card()) != null
                || Validate.validatePositiveNumbers(employee.getEmployee_salary()) != null
                || Validate.validateEmail(employee.getEmployee_email()) != null) {
            mapMessage.put("phone", Validate.validatePhoneNumber(employee.getEmployee_phone()));
            mapMessage.put("idCard", Validate.validateIdCard(employee.getEmployee_id_card()));
            mapMessage.put("salary",Validate.validatePositiveNumbers(employee.getEmployee_salary()));
            mapMessage.put("email", Validate.validateEmail(employee.getEmployee_email()));
        } else {
            employeeRepository.save(employee);
        }
        return mapMessage;
    }

    @Override
    public void remove(int id) throws SQLException {
        employeeRepository.remove(id);
    }

    @Override
    public void update(int id, Employee employee) {
        employeeRepository.update(id, employee);
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public List<Employee> findByName(String name) {
        return employeeRepository.findByName(name);
    }
}
