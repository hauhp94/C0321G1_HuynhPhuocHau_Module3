package model.service;

import model.bean.Product;
import model.repository.ProductRepository;
import model.repository.ProductRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductRepository repository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(Product product) {
        repository.save(product);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public void remove(int id) throws SQLException {
        repository.remove(id);
    }

    @Override
    public void update(int id, Product product) {
    repository.update(id,product);
    }

    @Override
    public Product findByName(String name) {
        return repository.findByName(name);
    }

}