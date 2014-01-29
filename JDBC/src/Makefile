all: projetBD

projetBD:
	mkdir -p bin
	javac -cp res/postgresql-9.2-1002.jdbc4.jar:res/commons-lang-2.4.jar -g -d bin/ src/*/*.java 
exe:
	java bin/userInterface/UI

clean:
	rm -rf bin
