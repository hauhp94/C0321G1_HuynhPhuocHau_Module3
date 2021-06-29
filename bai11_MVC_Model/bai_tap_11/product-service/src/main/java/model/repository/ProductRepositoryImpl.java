package model.repository;

import model.bean.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<Integer,Product> productList;
    static {
        productList = new HashMap<>();
        productList.put(1, new Product(1,"iPhone 6", 5000, "iphone6.jpg"));
        productList.put(2, new Product(2,"iPhone 7", 6000, "iphone7.jpg"));
        productList.put(3, new Product(3,"iPhone 8", 7000, "iphone8.jpg"));
        productList.put(4, new Product(4,"iPhone x", 9000, "iphonex.jpg"));
        productList.put(5, new Product(5,"iPhone xs", 12000, "iphonexs.jpg"));
        productList.put(6, new Product(6,"iPhone 11", 14000, "iphone11.jpg"));
        productList.put(7, new Product(7,"iPhone 12", 18000, "iphone12.jpg"));
        productList.put(8, new Product(8,"Nokia 9", 5500, "nokia9.jpg"));
        productList.put(9, new Product(9,"Samsung Note 10", 18990, "samsung.jpg"));
        productList.put(10, new Product(10,"LG G9", 13990, "lgg9.jpg"));
        productList.put(11, new Product(11,"LG G9", 13990, "iphone12.jpg"));
        productList.put(12, new Product(12,"iPhone 12", 13990, "iphone12.jpg"));
        productList.put(13, new Product(13,"LG G9", 13990, "lgg9.jpg"));
        productList.put(14, new Product(14,"LG G9", 13990, "lgg9.jpg"));
        productList.put(15, new Product(15,"LG G9", 13990, "lgg9.jpg"));
        productList.put(16, new Product(16,"iPhone 12", 13990, "iphone12.jpg"));
        productList.put(17, new Product(17,"LG G9", 13990, "lgg9.jpg"));
        productList.put(18, new Product(10,"iPhone 12", 13990, "iphone12.jpg"));
        productList.put(19, new Product(19,"LG G9", 13990, "lgg9.jpg"));
        productList.put(20, new Product(20,"LG G9", 13990, "lgg9.jpg"));
        productList.put(21, new Product(21,"LG G9", 13990, "lgg9.jpg"));

    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public void save(Product product) {
    productList.put(product.getIdProduct(),product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.put(id,product);
    }

    @Override
    public  Product findByName(String name){
        for(Product product: this.findAll()){
            if(product.getNameProduct().equals(name))
                return product;
        }
        return null;
    }

}