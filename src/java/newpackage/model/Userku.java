/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage.model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bluesky
 */
public class Userku {
    String kode_barang,nama_barang,harga_jual,harga_beli,satuan,kategori,stok_barang;
    koneksi db=null;
    public Userku(){
        db=new koneksi();
        
    }

    public String getKode_barang() {
        return kode_barang;
    }

    public void setKode_barang(String kode_barang) {
        this.kode_barang = kode_barang;
    }

    public String getNama_barang() {
        return nama_barang;
    }

    public void setNama_barang(String nama_barang) {
        this.nama_barang = nama_barang;
    }

    public String getHarga_jual() {
        return harga_jual;
    }

    public void setHarga_jual(String harga_jual) {
        this.harga_jual = harga_jual;
    }

    public String getHarga_beli() {
        return harga_beli;
    }

    public void setHarga_beli(String harga_beli) {
        this.harga_beli = harga_beli;
    }

    public String getSatuan() {
        return satuan;
    }

    public void setSatuan(String satuan) {
        this.satuan = satuan;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getStok_barang() {
        return stok_barang;
    }

    public void setStok_barang(String stok_barang) {
        this.stok_barang = stok_barang;
    }

     public List tampil() {
        List<Userku> data = new ArrayList<Userku>();
        ResultSet rs = null;
 
        try {
            String sql = "select * from m_barang";
            rs = db.ambilData(sql);
            while (rs.next()) {
                Userku um = new Userku();
                um.setKode_barang(rs.getString("kode_barang"));
                um.setNama_barang(rs.getString("nama_barang"));
                um.setHarga_jual(rs.getString("harga_jual"));
                um.setHarga_beli(rs.getString("harga_beli"));
                um.setSatuan(rs.getString("satuan"));
                um.setKategori(rs.getString("kategori"));
                um.setStok_barang(rs.getString("stok_barang"));
                data.add(um);
 
            }
            db.diskonek(rs);
        } catch (Exception ex) {
            System.out.println("Terjadi Kesalahan Saat menampilkan data User" + ex);
        }
        return data;
    }

}
