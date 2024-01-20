package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.HoraDTO;
import interfaces.HoraDAO;
import utils.MysqlDBConexion;

public class MySqlHoraDAO implements HoraDAO{
	@Override
	public List<HoraDTO> ListarHoras() {
		List<HoraDTO> data = new ArrayList<HoraDTO>();
		HoraDTO obj = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "select * from hora";
			System.out.println("before executing query: " + sql);
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();

			while (rs.next()) {
				obj = new HoraDTO();
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
