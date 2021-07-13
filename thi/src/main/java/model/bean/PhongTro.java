package model.bean;

import java.time.LocalDate;

public class PhongTro {
    private int maPhongTro;
    private String tenNguoiThue;
    private String soDienThoai;
    private LocalDate ngayBatDau;
    private int idHinhThucThanhToan;
    private String tenHinhThucThanhToan;
    private String ghiChu;

    public PhongTro(int maPhongTro, String tenNguoiThue, String soDienThoai, LocalDate ngayBatDau,
                    int idHinhThucThanhToan, String tenHinhThucThanhToan, String ghiChu) {
        this.maPhongTro = maPhongTro;
        this.tenNguoiThue = tenNguoiThue;
        this.soDienThoai = soDienThoai;
        this.ngayBatDau = ngayBatDau;
        this.idHinhThucThanhToan = idHinhThucThanhToan;
        this.tenHinhThucThanhToan = tenHinhThucThanhToan;
        this.ghiChu = ghiChu;
    }

    public int getMaPhongTro() {
        return maPhongTro;
    }

    public void setMaPhongTro(int maPhongTro) {
        this.maPhongTro = maPhongTro;
    }

    public String getTenNguoiThue() {
        return tenNguoiThue;
    }

    public void setTenNguoiThue(String tenNguoiThue) {
        this.tenNguoiThue = tenNguoiThue;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public LocalDate getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(LocalDate ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public int getIdHinhThucThanhToan() {
        return idHinhThucThanhToan;
    }

    public void setIdHinhThucThanhToan(int idHinhThucThanhToan) {
        this.idHinhThucThanhToan = idHinhThucThanhToan;
    }

    public String getTenHinhThucThanhToan() {
        return tenHinhThucThanhToan;
    }

    public void setTenHinhThucThanhToan(String tenHinhThucThanhToan) {
        this.tenHinhThucThanhToan = tenHinhThucThanhToan;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }
}
