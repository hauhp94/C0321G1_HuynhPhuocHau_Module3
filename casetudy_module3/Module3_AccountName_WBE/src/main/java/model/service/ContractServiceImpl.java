package model.service;

import model.bean.Contract;
import model.bean.Employee;
import model.repository.ContractRepository;
import model.repository.ContractRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ContractServiceImpl implements ContractService {
    ContractRepository contractRepository = new ContractRepositoryImpl();
    @Override
    public List<Contract> findAll() {
        return contractRepository.findAll();
    }

    @Override
    public void save(Contract contract) {
    contractRepository.save(contract);
    }

    @Override
    public void remove(int id) throws SQLException {
contractRepository.remove(id);
    }

    @Override
    public void update(int id, Employee employee) {
contractRepository.update(id,employee);
    }

    @Override
    public Contract findById(int id) {
        return contractRepository.findById(id);
    }
}
