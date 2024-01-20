package dao;

import interfaces.CitasDAO;
import interfaces.DepartamentoDAO;
import interfaces.EmpleadoDAO;
import interfaces.SedeDAO;
import interfaces.UsuarioDAO;
import interfaces.GeneroDAO;
import interfaces.HoraDAO;
import interfaces.PacienteDAO;

public class MySqlDAOFactory extends DAOFactory {

	@Override
	public EmpleadoDAO getEmpleado() {
		// TODO Auto-generated method stub
		return new MySqlEmpleadoDAO();
	}

	@Override
	public DepartamentoDAO getDepartamento() {
		// TODO Auto-generated method stub
		return new MySqlDepartamentoDAO();
	}

	@Override
	public SedeDAO getSede() {
		// TODO Auto-generated method stub
		return new MySqlSedeDAO();
	}
	@Override
	public GeneroDAO getGenero() {
		// TODO Auto-generated method stub
		return new MySqlGeneroDAO();
	}
	@Override
	public PacienteDAO getPaciente() {
		// TODO Auto-generated method stub
		return new MySqlPacienteDAO();
	}

	@Override
	public UsuarioDAO getUsuario() {
		// TODO Auto-generated method stub
		return new MySqlUsuarioDAO();
	}

	@Override
	public CitasDAO getCita() {
		// TODO Auto-generated method stub
		return new MySqlCitasDAO();
	}

	@Override
	public HoraDAO getHora() {
		// TODO Auto-generated method stub
		return new MySqlHoraDAO();
	}

}
