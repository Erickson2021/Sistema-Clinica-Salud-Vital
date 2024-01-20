package beans;


public class CitasDTO {
	private int codigo;
	private String nom_pac;
	private String nom_med;
	private String obser;
	private String fecha;
	private HoraDTO hora = new HoraDTO();
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNom_pac() {
		return nom_pac;
	}
	public void setNom_pac(String nom_pac) {
		this.nom_pac = nom_pac;
	}
	public String getNom_med() {
		return nom_med;
	}
	public void setNom_med(String nom_med) {
		this.nom_med = nom_med;
	}
	public String getObser() {
		return obser;
	}
	public void setObser(String obser) {
		this.obser = obser;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public HoraDTO getHora() {
		return hora;
	}
	public void setHora(HoraDTO hora) {
		this.hora = hora;
	}
	
	

	
	
}
