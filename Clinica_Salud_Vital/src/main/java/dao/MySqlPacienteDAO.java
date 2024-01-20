package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.PacienteDTO;
import interfaces.PacienteDAO;
import utils.MysqlDBConexion;

public class MySqlPacienteDAO implements PacienteDAO {
	
	@Override
	public List<PacienteDTO> listarPacientes() {
		List<PacienteDTO> data = new ArrayList<PacienteDTO>();
		PacienteDTO obj = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			cn = MysqlDBConexion.getConexion();
			String sql = 
					"select p.cod_pac,p.dni_pac,p.nom_pac,p.pat_pac,p.mat_pac, g.nom_gene, p.edad_pac,p.tele_pac,p.dire_pac "
					+ "from paciente p join genero g on p.cod_gene = g.cod_gene order by p.cod_pac";
			System.out.println("before executing query: " + sql);
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();

			while (rs.next()) {
				obj = new PacienteDTO();
				obj.setCodigo(rs.getInt(1));
				obj.setDni(rs.getString(2));
				obj.setNombres(rs.getString(3));
				obj.setApPaterno(rs.getString(4));
				obj.setApMaterno(rs.getString(5));
				obj.getGenero().setNombre(rs.getString(6));;
				obj.setEdad(rs.getString(7));
				obj.setTelefono(rs.getString(8));
				obj.setDireccion(rs.getString(9));
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
	public int registrarPaciente(PacienteDTO obj) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "insert into paciente values(null,?,?,?,?,?,?,?,?)";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, obj.getDni());
			pstm.setString(2, obj.getNombres());
			pstm.setString(3, obj.getApPaterno());
			pstm.setString(4, obj.getApMaterno());
			pstm.setInt(5, obj.getGenero().getCodigo());
			pstm.setString(6, obj.getEdad());
			pstm.setString(7, obj.getTelefono());
			pstm.setString(8, obj.getDireccion());
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
	public int actualizarPaciente(PacienteDTO obj) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "update paciente set dni_pac=?, nom_pac=?, pat_pac=?, mat_pac=?, cod_gene=?, edad_pac=?, tele_pac=?, dire_pac=? where cod_pac=?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, obj.getDni());
			pstm.setString(2, obj.getNombres());
			pstm.setString(3, obj.getApPaterno());
			pstm.setString(4, obj.getApMaterno());
			pstm.setInt(5, obj.getGenero().getCodigo());
			pstm.setString(6, obj.getEdad());
			pstm.setString(7, obj.getTelefono());
			pstm.setString(8, obj.getDireccion());
			pstm.setInt(9, obj.getCodigo());
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
	public int eliminarPaciente(int cod) {
		int estado = -1;
		Connection cn = null;
		PreparedStatement pstm = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "delete from paciente where cod_pac=?";
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
	public PacienteDTO buscarPaciente(int cod) {
		PacienteDTO obj = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			cn = MysqlDBConexion.getConexion();
			String sql = "select * from paciente where cod_pac=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			rs = pstm.executeQuery();
			if (rs.next()) {
				obj = new PacienteDTO();
				obj.setCodigo(rs.getInt(1));
				obj.setDni(rs.getString(2));
				obj.setNombres(rs.getString(3));
				obj.setApPaterno(rs.getString(4));
				obj.setApMaterno(rs.getString(5));
				obj.getGenero().setCodigo(rs.getInt(6));
				obj.setEdad(rs.getString(7));
				obj.setTelefono(rs.getString(8));
				obj.setDireccion(rs.getString(9));

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