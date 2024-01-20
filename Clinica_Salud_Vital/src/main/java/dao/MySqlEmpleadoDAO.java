package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.EmpleadoDTO;
import interfaces.EmpleadoDAO;
import utils.MysqlDBConexion;

public class MySqlEmpleadoDAO implements EmpleadoDAO {

	@Override
	public List<EmpleadoDTO> listarEmpleados() {
		List<EmpleadoDTO> data = new ArrayList<EmpleadoDTO>();
		EmpleadoDTO obj = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "select e.cod_emp,e.nom_emp,e.pat_emp,e.mat_emp,e.cargo_emp,e.cel_emp,d.nom_depa,s.nom_sede"
					+ " from empleado e join departamento d on e.cod_depa = d.cod_depa join sede s on e.cod_sede = s.cod_sede order by e.cod_emp";
			System.out.println("before executing query: " + sql);
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();

			while (rs.next()) {
				obj = new EmpleadoDTO();
				obj.setCodigo(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setApPaterno(rs.getString(3));
				obj.setApMaterno(rs.getString(4));
				obj.setCargo(rs.getString(5));
				obj.setCelular(rs.getString(6));
				obj.getDepartamento().setNombre(rs.getString(7));;
				obj.getSede().setNombre(rs.getString(8));
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
	public int registrarEmpleado(EmpleadoDTO obj) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "insert into empleado values(null,?,?,?,?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getApPaterno());
			pstm.setString(3, obj.getApMaterno());
			pstm.setString(4, obj.getCargo());
			pstm.setString(5, obj.getCelular());
			pstm.setInt(6, obj.getDepartamento().getCodigo());
			pstm.setInt(7, obj.getSede().getCodigo());
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
	public int actualizarEmpleado(EmpleadoDTO obj) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "update empleado set nom_emp=?, pat_emp=?, mat_emp=?, cargo_emp=?, cel_emp=?,"
					+ "cod_depa=?, cod_sede=? where cod_emp=?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getApPaterno());
			pstm.setString(3, obj.getApMaterno());
			pstm.setString(4, obj.getCargo());
			pstm.setString(5, obj.getCelular());
			pstm.setInt(6, obj.getDepartamento().getCodigo());
			pstm.setInt(7, obj.getSede().getCodigo());
			pstm.setInt(8, obj.getCodigo());
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
	public int eliminarEmpleado(int cod) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "delete from empleado where cod_emp=?";
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

	@Override
	public EmpleadoDTO buscarEmpleado(int cod) {
		EmpleadoDTO obj = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "select * from empleado where cod_emp=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			rs = pstm.executeQuery();
			if (rs.next()) {
				obj = new EmpleadoDTO();
				obj.setCodigo(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				obj.setApPaterno(rs.getString(3));
				obj.setApMaterno(rs.getString(4));
				obj.setCargo(rs.getString(5));
				obj.setCelular(rs.getString(6));
				obj.getDepartamento().setCodigo(rs.getInt(7));
				obj.getSede().setCodigo(rs.getInt(8));
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
		return obj;
	}

}
