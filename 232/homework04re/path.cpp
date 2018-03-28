/*
 * path.cpp 
 * Written by CHan Kim and Hamin Hong
 * CS 232 - Project 4
 */

#include "path.h"
using namespace std;

/*
 * Path constructor
 */ 
Path::Path() {

    char* tok;
    const char* Path = getenv("PATH");
    char* copy = (char*)malloc(strlen(Path) + 1);
    if (copy != NULL)
    {
        strcpy(copy, Path);
        tok = strtok(copy, ":");
										
        while (tok != NULL)
        {
            char* str_tok = tok;
            directory.push_back(str_tok); //stores each directory in a vector with path enviroment variable gotten
            tok = strtok(NULL, ":");
        }
        free(copy);
        copy = NULL;
    }
}

/*
  find(const string& program) 
  finds the directory of the program in the commandline
 */
int Path::find(const string& program) const {
    struct dirp;
    dirent *dp;
    for (unsigned i = 0; i < directory.size(); i++)
    {   DIR* dirp = opendir(directory[i]);
        if ((dirp) != NULL)
        {
            while ((dp = readdir(dirp)) != NULL)
            {
                if (dp->d_name == program)
                {
                    return i;
                }
            }
            closedir(dirp);
        }
    }
    return -1;
}

/*
 getDirectory(int i) 
 */
char* Path::getDirectory(int i) const {
	if (i > directory.size()) {
		throw range_error("Invalid index");
	}
	char* temp_directory = directory[i];
	return temp_directory; //returns the directory found in the index of the vector.
}