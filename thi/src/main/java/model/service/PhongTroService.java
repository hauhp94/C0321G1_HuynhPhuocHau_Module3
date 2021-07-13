package model.service;

import model.bean.PhongTro;

import java.sql.SQLException;
import java.util.List;

public interface PhongTroService {
    List<PhongTro> findAll();

    void save(PhongTro phongTro);

    void remove(int id) throws SQLException;

    void update(int id, PhongTro phongTro);

    PhongTro findById(int id);

    List<PhongTro> findByName(String name);

}
