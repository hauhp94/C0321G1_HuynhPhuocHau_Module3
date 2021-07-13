package model.repository;

import model.bean.PhongTro;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PhongTroRepositoryImpl implements PhongTroRepository {
    private static final String SELECT_PHONG_TRO_LIST ="select ma_phong_tro, ten_nguoi_thue, so_dien_thoai, ngay_bat_dau, phong_tro.id_httt, ghi_chu,  ten_hinh_thuc from phong_tro\n" +
            "join hinh_thuc_thanh_toan on phong_tro.id_httt=hinh_thuc_thanh_toan.id_httt;";
    private static final String CREATE_PHONG_TRO = "insert into phong_tro ( ten_nguoi_thue, so_dien_thoai, ngay_bat_dau, id_httt, ghi_chu)\n" +
            "values(?,?,?,?,?);";
    private static final String DELETE_FROM_PHONG_TRO_WHERE_ID = "delete from phong_tro where ma_phong_tro=?;";
    private static final String SELECT_PHONG_TRO_BY_KEY = "call search_phong_tro(?);";

    @Override
    public List<PhongTro> findAll() {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        CallableStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareCall(SELECT_PHONG_TRO_LIST);
                resultSet = statement.executeQuery();
                PhongTro phongTro = null;
                while (resultSet.next()) {
//                    ma_phong_tro, ten_nguoi_thue, so_dien_thoai, ngay_bat_dau, id_httt, ghi_chu
                    int id = resultSet.getInt("ma_phong_tro");
                    String ten_nguoi_thue = resultSet.getString("ten_nguoi_thue");
                    String ghi_chu = resultSet.getString("ghi_chu");
                    String so_dien_thoai = resultSet.getString("so_dien_thoai");
                    LocalDate ngay_bat_dau = LocalDate.parse(resultSet.getString("ngay_bat_dau"));
                    int id_httt = resultSet.getInt("id_httt");
                    String ten_hinh_thuc = resultSet.getString("ten_hinh_thuc");
                    phongTro = new PhongTro(id,ten_nguoi_thue,so_dien_thoai,ngay_bat_dau,id_httt,ten_hinh_thuc,ghi_chu);
                    phongTroList.add(phongTro);
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
        return phongTroList;
    }

    @Override
    public void save(PhongTro phongTro) {
        Connection connection = DBConnection.getConnection();

        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(CREATE_PHONG_TRO);
                statement.setString(1, phongTro.getTenNguoiThue());
                statement.setString(2, phongTro.getSoDienThoai());
                statement.setDate(3, Date.valueOf(phongTro.getNgayBatDau()));
                statement.setInt(4, phongTro.getIdHinhThucThanhToan());
                statement.setString(5, phongTro.getGhiChu());
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
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_FROM_PHONG_TRO_WHERE_ID);
        statement.setInt(1, id);
        statement.executeUpdate();
    }

    @Override
    public void update(int id, PhongTro phongTro) {

    }

    @Override
    public PhongTro findById(int id) {
        for (PhongTro phongTro : this.findAll()) {
            if (phongTro.getMaPhongTro()==id) {
                return phongTro;
            }
        }
        return null;
    }

    @Override
    public List<PhongTro> findByName(String name) {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        CallableStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareCall(SELECT_PHONG_TRO_BY_KEY);
                statement.setString(1, name);
                resultSet = statement.executeQuery();
                PhongTro phongTro = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("ma_phong_tro");
                    String ten_nguoi_thue = resultSet.getString("ten_nguoi_thue");
                    String ghi_chu = resultSet.getString("ghi_chu");
                    String so_dien_thoai = resultSet.getString("so_dien_thoai");
                    LocalDate ngay_bat_dau = LocalDate.parse(resultSet.getString("ngay_bat_dau"));
                    int id_httt = resultSet.getInt("id_httt");
                    String ten_hinh_thuc = resultSet.getString("ten_hinh_thuc");
                    phongTro = new PhongTro(id,ten_nguoi_thue,so_dien_thoai,ngay_bat_dau,id_httt,ten_hinh_thuc,ghi_chu);
                    phongTroList.add(phongTro);
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
        return phongTroList;
    }
}
