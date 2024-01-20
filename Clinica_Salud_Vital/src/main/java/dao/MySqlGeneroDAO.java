package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.GeneroDTO;
import interfaces.GeneroDAO;
import utils.MysqlDBConexion;

public class MySqlGeneroDAO implements GeneroDAO {
	
	@Override
	public List<GeneroDTO> listarGeneros() {
		List<GeneroDTO> data = new ArrayList<GeneroDTO>();
		GeneroDTO obj = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "SELECT * FROM genero";
			System.out.println("before executing query: " + sql);
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();

			while (rs.next()) {
				obj = new GeneroDTO();
				obj.setCodigo(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				data.add(obj);
			}
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
		return data;
	}

}
