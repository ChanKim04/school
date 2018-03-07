/*
 * DJshell.cpp
 * Created on: Mar 7, 2017
 * Author: dk43 and dl38 
 * 	   Judy Kwon and DanBe Lee
 */
 
 
//  http://xmodulo.com/gdb-command-line-debugger.html

#include "DJShell.h"
#include "Prompt.h"
#include "CommandLine.h"
#include <unistd.h>
#include <iostream>
#include <stdio.h>
#include <sys/wait.h>
#include <string>
#include"stdlib.h" /* getenv */

using namespace std;



/* DJShell() is a constructor to initialize shell
 * 
 */
DJShell::DJShell() {
}

/* run() executes the shell
 * 
 */
void DJShell::run() {

   Path myPath;

   while (true) { //REPL (read eval print loop)

	   Prompt myPrompt;
       cout << myPrompt.get() << endl;
       CommandLine cl = CommandLine(std::cin);

       string newcommand = (cl.getCommand());

       if (newcommand == "cd") {
    	   chdir(cl.getArgVector(1));
       } else if (newcommand == "pwd" ) {
    	  char currdir[255];
    	  string myVar;
    	  char* getcwd(char* currdir);
    	   cout << currdir << endl;


       } else if (newcommand == "exit"){
    	   break;

       } else {
    	   string dirPath = myPath.getDirectory(myPath.find(newcommand));
    	   string fullPath = dirPath + "/" + (cl.getCommand());

    	   if (dirPath == "") {
    		   cout << "Invalid input" << endl;
    	   } else{
    		   int * dump;

    		   if (cl.noAmpersand()) {
    			   cout << "No ampersand found - running in foreground" << endl;

    			   int pid_ps = fork();

    			   if (pid_ps == 0) {

    				   execve(fullPath.c_str(), cl.getArgVector(), NULL); /*Piazza*/
    				   exit(0);

    			   } else {
    				   waitpid(pid_ps, dump, 0);}

    		   } else {
    			   int pid_ps = fork();

    			   if (pid_ps == 0) {
    				   execve(fullPath.c_str(), cl.getArgVector(), NULL);
    				   exit(0);

    			   } else { // display prompt
    				   }
    		   }
    	   }
       }
   }
}





