package interfaces;

import java.util.List;
import beans.PacienteDTO;

public interface PacienteDAO {
	public List<PacienteDTO> listarPacientes();
	public int registrarPaciente(PacienteDTO obj);
	public int actualizarPaciente(PacienteDTO obj);
	public int eliminarPaciente(int cod);
	public PacienteDTO buscarPaciente(int cod);
}
