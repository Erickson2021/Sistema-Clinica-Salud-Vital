package interfaces;

import java.util.List;

import beans.EmpleadoDTO;

public interface EmpleadoDAO {
	public List<EmpleadoDTO> listarEmpleados();
	public int registrarEmpleado(EmpleadoDTO obj);
	public int actualizarEmpleado(EmpleadoDTO obj);
	public int eliminarEmpleado(int cod);
	public EmpleadoDTO buscarEmpleado(int cod);
}
