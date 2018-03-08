/*
 CHShell.cpp is a shell class that simulates a shell program
 Written by Chan Kim and Hamin Hong
 
 CS 232 - Project 4
 */

#include "CHShell.h"
using namespace std;


// CHShell() defalut constructor for the CHShell class

CHShell::CHShell() { }

/*
  run() executes shell
   	Display the Prompt directory, create commandline for the user.
	if the user wants exits, the while loops returns.
	return invalid if the command was invalid
	For valid commands, it will: create pid process and get the process to...
		get the index of path of the command, receive directory path,
		execute the command, and if there is no ampersand, end and prompt again.
*/
void CHShell::run() {

	while (true) {
		cout << prompt.get(); // display the prompt
		CommandLine cmd = CommandLine(cin); //create the commandline for the user

		if (strcmp(cmd.getCommand(), "exit") == 0) {
			break; // exit with the exit command
		} else if (strcmp(cmd.getCommand(), "cd") == 0) {
			chdir(cmd.getArgVector(1));

		} else if (path.find(cmd.getCommand()) == -1) {
			cout << "Command not found..." << endl;
					
		} else {
			pid_t pid = fork();

			if (pid == 0) {
				int index = path.find(cmd.getCommand());
				char* temp_char = path.getDirectory(index);
				strcat(temp_char, "/");
				strcat(temp_char, cmd.getCommand());
				cout << endl;				
				execve(temp_char, cmd.getArgVector(), NULL);
			}

			if (cmd.noAmpersand()) {
				int status;				
				waitpid(pid, &status, 0);
			}
		}
	}

}