package model.repository;

import model.bean.Contract;
import model.bean.Employee;
import model.bean.Service;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImpl implements ContractRepository {
    private static final String CREATE_CONTRACT = "insert into contract (contract_start_date, contract_end_date, contract_deposit, contract_total_money, employee_id, customer_id, service_id) values (?,?,?,?,?,?,?);";
    private static final String SELECT_CONTRACT = "select* from contract_full;";

    @Override
    public List<Contract> findAll() {
        List<Contract> contractList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_CONTRACT);
                resultSet = statement.executeQuery();
                Contract contract = null;
                while (resultSet.next()) {
                    int contract_id = resultSet.getInt("contract_id");
                    String contract_start_date = resultSet.getString("contract_start_date");
                    String contract_end_date = resultSet.getString("contract_end_date");
                    double contract_deposit = resultSet.getDouble("contract_deposit");
                    double contract_total_money = resultSet.getDouble("contract_total_money");
                    int employee_id = resultSet.getInt("employee_id");
                    String employee_name = resultSet.getString("employee_name");
                    int customer_id = resultSet.getInt("customer_id");
                    String customer_name = resultSet.getString("customer_name");
                    int service_id = resultSet.getInt("service_id");
                    String service_name = resultSet.getString("service_name");
                    contract = new Contract(contract_id, contract_start_date, contract_end_date,
                            contract_deposit, contract_total_money, employee_id, employee_name, customer_id,
                            customer_name, service_id, service_name);

                    contractList.add(contract);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return contractList;
    }

    @Override
    public void save(Contract contract) {
        Connection connection = DBConnection.getConnection();

        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(CREATE_CONTRACT);
                statement.setString(1, String.valueOf(contract.getContract_start_date()));
                statement.setString(2, String.valueOf(contract.getContract_end_date()));
                statement.setDouble(3, contract.getContract_deposit());
                statement.setDouble(4, contract.getContract_total_money());
                statement.setInt(5, contract.getEmployee_id());
                statement.setInt(6, contract.getCustomer_id());
                statement.setInt(7, contract.getService_id());
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
    public Contract findById(int id) {
        return null;
    }
}
