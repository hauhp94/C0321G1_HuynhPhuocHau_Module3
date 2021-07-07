package model.service;

import model.bean.ContractDetail;
import model.bean.Employee;
import model.repository.ContractDetailRepository;
import model.repository.ContractDetailRepositoryImpl;
import model.repository.ContractRepository;

import java.sql.SQLException;
import java.util.List;

public class ContractDetailServiceImpl implements ContractDetailService{
    ContractDetailRepository contractDetailRepository= new ContractDetailRepositoryImpl();
    @Override
    public List<ContractDetail> findAll() {
        return contractDetailRepository.findAll();
    }

    @Override
    public void save(ContractDetail contractDetail) {
        contractDetailRepository.save(contractDetail);
    }

    @Override
    public void remove(int id) throws SQLException {
        contractDetailRepository.remove(id);
    }

    @Override
    public void update(int id, Employee employee) {
        contractDetailRepository.update(id,employee);
    }

    @Override
    public ContractDetail findById(int id) {
        return contractDetailRepository.findById(id);
    }
}
