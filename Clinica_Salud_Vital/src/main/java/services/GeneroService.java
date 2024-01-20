package services;

import java.util.List;

import beans.GeneroDTO;
import dao.DAOFactory;
import interfaces.GeneroDAO;

public class GeneroService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	GeneroDAO objGeneroDAO = fabrica.getGenero();
	
	public List<GeneroDTO> listarGeneros(){
		return objGeneroDAO.listarGeneros();
	}
}
