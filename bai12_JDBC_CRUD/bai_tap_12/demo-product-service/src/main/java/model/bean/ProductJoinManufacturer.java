package model.bean;

public class ProductJoinManufacturer {
    private Product product;
    private String nameManufacturer;
    private String nameFactory;

    public ProductJoinManufacturer(Product product, String nameManufacturer, String nameFactory) {
        this.product = product;
        this.nameManufacturer = nameManufacturer;
        this.nameFactory = nameFactory;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getNameManufacturer() {
        return nameManufacturer;
    }

    public void setNameManufacturer(String nameManufacturer) {
        this.nameManufacturer = nameManufacturer;
    }

    public String getNameFactory() {
        return nameFactory;
    }

    public void setNameFactory(String nameFactory) {
        this.nameFactory = nameFactory;
    }
}
