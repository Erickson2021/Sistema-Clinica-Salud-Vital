package dao;

import interfaces.CitasDAO;
import interfaces.DepartamentoDAO;
import interfaces.EmpleadoDAO;
import interfaces.SedeDAO;
import interfaces.UsuarioDAO;
import interfaces.PacienteDAO;
import interfaces.GeneroDAO;
import interfaces.HoraDAO;

public abstract class DAOFactory {
	public static final int MYSQL = 1;
	public static final int ORACLE = 2;
	public static final int DB2 = 3;
	public static final int SQLSERVER = 4;
	public static final int XML = 5;
	
	
	public abstract EmpleadoDAO getEmpleado();
	public abstract DepartamentoDAO getDepartamento();
	public abstract SedeDAO getSede();
	public abstract HoraDAO getHora();
	
	public abstract UsuarioDAO getUsuario();
	
	public abstract PacienteDAO getPaciente();
	public abstract GeneroDAO getGenero();
	public abstract CitasDAO getCita();
	
	public static DAOFactory getDAOFactory(int whichFactory) {
		switch(whichFactory){
		case MYSQL:
			return new MySqlDAOFactory();
		case ORACLE:
			//return new OracleDAOFactory();
		case SQLSERVER:
			//return new SqlDAOFactory();
		case XML:
			//return new XmlDAOFactory();
		}
		return null;
	}
}
