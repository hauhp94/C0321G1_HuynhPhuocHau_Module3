package model.repository;

import model.bean.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductRepository {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void remove(int id) throws SQLException;
    void update(int id, Product product);
    Product findByName(String name);

}
