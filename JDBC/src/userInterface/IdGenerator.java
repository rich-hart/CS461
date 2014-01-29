package userInterface;

public class IdGenerator{
	  private int value;

	  public IdGenerator( int value ){
	    this.value = value;
	  }

	  public int nextValue(){
	    return this.value++;
	  }

	}
