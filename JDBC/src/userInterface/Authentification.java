package userInterface;

import java.io.IOException;

public class Authentification {
	
	/**
	 * 
	 */
	private static String userName;
	private static String userPassword;
	
	public Authentification() throws IOException{
		/*
		Console console = System.console();
		System.out.println("- Phase d'authentification");
		System.out.print("-- Entrez votre nom d'utilisateur : ");
		userName = console.readLine() ;
		System.out.print("-- Entrez votre mot de passe : ");
		userPassword = new String(console.readPassword());
		*/
		return ;
	}
	
	public static String getUserName(){
		return userName ;
	}
	
	public static String getPassword(){
		return userPassword ;
	}
	
	public boolean checkPermissions(String permissionFile){
		/*
		 
		String password=Authentification.getPassword();
		List<String> l = FileIO.readFile(permissionFile);
		
		Iterator<String> it = l.iterator(); 
		String line = null;
		String user = new String();
		String pass = new String();
		int index=-1;
		
		while (it.hasNext()) {
			line = it.next();
			
			index = line.indexOf(" ");
			
			user = line.substring(0, index);
			pass = line.substring(index+1, line.length());
			
			if (user.equals(username)) {
				if (pass.equals(password)) {
					return true;
				}
				else {
					System.out.println("Mot de passe incorrect.");
					return false;
				}
			}

		}
		System.out.println("Le nom d'utilisateur que vous avez entre n'existe pas.");
		return false;
		*/
		return true ;
	}
}
