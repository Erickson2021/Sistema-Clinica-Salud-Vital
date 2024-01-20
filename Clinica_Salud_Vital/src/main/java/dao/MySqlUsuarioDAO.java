package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.UsuarioDTO;
import interfaces.UsuarioDAO;
import utils.MysqlDBConexion;

public class MySqlUsuarioDAO implements UsuarioDAO {

	@Override
	public UsuarioDTO iniciarSesion(String usuario, String clave) {
		// TODO Auto-generated method stub


		UsuarioDTO u = null;
		// TODO Auto-generated method stub
		//PLANTILLA DE BD 
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = MysqlDBConexion.getConexion();
			//
			String sql ="CALL usp_iniciarSesion(?,?)";
			pst = con.prepareStatement(sql);
			
			pst = con.prepareStatement(sql);
			pst.setString(1, usuario);
			pst.setString(2, clave);
			
			rs = pst.executeQuery();
			
			while (rs.next()) {
				u = new UsuarioDTO();
					//SETEAMOS LOS CAMPOS
				u.setCodigo(rs.getInt(1));
				u.setNombre(rs.getString(2));
				u.setApellido(rs.getString(3));
				u.setUsuario(usuario);
				u.setClave(clave);

			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error al validar" + e.getMessage());
		}finally {
			MysqlDBConexion.closeConexion(con);
		}
		return u;
	
	
	}

	@Override
	public int registrarUsuario(UsuarioDTO u) {
		int  rs= -1;
		Connection cn= null;
		PreparedStatement pst = null;
		try {
			cn =MysqlDBConexion.getConexion();
			
			String sql ="insert into tb_usuarios values (null,?,?,?,?)";
			
			pst = cn.prepareStatement(sql);
			
			pst.setString(1, u.getNombre());
			pst.setString(2, u.getApellido());
			pst.setString(3, u.getUsuario());
			pst.setString(4, u.getClave());
			
			
			
			rs =pst.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("error en la sentencia" + e.getMessage());
		}finally {
			try {
				pst.close();
				cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
				// TODO: handle exception
			System.out.println("error al cerrar:(");
			}
		}
		return rs;
	}

}
