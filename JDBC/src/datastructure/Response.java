package datastructure;

public class Response {
	
	private int idresponse;
	private String responsedesc;
	
	public Response(int idresponse, String responsedesc) {
		super();
		this.setIdresponse(idresponse);
		this.setResponsedesc(responsedesc);
	}

	public int getIdresponse() {
		return idresponse;
	}

	public void setIdresponse(int idresponse) {
		this.idresponse = idresponse;
	}

	public String getResponsedesc() {
		return responsedesc;
	}

	public void setResponsedesc(String responsedesc) {
		this.responsedesc = responsedesc;
	}
}
