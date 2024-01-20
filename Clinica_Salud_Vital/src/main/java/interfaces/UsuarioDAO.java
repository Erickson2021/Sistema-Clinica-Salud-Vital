package interfaces;

import beans.UsuarioDTO;

public interface UsuarioDAO {

	public UsuarioDTO iniciarSesion(String usuario,String clave);
	public int registrarUsuario(UsuarioDTO u);
}
