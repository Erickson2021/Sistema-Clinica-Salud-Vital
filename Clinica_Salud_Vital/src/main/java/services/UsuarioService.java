package services;

import beans.UsuarioDTO;
import dao.DAOFactory;
import interfaces.UsuarioDAO;

public class UsuarioService {
	DAOFactory fabrica = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
	UsuarioDAO dao = fabrica.getUsuario();
	
	//LOS METODOS
		public UsuarioDTO iniciarSesion(String usuario,String clave) {
			return dao.iniciarSesion(usuario, clave);
		}
		public int registrarUsuario(UsuarioDTO u) {
			return dao.registrarUsuario(u);
		}
}
