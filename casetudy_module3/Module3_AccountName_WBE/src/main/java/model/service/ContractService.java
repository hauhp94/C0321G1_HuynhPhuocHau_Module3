package model.service;

import model.bean.Contract;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface ContractService {
    List<Contract> findAll();

    void save(Contract contract);

    void remove(int id) throws SQLException;

    void update(int id, Employee employee);

    Contract findById(int id);

}
