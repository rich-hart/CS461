package datastructure;


public class Homework {

	private int IDHomework;
	private String Name;
	private String DueDate;
	private String LateDate;
	private int LatePenality;
	

	public Homework(int iDHomework, String name, String dueDate,
			String lateDate, int latePenality) {
		super();
		IDHomework = iDHomework;
		Name = name;
		DueDate = dueDate;
		LateDate = lateDate;
		LatePenality = latePenality;
	}
	
	@Override 
	public  String toString()
	{
		return this.IDHomework + "," + this.Name + "," + this.DueDate + "," + this.LateDate + "," + this.LatePenality;
	}
	
	public String displayHeader()
	{
		return this.Name + " , " + "Due " + this.DueDate;
	}

	public int getIDHomework() {
		return IDHomework;
	}

	public void setIDHomework(int iDHomework) {
		IDHomework = iDHomework;
	}
	
}
