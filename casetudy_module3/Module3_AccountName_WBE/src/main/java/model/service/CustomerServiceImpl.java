package model.service;

import model.bean.Customer;
import model.bean.Employee;
import model.repository.CustomerRepository;
import model.repository.CustomerRepositoryImpl;
import model.service.common.Validate;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private CustomerRepository repository = new CustomerRepositoryImpl();

    @Override
    public List<Customer> findAll() {
        return repository.findAll();
    }

    @Override
    public Map<String, String> save(Customer customer) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateCustomerCode(customer.getCustomer_code()) != null
                || Validate.validateIdCard(customer.getCustomer_id_card()) != null
                || Validate.validatePhoneNumber(customer.getCustomer_phone()) != null
                || Validate.validateEmail(customer.getCustomer_email()) != null) {
            mapMessage.put("code", Validate.validateCustomerCode(customer.getCustomer_code()));
            mapMessage.put("idCard", Validate.validateIdCard(customer.getCustomer_id_card()));
            mapMessage.put("phoneNumber", Validate.validatePhoneNumber(customer.getCustomer_phone()));
            mapMessage.put("email", Validate.validateEmail(customer.getCustomer_email()));
        } else {
            repository.save(customer);
        }
        return mapMessage;
    }

    @Override
    public void remove(int id) throws SQLException {
        repository.remove(id);
    }

    @Override
    public void update(int id, Customer customer) {
        repository.update(id, customer);
    }

    @Override
    public Customer findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<Customer> findByName(String name) {
        return repository.findByName(name);
    }

    @Override
    public List<Customer> findAllAndService() {
        return repository.findAllAndService();
    }
}
