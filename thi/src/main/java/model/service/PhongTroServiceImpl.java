package model.service;

import model.bean.PhongTro;
import model.repository.PhongTroRepository;
import model.repository.PhongTroRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class PhongTroServiceImpl implements PhongTroService {
    PhongTroRepository repository = new PhongTroRepositoryImpl();

    @Override
    public List<PhongTro> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(PhongTro phongTro) {
        repository.save(phongTro);
    }

    @Override
    public void remove(int id) throws SQLException {
        repository.remove(id);
    }

    @Override
    public void update(int id, PhongTro phongTro) {
        repository.update(id, phongTro);
    }

    @Override
    public PhongTro findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<PhongTro> findByName(String name) {
        return repository.findByName(name);
    }
}
