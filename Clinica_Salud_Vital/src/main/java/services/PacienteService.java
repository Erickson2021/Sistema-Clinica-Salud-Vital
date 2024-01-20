package services;

import java.util.List;

import beans.PacienteDTO;
import dao.DAOFactory;
import interfaces.PacienteDAO;

public class PacienteService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	PacienteDAO objPacienteDAO = fabrica.getPaciente();
	
	public List<PacienteDTO> listarPacientes(){
		return objPacienteDAO.listarPacientes();
	}
	
	public PacienteDTO buscarPaciente(int cod) {
		return objPacienteDAO.buscarPaciente(cod);
	}

	public int registrarPaciente(PacienteDTO obj) {
		return objPacienteDAO.registrarPaciente(obj);
	}

	public int actualizarPaciente(PacienteDTO obj) {
		return objPacienteDAO.actualizarPaciente(obj);
	}

	public int EliminarPaciente(int cod) {
		return objPacienteDAO.eliminarPaciente(cod);
	}
}
