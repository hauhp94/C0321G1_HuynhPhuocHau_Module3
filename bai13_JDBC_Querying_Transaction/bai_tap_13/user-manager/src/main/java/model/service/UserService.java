package model.service;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
    public List<User> selectAllUsersUseProcedure();
    public boolean updateUserUseProcedure(User user) throws SQLException;
    public boolean deleteUserUseProcedure(int id) throws SQLException;
    void addUserTransaction(User user) throws SQLException;



}
