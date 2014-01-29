package userInterface;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

// the students credential is stored in a file and read here
public class FileIO {
	/**
	 * Open and read a file, and return the lines in the file as a list
	 * of Strings.
	 * (Demonstrates Java FileReader, BufferedReader, and Java5.)
	 */
	public static List<String> readFile(String filename)
	{
	  List<String> records = new ArrayList<String>();
	  try
	  {
	    BufferedReader reader = new BufferedReader(new FileReader(filename));
	    String line;
	    while ((line = reader.readLine()) != null)
	    {
	      records.add(line);
	    }
	    reader.close();
	    return records;
	  }
	  catch (Exception e)
	  {
	    System.err.format("Exception occurred trying to read '%s'.", filename);
	    // e.printStackTrace();
	    return null;
	  }
	}

	public static String[] getLogins(String filename){
		String[] result = new String[2];
		
		try
		  {
			BufferedReader reader = new BufferedReader(new FileReader(filename));
		    for (int i = 0 ; i < result.length ; i++){
				
			    String line = reader.readLine();
			    
			    if (line != null){
			    	result[i] = line ;
			    } else {
			    	System.out.println("Exception occurred trying to read " + filename);
				    System.exit(0);
				    return null;
			    }
		    }
		    reader.close();
		    return result ;
		  }
		  catch (Exception e)
		  {
		    System.out.println("Exception occurred trying to read " + filename);
		    e.printStackTrace();
		    return null;
		  }
	}
	
	public static String getSQLURL(String filename) {
		
		  try
		  {
		    BufferedReader reader = new BufferedReader(new FileReader(filename));
		    String line = reader.readLine();
		    reader.close();
		    if (line != null)
		    	return line ;
		    else {
		    	System.out.println("Exception occurred trying to read " + filename);
			    System.exit(0);
			    return null;
		    }
		  }
		  catch (Exception e)
		  {
		    System.out.println("Impossible d'ouvrir le fichier " + filename);
		    e.printStackTrace();
		    return null;
		  }
	}
	
	public static String getRequest(String filename) throws Exception {
		BufferedReader reader = null ;
		try {
			reader = new BufferedReader(new FileReader(filename));
		} catch (FileNotFoundException e) {
			System.out.println("\nImpossible d'ouvrir le fichier " + filename);
			throw new Exception();
		}
		
		String result = "";
		String buffer = reader.readLine();
		while (buffer != null){
			result = result + buffer ;
			buffer = reader.readLine();
		}
		
		System.out.println("Resultat de getRequest : \n "+result + "\n\n");
		
		return result ;
		
		
	}
	
	public static String[] getCredential(String ConfSQL)
	{
		String[] authentification = null;
		
		try{
			// Open the file that is the first 
			// command line parameter
			FileInputStream fstream = new FileInputStream(ConfSQL);
			// Get the object of DataInputStream
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String strLine;
			//Read File Line By Line
			while ((strLine = br.readLine()) != null)   {
				// Print the content on the console
				if(strLine.contains("wander.cs.drexel.edu"))
				{
					authentification = strLine.split(":");
				}
			}
			//Close the input stream
			in.close();
		}catch (Exception e){//Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}
		return authentification;
	}
}

