package datastructure;

public class Question {

	private int idhomework ;
	private int IDQuestion;
	private String Description;
	private String Solution;
	private int Points;
	private int PenalityPoint;
	private int DataSetPoints;
	private int ResultSetPoints; 
	


	public Question(int idhomework, int idquestion, String description,
			String solution, int points, int penalitypoints,
			int datasetPoints, int resultsetPoints) {
		// TODO Auto-generated constructor stub

		super();
		this.idhomework = idhomework;
		this.ResultSetPoints = resultsetPoints;
		IDQuestion = idquestion;
		Description = description;
		setSolution(solution);
		setPoints(points);
		PenalityPoint = penalitypoints;
		setDataSetPoints(datasetPoints);}

	public String displayHeader() {
		// TODO Auto-generated method stub
		return "Question " + Integer.toString(this.IDQuestion);
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public int getIdhomework() {
		return idhomework;
	}

	public void setIdhomework(int idhomework) {
		this.idhomework = idhomework;
	}
	
	public int getIDQuestion() {
		return IDQuestion;
	}

	public void setIDQuestion(int iDQuestion) {
		IDQuestion = iDQuestion;
	}

	public String getSolution() {
		return Solution;
	}

	public void setSolution(String solution) {
		Solution = solution;
	}

	public int getPoints() {
		return Points;
	}

	public void setPoints(int points) {
		Points = points;
	}

	public int getDataSetPoints() {
		return DataSetPoints;
	}

	public void setDataSetPoints(int dataSetPoints) {
		DataSetPoints = dataSetPoints;
	}

	public void substractDataset() {
		this.Points -= this.DataSetPoints;
	}
	
	public int getResultSetPoints() {
		 return ResultSetPoints;
	}
	
	public void setResultSetPoints(int resultSetPoints) {
		this.ResultSetPoints = resultSetPoints;
	}
	
	}