package userInterface;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ConsoleUI implements UIimplementation {

	@Override
	public String Readline() {
		String output = "";
		try{
			BufferedReader bufferRead = new BufferedReader(new InputStreamReader(System.in));
			output = bufferRead.readLine();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		return output;
	}

	@Override
	public void PutLine(String input) {
		System.out.println(input);
	}

}
