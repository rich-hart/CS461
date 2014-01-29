package datastructure;

public class DataSetInfo {

	public DataSetInfo(int idhomework, int idquestion, String tablename) {
		super();
		this.idhomework = idhomework;
		this.idquestion = idquestion;
		this.tablename = tablename;
	}
	
	private int idhomework;
	private int idquestion;
	private String tablename;
	public int getIdhomework() {
		return idhomework;
	}
	public void setIdhomework(int idhomework) {
		this.idhomework = idhomework;
	}
	public int getIdquestion() {
		return idquestion;
	}
	public void setIdquestion(int idquestion) {
		this.idquestion = idquestion;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
}
