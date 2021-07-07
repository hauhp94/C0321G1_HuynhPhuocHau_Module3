package model.service;

import model.bean.Service;
import model.repository.ServiceRepository;
import model.repository.ServiceRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ServiceServiceImpl implements ServiceService {
    ServiceRepository serviceRepository = new ServiceRepositoryImpl();

    @Override
    public List<Service> findAll() {
        return serviceRepository.findAll();
    }

    @Override
    public void save(Service service) {
        serviceRepository.save(service);
    }

    @Override
    public void remove(int id) throws SQLException {
        serviceRepository.remove(id);
    }

    @Override
    public void update(int id, Service service) {
        serviceRepository.update(id, service);
    }

    @Override
    public Service findById(int id) {
        return serviceRepository.findById(id);
    }

    @Override
    public List<Service> findByName(String name) {
        return serviceRepository.findByName(name);
    }
}
