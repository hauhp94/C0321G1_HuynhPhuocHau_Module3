package model.repository;

import model.bean.Customer;
import model.bean.Service;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository{
    private static final String CREATE_SERVICE = "call insert_service(?,?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_SERVICE = "call select_service;";


    @Override
    public List<Service> findAll() {
        List<Service> serviceList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        CallableStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareCall(SELECT_SERVICE);
                resultSet = statement.executeQuery();
                Service service = null;
                while (resultSet.next()) {
                    int service_id = resultSet.getInt("service_id");
                    String service_code = resultSet.getString("service_code");
                    String service_name = resultSet.getString("service_name");
                    int service_area = resultSet.getInt("service_area");
                    double service_cost = resultSet.getDouble("service_cost");
                    int service_max_people = resultSet.getInt("service_max_people");
                    int rent_type_id = resultSet.getInt("rent_type_id");
                    int service_type_id = resultSet.getInt("service_type_id");
                    String standard_room = resultSet.getString("standard_room");
                    String description_other_convenience = resultSet.getString("description_other_convenience");
                    double pool_area = resultSet.getDouble("pool_area");
                    int number_of_floors = resultSet.getInt("number_of_floors");
                    String free_service = resultSet.getString("free_service");
                    String service_type_name = resultSet.getString("service_type_name");
                    String rent_type_name = resultSet.getString("rent_type_name");
                     service = new Service(service_id,service_code,service_name,service_area,service_cost,
                            service_max_people,rent_type_id,rent_type_name,service_type_id,service_type_name,
                            standard_room,description_other_convenience,pool_area,number_of_floors,free_service);
                    serviceList.add(service);
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
        return serviceList;
    }

    @Override
    public void save(Service service) {
        Connection connection = DBConnection.getConnection();

        CallableStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareCall(CREATE_SERVICE);
                statement.setString(1, service.service_code);
                statement.setString(2, service.service_name);
                statement.setInt(3, service.service_area);
                statement.setDouble(4, service.service_cost);
                statement.setInt(5, service.service_max_people);
                statement.setInt(6, service.rent_type_id);
                statement.setInt(7, service.service_type_id);
                statement.setString(8, service.standard_room);
                statement.setString(9, service.description_other_convenience);
                statement.setDouble(10, service.pool_area);
                statement.setInt(11, service.number_of_floors);
                statement.setString(12, service.free_service);
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

    }

    @Override
    public void update(int id, Service service) {

    }

    @Override
    public Service findById(int id) {
        return null;
    }

    @Override
    public Service findByName(String name) {
        return null;
    }
}
