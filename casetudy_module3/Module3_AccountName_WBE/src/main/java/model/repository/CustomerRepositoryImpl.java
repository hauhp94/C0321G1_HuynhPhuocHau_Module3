package model.repository;

import model.bean.Customer;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {

    public static final String SELECT_CUSTOMER = "call get_all_customer;";
    public static final String CREATE_CUSTOMER = "INSERT INTO customer (customer_name, customer_code,customer_type_id,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) VALUE(?, ?, ?,?,?, ?, ?,?,?);";
    public static final String UPDATE_CUSTOMER = "call update_customer(?,?,?,?,?,?,?,?,?,?);";
    public static final String CUSTOMER_WHERE_ID = "select * from customer where customer_id=?;";
    public static final String DELETE_FROM_CUSTOMER_WHERE_ID = "delete from customer where customer_id=?;";

    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        CallableStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareCall(SELECT_CUSTOMER);
                resultSet = statement.executeQuery();
                Customer customer = null;
                while (resultSet.next()) {
                    int id = Integer.parseInt(resultSet.getString("customer_id"));
                    String code = resultSet.getString("customer_code");
                    int customer_type_id = Integer.parseInt(resultSet.getString("customer_type_id"));
                    String customer_type_name = resultSet.getString("customer_type_name");
                    String name = resultSet.getString("customer_name");
                    LocalDate birthday = LocalDate.parse(resultSet.getString("customer_birthday"));
                    int gender = Integer.parseInt(resultSet.getString("customer_gender"));
                    String id_card = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id, code, customer_type_id, customer_type_name, name, birthday, gender, id_card,
                            phone, email, address);
                    customerList.add(customer);
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
        return customerList;
    }

    @Override
    public void save(Customer customer) {
        Connection connection = DBConnection.getConnection();

        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(CREATE_CUSTOMER);
                statement.setString(1, customer.getCustomer_name());
                statement.setString(2, customer.getCustomer_code());
                statement.setInt(3, customer.getCustomer_type_id());
                statement.setDate(4, Date.valueOf(customer.getCustomer_birthday()));
                statement.setInt(5, customer.getCustomer_gender());
                statement.setString(6, customer.getCustomer_id_card());
                statement.setString(7, customer.getCustomer_phone());
                statement.setString(8, customer.getCustomer_email());
                statement.setString(9, customer.getCustomer_address());
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
        PreparedStatement statement = connection.prepareStatement(DELETE_FROM_CUSTOMER_WHERE_ID);
        statement.setInt(1, id);
        statement.executeUpdate();
    }

    @Override
    public void update(int id, Customer customer) {
        Connection connection = DBConnection.getConnection();

        CallableStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareCall(UPDATE_CUSTOMER);
                statement.setInt(1, customer.getCustomer_id());
                statement.setString(2, customer.getCustomer_name());
                statement.setString(3, customer.getCustomer_code());
                statement.setInt(4, customer.getCustomer_type_id());
                statement.setDate(5, Date.valueOf(customer.getCustomer_birthday()));
                statement.setInt(6, customer.getCustomer_gender());
                statement.setString(7, customer.getCustomer_id_card());
                statement.setString(8, customer.getCustomer_phone());
                statement.setString(9, customer.getCustomer_email());
                statement.setString(10, customer.getCustomer_address());
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
    public Customer findById(int id) {
//        Customer customer = null;
//        Connection connection = DBConnection.getConnection();
//        PreparedStatement statement = null;
//        ResultSet resultSet = null;
//        if (connection != null) {
//            try {
//                statement = connection.prepareStatement(CUSTOMER_WHERE_ID);
//                statement.setInt(1, id);
//                resultSet = statement.executeQuery();
//                while (resultSet.next()) {
//                    String code = resultSet.getString("customer_code");
//                    int customer_type_id = Integer.parseInt(resultSet.getString("customer_type_id"));
////                    String customer_type_name = resultSet.getString("customer_type_name");
//                    String name = resultSet.getString("customer_name");
//                    LocalDate birthday = LocalDate.parse(resultSet.getString("customer_birthday"));
//                    int gender = Integer.parseInt(resultSet.getString("customer_gender"));
//                    String id_card = resultSet.getString("customer_id_card");
//                    String phone = resultSet.getString("customer_phone");
//                    String email = resultSet.getString("customer_email");
//                    String address = resultSet.getString("customer_address");
//                    customer = new Customer(id, code, customer_type_id, null, name, birthday, gender, id_card,
//                            phone, email, address);
//                }
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            } finally {
//                try {
//                    resultSet.close();
//                    statement.close();
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//                DBConnection.close();
//            }
//        }
//        return customer;

        for (Customer customer : this.findAll()) {
            if (customer.getCustomer_id()==id) {
                return customer;
            }
        }
        return null;
    }



    @Override
    public List<Customer> findByName(String name) {
        List<Customer> customerList = new ArrayList<>();
        for (Customer customer : this.findAll()) {
            if (customer.getCustomer_name().equals(name))
                customerList.add(customer);
        }
        return customerList;
    }
}
