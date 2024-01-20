package services;

import java.util.List;

import beans.SedeDTO;
import dao.DAOFactory;
import interfaces.SedeDAO;

public class SedeService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	SedeDAO objSedeDAO = fabrica.getSede();
	
	public List<SedeDTO> listarSedes(){
		return objSedeDAO.ListarSedes();
	}
}
