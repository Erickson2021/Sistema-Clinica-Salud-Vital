package services;

import java.util.List;

import beans.DepartamentoDTO;
import dao.DAOFactory;
import interfaces.DepartamentoDAO;

public class DepartamentoService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	DepartamentoDAO objDepartamentoDAO = fabrica.getDepartamento();
	
	public List<DepartamentoDTO> listarDepartamentos(){
		return objDepartamentoDAO.listarDepartamentos();
	}
}
