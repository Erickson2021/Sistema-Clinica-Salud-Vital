package interfaces;

import java.util.List;

import beans.CitasDTO;

public interface CitasDAO {
	public List<CitasDTO> listarCitas();
	public int registrarCitas(CitasDTO obj);
	public int eliminarCitas(int cod);
}
