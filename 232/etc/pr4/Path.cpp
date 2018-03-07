/* Path.cpp defines the methods for the Path class\
 * by Judy Kwon and DanBe Lee
 *
 *
 */

#include "Path.h"
#include <stdlib.h> //string c_str
#include <vector> //vector

#include <dirent.h> //for reading directory
using namespace std;

vector<string> PathDirectory;

/* Path() - construct a Path from the PATH environment variable, by storing each directory in PATH in a vector<string>
 * use getenv() system call
 */
Path::Path() {

        string thepath = getenv ("PATH");

        while (thepath.length() > 0) {
                PathDirectory.push_back(thepath.substr(0, thepath.find_first_of(":")));

                if (thepath.find_first_of(":") == string::npos) {
                        break;
                } else {
                	thepath.erase(0, thepath.find_first_of(":") +1);
                }
        }
}
/*
 char* apath = getenv ("PATH");
 if (apath != NULL)
 char * p = strtok (apath.c_str(), ":"); //get rid of blanks
 while (p!=0)
  {
    PathDirectory.insert(PathDirectory.end(), p);
    PathDirectory.push_back(p);
    p = strktok (NULL, "\ ");
  }
*/
// printf ("Current path is : %s", apath);


/* int find(const string& program) const
 * return: the index of the directory containing program, or -1 if program is in no directory
 * use opendir() accepts only const char*, readdir(), and closedir() system calls
 * opendir: http://stackoverflow.com/questions/11043999/opening-directory-function
 * http://stackoverflow.com/questions/612097/how-can-i-get-the-list-of-files-in-a-directory-using-c-or-c
 *
 */

int Path::find(const string& program) const {
	struct Dir;
	dirent *DirEntry;

	for (unsigned i = 0; i < PathDirectory.size(); i++) {
		DIR* Dir = opendir(PathDirectory[i].c_str());
		DirEntry = readdir(Dir);
		while ( DirEntry != NULL) {
			if ( DirEntry->d_name == program) {
				return i;
			}

			DirEntry = readdir(Dir);
		}

		closedir(Dir);
		//delete Dir;
	}
	return -1;
}


/* string getDirectory(int i) const
 * return: the name of the directory whose index is i
 *
 */
string Path::getDirectory(int i) const {
        return PathDirectory[i];
}


