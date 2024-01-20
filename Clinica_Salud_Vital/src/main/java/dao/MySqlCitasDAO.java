package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.CitasDTO;
import interfaces.CitasDAO;
import utils.MysqlDBConexion;

public class MySqlCitasDAO implements CitasDAO {
	@Override
	public List<CitasDTO> listarCitas() {
		List<CitasDTO> data = new ArrayList<CitasDTO>();
		CitasDTO obj = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "Select * from cita";
			System.out.println("before executing query: " + sql);
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();

			while (rs.next()) {
				obj = new CitasDTO();
				obj.setCodigo(rs.getInt(1));
				obj.setNom_pac(rs.getString(2));
				obj.setNom_med(rs.getString(3));
				obj.setObser(rs.getString(4));
				obj.setFecha(rs.getString(5));;
				obj.getHora().setNombre(rs.getString(6));
				data.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)	rs.close();
				if (pstm != null) pstm.close();
				if (cn != null)	cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return data;
	}

	@Override
	public int registrarCitas(CitasDTO obj) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "insert into cita values(null,?,?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, obj.getNom_pac());
			pstm.setString(2, obj.getNom_med());
			pstm.setString(3, obj.getObser());
			pstm.setString(4, obj.getFecha());
			pstm.setInt(5, obj.getHora().getCodigo());
			estado = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (cn != null)	cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return estado;
	}


	@Override
	public int eliminarCitas(int cod) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "delete from cita where cod_cit=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			estado = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (cn != null)	cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return estado;
	}

//	@Override
//	public CitasDTO buscarCitas(int cod) {
//		CitasDTO obj = null;
//		Connection cn = null;
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		try {
//			cn = MysqlDBConexion.getConexion();
//			String sql = "select * from cita where cod_cit=?";
//			pstm = cn.prepareStatement(sql);
//			pstm.setInt(1, cod);
//			rs = pstm.executeQuery();
//			if (rs.next()) {
//				obj = new CitasDTO();
//				obj.setCodigo(rs.getInt(1));
//				obj.setNom_pac(rs.getString(2));
//				obj.setNom_med(rs.getString(3));
//				obj.setObser(rs.getString(4));
//				obj.setFecha(rs.getString(5));
//				obj.getHora().setCodigo(rs.getInt(6));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)	rs.close();
//				if (pstm != null) pstm.close();
//				if (cn != null)	cn.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		return obj;
//	}

}
