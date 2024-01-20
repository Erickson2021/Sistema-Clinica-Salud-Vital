package services;

import java.util.List;

import beans.EmpleadoDTO;
import dao.DAOFactory;
import interfaces.EmpleadoDAO;

public class EmpleadoService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	EmpleadoDAO objEmpleadoDAO = fabrica.getEmpleado();
	
	public List<EmpleadoDTO> listarEmpleados(){
		return objEmpleadoDAO.listarEmpleados();
	}
	
	public EmpleadoDTO buscarEmpleado(int cod) {
		return objEmpleadoDAO.buscarEmpleado(cod);
	}

	public int registrarEmpleado(EmpleadoDTO obj) {
		return objEmpleadoDAO.registrarEmpleado(obj);
	}

	public int actualizarEmpleado(EmpleadoDTO obj) {
		return objEmpleadoDAO.actualizarEmpleado(obj);
	}

	public int EliminarEmpleado(int cod) {
		return objEmpleadoDAO.eliminarEmpleado(cod);
	}
}
