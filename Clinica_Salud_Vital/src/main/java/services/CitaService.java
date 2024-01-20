package services;

import java.util.List;

import beans.CitasDTO;
import dao.DAOFactory;
import interfaces.CitasDAO;

public class CitaService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	CitasDAO objCitasDAO = fabrica.getCita();
	
	public List<CitasDTO> listarCitas(){
		return objCitasDAO.listarCitas();
	}

	public int registrarCita(CitasDTO obj) {
		return objCitasDAO.registrarCitas(obj);
	}

	public int EliminarCita(int cod) {
		return objCitasDAO.eliminarCitas(cod);
	}
}
