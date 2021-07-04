package model.bean;

import model.service.CustomerService;
import model.service.CustomerServiceImpl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public class Customer {
    private int customer_id;
    private String customer_code;
    private int customer_type_id;
    private String customer_type_name;
    private String customer_name;
    private LocalDate customer_birthday;
    private int customer_gender;
    private String customer_id_card;
    private String customer_phone;
    private String customer_email;
    private String customer_address;


    public Customer() {
    }

    public Customer(int customer_id, String customer_code, int customer_type_id, String customer_type_name,
                    String customer_name, LocalDate customer_birthday, int customer_gender, String customer_id_card,
                    String customer_phone, String customer_email, String customer_address) {
        this.customer_id = customer_id;
        this.customer_code = customer_code;
        this.customer_type_id = customer_type_id;
        this.customer_type_name = customer_type_name;
        this.customer_name = customer_name;
        this.customer_birthday = customer_birthday;
        this.customer_gender = customer_gender;
        this.customer_id_card = customer_id_card;
        this.customer_phone = customer_phone;
        this.customer_email = customer_email;
        this.customer_address = customer_address;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_code() {
        return customer_code;
    }

    public void setCustomer_code(String customer_code) {
        this.customer_code = customer_code;
    }

    public int getCustomer_type_id() {
        return customer_type_id;
    }

    public void setCustomer_type_id(int customer_type_id) {
        this.customer_type_id = customer_type_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public LocalDate getCustomer_birthday() {
        return customer_birthday;
    }

    public void setCustomer_birthday(LocalDate customer_birthday) {
        this.customer_birthday =  customer_birthday;
    }

    public int getCustomer_gender() {
        return customer_gender;
    }

    public void setCustomer_gender(int customer_gender) {
        this.customer_gender = customer_gender;
    }

    public String getCustomer_id_card() {
        return customer_id_card;
    }

    public void setCustomer_id_card(String customer_id_card) {
        this.customer_id_card = customer_id_card;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public String getCustomer_email() {
        return customer_email;
    }

    public void setCustomer_email(String customer_email) {
        this.customer_email = customer_email;
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }

    public String getCustomer_type_name() {
        return customer_type_name;
    }

    public void setCustomer_type_name(String customer_type_name) {
        this.customer_type_name = customer_type_name;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customer_id=" + customer_id +
                ", customer_code='" + customer_code + '\'' +
                ", customer_type_id=" + customer_type_id +
                ", customer_type_name='" + customer_type_name + '\'' +
                ", customer_name='" + customer_name + '\'' +
                ", customer_birthday='" + customer_birthday + '\'' +
                ", customer_gender=" + customer_gender +
                ", customer_id_card='" + customer_id_card + '\'' +
                ", customer_phone='" + customer_phone + '\'' +
                ", customer_email='" + customer_email + '\'' +
                ", customer_address='" + customer_address + '\'' +
                '}';
    }

//   public static void main(String[] args) {
//        CustomerService customerService = new CustomerServiceImpl();
//        List<Customer> customerList =  customerService.findAll();
//        for(Customer customer: customerList){
//            System.out.println(customer);
//        }
//    }
}
