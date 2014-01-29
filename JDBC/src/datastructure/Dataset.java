package datastructure;

import java.sql.SQLException;
import java.util.ArrayList;

import sqlConnection.ConnectionManager;

public class Dataset {

	private int idhomework;
	private int iddataset;
	private String datasetdata;
	
	public Dataset(int idhomework, int iddataset, String datasetdata) {
		super();
		this.idhomework = idhomework;
		this.iddataset = iddataset;
		this.setDatasetdata(datasetdata);
	}
	
	public String PrintContent(ArrayList<DataSetInfo> infos)
	{
		String output = "\n";
		ConnectionManager manager = new ConnectionManager(this.datasetdata);
		int connection = 0;
		try {
			connection = manager.newConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ArrayList<String> tables = new ArrayList<String>();
		/*ArrayList<String> tables = handler.ExecuteColumn("SELECT * FROM information_schema.tables " +
				"WHERE table_type = 'BASE TABLE' AND table_schema = 'public' ORDER BY table_type, table_name;", "table_name");
		*/
		for (int i = 0; i < infos.size(); i++) {
			DataSetInfo info = infos.get(i);
			tables.add(info.getTablename());
		}
		for (String table : tables) {
			//System.out.println(table);
			try {
				output += table + "\n" + manager.request(connection, "SELECT * FROM " + table + ";") + "\n";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return output;
	}

	public String getDatasetdata() {
		return datasetdata;
	}

	public void setDatasetdata(String datasetdata) {
		this.datasetdata = datasetdata;
	}
}
