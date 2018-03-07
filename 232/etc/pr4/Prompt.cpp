/* Prompt.cpp contains the definition for the Prompt class

 * By : Judy Kwon
 * By : DanBe Lee
 * for CS232
 */


#include "Prompt.h"
#include <unistd.h>
#include <string>

string promptLine;

/* a constructor that builds a Prompt as the full path to the working directory
 * use getcwd() - https://www.daniweb.com/programming/software-development/threads/104069/how-to-get-the-current-working-directory user Jonny D
                                                                        http://www.dreamincode.net/forums/topic/102131-getcwd-help-please/
 *
 */
Prompt::Prompt() {
/*
	char* buffer;
	char* cl;
	cl = char *getcwd(buffer);
	promptLine.append("/$");
*/
	char* path = NULL;
	size_t size;
	char* comm = getcwd(path,size);
	promptLine.assign(comm);
	promptLine.append("/$");
}

/* get() is an accessor that returns the current value of the Prompt
 *
 */
string Prompt::get() const {
	return promptLine;}

