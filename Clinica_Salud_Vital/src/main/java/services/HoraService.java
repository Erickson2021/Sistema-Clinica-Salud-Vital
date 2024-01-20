package services;

import java.util.List;
import beans.HoraDTO;
import dao.DAOFactory;
import interfaces.HoraDAO;

public class HoraService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	HoraDAO objHoraDAO = fabrica.getHora();
	
	public List<HoraDTO> listarHoras(){
		return objHoraDAO.ListarHoras();
	}
}
