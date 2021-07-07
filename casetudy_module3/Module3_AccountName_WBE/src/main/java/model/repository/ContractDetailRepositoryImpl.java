package model.repository;

import model.bean.Contract;
import model.bean.ContractDetail;
import model.bean.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ContractDetailRepositoryImpl implements ContractDetailRepository{

    private static final String CREATE_CONTRACT_DETAIL = "insert into contract_detail(contract_id,attach_service_id,quantity) values (?,?,?);";

    @Override
    public List<ContractDetail> findAll() {
        return null;
    }

    @Override
    public void save(ContractDetail contractDetail) {
        Connection connection = DBConnection.getConnection();

        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(CREATE_CONTRACT_DETAIL);
                statement.setInt(1, contractDetail.getContract_id());
                statement.setInt(2, contractDetail.getAttach_service_id());
                statement.setInt(3, contractDetail.getQuantity());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void remove(int id) throws SQLException {

    }

    @Override
    public void update(int id, Employee employee) {

    }

    @Override
    public ContractDetail findById(int id) {
        return null;
    }
}
