package model.repository;

import model.bean.Employee;
import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface ServiceRepository {
    List<Service> findAll();

    void save(Service service);

    void remove(int id) throws SQLException;

    void update(int id, Service service);

    Service findById(int id);

    List<Service> findByName(String name);
}
