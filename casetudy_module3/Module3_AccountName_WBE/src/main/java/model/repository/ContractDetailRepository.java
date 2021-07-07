package model.repository;

import model.bean.Contract;
import model.bean.ContractDetail;
import model.bean.Employee;

import java.sql.SQLException;
import java.util.List;

public interface ContractDetailRepository {
    List<ContractDetail> findAll();

    void save(ContractDetail contractDetail);

    void remove(int id) throws SQLException;

    void update(int id, Employee employee);

    ContractDetail findById(int id);
}
