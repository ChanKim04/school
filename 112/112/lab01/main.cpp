/* main.cpp tests the classes in our project.
 * Student Name: Chan Kim (ck45)
 * Date: 02/07/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#include "SongTester.h"
#include "PlayListTester.h"

int main() {
    SongTester sTester;
    sTester.runTests();
    PlayListTester plTester;
    plTester.runTests();
}
