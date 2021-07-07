package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository{
    private static final String CREATE_EMPLOYEE = "call insert_employee(?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_ALL_EMPLOYEE = "call select_all_employee;";
    private static final String DELETE_FROM_EMPLOYEE_WHERE_ID = "delete from employee where employee_id=?;";
    private static final String UPDATE_EMPLOYEE= "call update_employee(?,?,?,?,?,?,?,?,?,?,?,?);";
    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        CallableStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareCall(SELECT_ALL_EMPLOYEE);
                resultSet = statement.executeQuery();
                Employee employee = null;
                while (resultSet.next()) {
                    int id = Integer.parseInt(resultSet.getString("employee_id"));
                    String name = resultSet.getString("employee_name");
                    LocalDate birthday = LocalDate.parse(resultSet.getString("employee_birthday"));
                    String id_card = resultSet.getString("employee_id_card");
                    Double salary = Double.valueOf(resultSet.getString("employee_salary"));
                    String phone = resultSet.getString("employee_phone");
                    String email = resultSet.getString("employee_email");
                    String address = resultSet.getString("employee_address");
                    int position_id = Integer.parseInt(resultSet.getString("position_id"));
                    String position_name = resultSet.getString("position_name");
                    int education_degree_id = Integer.parseInt(resultSet.getString("education_degree_id"));
                    String education_degree_name = resultSet.getString("education_degree_name");
                    int division_id = Integer.parseInt(resultSet.getString("division_id"));
                    String division_name = resultSet.getString("division_name");
                    String username = resultSet.getString("username");
                    employee = new Employee(id,name,birthday,id_card,salary,phone,email,address,
                            position_id,position_name,education_degree_id,education_degree_name,division_id,division_name,username);
                    employeeList.add(employee);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return employeeList;
    }

    @Override
    public void save(Employee employee) {
        Connection connection = DBConnection.getConnection();

        CallableStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareCall(CREATE_EMPLOYEE);
                statement.setString(1, employee.getEmployee_name());
                statement.setDate(2, Date.valueOf(employee.getEmployee_birthday()));
                statement.setString(3, employee.getEmployee_id_card());
                statement.setDouble(4, employee.getEmployee_salary());
                statement.setString(5, employee.getEmployee_phone());
                statement.setString(6, employee.getEmployee_email());
                statement.setString(7, employee.getEmployee_address());
                statement.setInt(8, employee.getPosition_id());
                statement.setInt(9, employee.getEducation_degree_id());
                statement.setInt(10, employee.getDivision_id());
                statement.setString(11, employee.getUsername());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void remove(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_FROM_EMPLOYEE_WHERE_ID);
        statement.setInt(1, id);
        statement.executeUpdate();
    }

    @Override
    public void update(int id, Employee employee) {
        Connection connection = DBConnection.getConnection();

        CallableStatement statement = null;

        if (connection != null) {
//            employee_id, employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone,
//                    employee_email, employee_address, position_id, education_degree_id, division_id, username
            try {
                statement = connection.prepareCall(UPDATE_EMPLOYEE);
                statement.setInt(1, employee.getEmployee_id());
                statement.setString(2, employee.getEmployee_name());
                statement.setDate(3, Date.valueOf(employee.getEmployee_birthday()));
                statement.setString(4, employee.getEmployee_id_card());
                statement.setDouble(5, employee.getEmployee_salary());
                statement.setString(6, employee.getEmployee_phone());
                statement.setString(7, employee.getEmployee_email());
                statement.setString(8, employee.getEmployee_address());
                statement.setInt(9, employee.getPosition_id());
                statement.setInt(10, employee.getEducation_degree_id());
                statement.setInt(11, employee.getDivision_id());
                statement.setString(12, employee.getUsername());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public Employee findById(int id) {
        for (Employee employee : this.findAll()) {
            if (employee.getEmployee_id()==id) {
                return employee;
            }
        }
        return null;
    }

    @Override
    public List<Employee> findByName(String name) {
        List<Employee> employeeList = new ArrayList<>();
        for (Employee employee : this.findAll()) {
            if (employee.getEmployee_name().equals(name))
                employeeList.add(employee);
        }
        return employeeList;
    }
}
