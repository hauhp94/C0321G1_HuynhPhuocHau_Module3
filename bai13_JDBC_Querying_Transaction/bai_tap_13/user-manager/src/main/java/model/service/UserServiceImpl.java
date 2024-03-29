package model.service;

import model.bean.User;
import model.repository.UserRepository;
import model.repository.UserRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements  UserService {
    UserRepository repository = new UserRepositoryImpl();
    @Override
    public void insertUser(User user) throws SQLException {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return repository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return repository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return repository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return repository.updateUser(user);
    }

    @Override
    public List<User> selectAllUsersUseProcedure() {
        return repository.selectAllUsersUseProcedure();
    }

    @Override
    public boolean updateUserUseProcedure(User user) throws SQLException {
        return repository.updateUserUseProcedure(user);
    }

    @Override
    public boolean deleteUserUseProcedure(int id) throws SQLException {
        return repository.deleteUserUseProcedure(id);
    }

    @Override
    public void addUserTransaction(User user) throws SQLException {
        repository.addUserTransaction(user);
    }
}
