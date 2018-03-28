/*
  prompt.cpp provides a class to represent the command-line promp
  Written by Chan Kim and Hamin HOng 
  CS 232 - Project 4
 */

#include "prompt.h"
using namespace std;

/*
  constructor Prompt()
 */
Prompt::Prompt() {
	
    directory = getcwd(buf, PATH_MAX + 1);
    if (directory != NULL)
    {
        strcat(directory, "CHShell/$ "); //gain current working directory
    }
}

/*
  get() accessor method  
 */
char* Prompt::get() const {

	return directory; //return current_directory variable
}