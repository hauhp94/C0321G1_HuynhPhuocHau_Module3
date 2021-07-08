package model.bean;

import java.time.LocalDate;

public class Employee {
    private int employee_id;
    private String employee_name;
    private LocalDate employee_birthday;
    private String employee_id_card;
    private double employee_salary;
    private String employee_phone;
    private String employee_email;
    private String employee_address;
    private int position_id;
    private String position_name;
    private int education_degree_id;
    private String education_degree_name;
    private int division_id;
    private String division_name;
    private String username;

    public Employee() {
    }

    public Employee(int employee_id, String employee_name, LocalDate employee_birthday,
                    String employee_id_card, double employee_salary, String employee_phone,
                    String employee_email, String employee_address, int position_id, String position_name,
                    int education_degree_id, String education_degree_name, int division_id,
                    String division_name, String username) {
        this.employee_id = employee_id;
        this.employee_name = employee_name;
        this.employee_birthday = employee_birthday;
        this.employee_id_card = employee_id_card;
        this.employee_salary = employee_salary;
        this.employee_phone = employee_phone;
        this.employee_email = employee_email;
        this.employee_address = employee_address;
        this.position_id = position_id;
        this.position_name = position_name;
        this.education_degree_id = education_degree_id;
        this.education_degree_name = education_degree_name;
        this.division_id = division_id;
        this.division_name = division_name;
        this.username = username;
    }

    public String getPosition_name() {
        return position_name;
    }

    public void setPosition_name(String position_name) {
        this.position_name = position_name;
    }

    public String getEducation_degree_name() {
        return education_degree_name;
    }

    public void setEducation_degree_name(String education_degree_name) {
        this.education_degree_name = education_degree_name;
    }

    public String getDivision_name() {
        return division_name;
    }

    public void setDivision_name(String division_name) {
        this.division_name = division_name;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public LocalDate getEmployee_birthday() {
        return employee_birthday;
    }

    public void setEmployee_birthday(LocalDate employee_birthday) {
        this.employee_birthday = employee_birthday;
    }

    public String getEmployee_id_card() {
        return employee_id_card;
    }

    public void setEmployee_id_card(String employee_id_card) {
        this.employee_id_card = employee_id_card;
    }

    public double getEmployee_salary() {
        return employee_salary;
    }

    public void setEmployee_salary(double employee_salary) {
        this.employee_salary = employee_salary;
    }

    public String getEmployee_phone() {
        return employee_phone;
    }

    public void setEmployee_phone(String employee_phone) {
        this.employee_phone = employee_phone;
    }

    public String getEmployee_email() {
        return employee_email;
    }

    public void setEmployee_email(String employee_email) {
        this.employee_email = employee_email;
    }

    public String getEmployee_address() {
        return employee_address;
    }

    public void setEmployee_address(String employee_address) {
        this.employee_address = employee_address;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public int getEducation_degree_id() {
        return education_degree_id;
    }

    public void setEducation_degree_id(int education_degree_id) {
        this.education_degree_id = education_degree_id;
    }

    public int getDivision_id() {
        return division_id;
    }

    public void setDivision_id(int division_id) {
        this.division_id = division_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "employee_id=" + employee_id +
                ", employee_name='" + employee_name + '\'' +
                ", employee_birthday=" + employee_birthday +
                ", employee_id_card='" + employee_id_card + '\'' +
                ", employee_salary=" + employee_salary +
                ", employee_phone='" + employee_phone + '\'' +
                ", employee_email='" + employee_email + '\'' +
                ", employee_address='" + employee_address + '\'' +
                ", position_id=" + position_id +
                ", education_degree_id=" + education_degree_id +
                ", division_id=" + division_id +
                ", username='" + username + '\'' +
                '}';
    }
}