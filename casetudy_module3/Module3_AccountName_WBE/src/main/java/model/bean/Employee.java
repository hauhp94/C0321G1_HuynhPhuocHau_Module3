package model.bean;

public class Employee {
    private int employee_id;
    private int employee_name;
    private int employee_birthday;
    private int employee_id_card;
    private int employee_salary;
    private int employee_phone;
    private int employee_email;
    private int employee_address;
    private int position_id;
    private int education_degree_id;
    private int division_id;
    private int username;

    public Employee() {
    }

    public Employee(int employee_id, int employee_name, int employee_birthday, int employee_id_card,
                    int employee_salary, int employee_phone, int employee_email, int employee_address,
                    int position_id, int education_degree_id, int division_id, int username) {
        this.employee_id = employee_id;
        this.employee_name = employee_name;
        this.employee_birthday = employee_birthday;
        this.employee_id_card = employee_id_card;
        this.employee_salary = employee_salary;
        this.employee_phone = employee_phone;
        this.employee_email = employee_email;
        this.employee_address = employee_address;
        this.position_id = position_id;
        this.education_degree_id = education_degree_id;
        this.division_id = division_id;
        this.username = username;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public int getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(int employee_name) {
        this.employee_name = employee_name;
    }

    public int getEmployee_birthday() {
        return employee_birthday;
    }

    public void setEmployee_birthday(int employee_birthday) {
        this.employee_birthday = employee_birthday;
    }

    public int getEmployee_id_card() {
        return employee_id_card;
    }

    public void setEmployee_id_card(int employee_id_card) {
        this.employee_id_card = employee_id_card;
    }

    public int getEmployee_salary() {
        return employee_salary;
    }

    public void setEmployee_salary(int employee_salary) {
        this.employee_salary = employee_salary;
    }

    public int getEmployee_phone() {
        return employee_phone;
    }

    public void setEmployee_phone(int employee_phone) {
        this.employee_phone = employee_phone;
    }

    public int getEmployee_email() {
        return employee_email;
    }

    public void setEmployee_email(int employee_email) {
        this.employee_email = employee_email;
    }

    public int getEmployee_address() {
        return employee_address;
    }

    public void setEmployee_address(int employee_address) {
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

    public int getUsername() {
        return username;
    }

    public void setUsername(int username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "employee_id=" + employee_id +
                ", employee_name=" + employee_name +
                ", employee_birthday=" + employee_birthday +
                ", employee_id_card=" + employee_id_card +
                ", employee_salary=" + employee_salary +
                ", employee_phone=" + employee_phone +
                ", employee_email=" + employee_email +
                ", employee_address=" + employee_address +
                ", position_id=" + position_id +
                ", education_degree_id=" + education_degree_id +
                ", division_id=" + division_id +
                ", username=" + username +
                '}';
    }
}
