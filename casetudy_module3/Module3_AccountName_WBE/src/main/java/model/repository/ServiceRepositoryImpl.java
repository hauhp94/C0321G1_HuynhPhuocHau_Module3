package model.repository;

import model.bean.Service;

import java.sql.*;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository{
    private static final String CREATE_SERVICE = "call insert_service(?,?,?,?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Service> findAll() {
        return null;
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
//                statement.setString(8, service.);
                statement.setString(9, service.service_code);
                statement.setString(10, service.service_code);
                statement.setString(11, service.service_code);
                statement.setString(12, service.service_code);



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
