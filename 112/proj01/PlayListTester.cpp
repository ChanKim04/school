/* PlayListTester.cpp defines the PlayList test-methods.
 * Student Name: Chan Kim (ck45)
 * Date: 2/13/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#include "PlayListTester.h"
#include "PlayList.h"
#include <iostream>
#include <cassert>
using namespace std;

void PlayListTester::runTests() {
   cout << "\nTesting class PlayList..." << endl;
   testConstructors();
   testSearchByArtist();
   testSearchByYear();
   testSearchByTitlePhrase();
   testAddSong();
   testRemoveSong();
   testSave();
   cout << "All tests passed!" << endl;
}

void PlayListTester::testConstructors() {
   cout << "- constructors..." << flush;
   PlayList pList("testSongs.txt");
   assert( pList.getNumSongs() == 4 );
   cout << " 0 " << flush;

   cout << " Passed!" << endl;
}

void PlayListTester::testSearchByArtist() {
   cout << "- searchByArtist()... " << flush;
   // load a playlist with test songs
   PlayList pList("testSongs.txt");

   // empty case (0)
   vector<Song> searchResult = pList.searchByArtist("Cream");
   assert( searchResult.size() == 0 );
   cout << " 0 " << flush;

   // case of 1
   searchResult = pList.searchByArtist("Baez");
   assert( searchResult.size() == 1 );
   assert( searchResult[0].getTitle() == "Let It Be" );
   cout << " 1 " << flush;

   // case of 2
   searchResult = pList.searchByArtist("Beatles");
   assert( searchResult.size() == 2 );
   assert( searchResult[0].getTitle() == "Let It Be" );
   assert( searchResult[1].getTitle() == "Penny Lane" );
   cout << " 2 " << flush;

   cout << " Passed!" << endl;
}

void PlayListTester::testSearchByYear() {
   cout << "- searchByYear()... " << flush;
   // load a playlist with test songs
   PlayList pList("testSongs.txt");

   // empty case (0)
   vector<Song> searchResult = pList.searchByYear(2015);
   assert( searchResult.size() == 0 );
   cout << " 0 " << flush;

   // case of 1
   searchResult = pList.searchByYear(2012);
   assert( searchResult.size() == 1 );
   assert( searchResult[0].getTitle() == "Call Me Maybe" );
   cout << " 1 " << flush;

   // case of 2
   searchResult = pList.searchByYear(1967);
   assert( searchResult.size() == 2 );
   assert( searchResult[0].getTitle() == "Let It Be" );
   assert( searchResult[1].getTitle() == "Penny Lane" );
   cout << " 2 " << flush;

   cout << " Passed!" << endl;
}

void PlayListTester::testSearchByTitlePhrase() {
   cout << "- searchByTitlePhrase()... " << flush;
   // load a playlist with test songs
   PlayList pList("testSongs.txt");

   // empty case (0)
   vector<Song> searchResult = pList.searchByTitlePhrase("Go");
   assert( searchResult.size() == 0 );
   cout << " 0 " << flush;

   // case of 1
   searchResult = pList.searchByTitlePhrase("Me");
   assert( searchResult.size() == 1 );
   assert( searchResult[0].getTitle() == "Call Me Maybe" );
   cout << " 1 " << flush;

   // case of 2
   searchResult = pList.searchByTitlePhrase("It");
   assert( searchResult.size() == 2 );
   assert( searchResult[0].getTitle() == "Let It Be" );
   assert( searchResult[1].getTitle() == "Let It Be" );
   cout << " 2 " << flush;

   cout << " Passed!" << endl;
}

void PlayListTester::testAddSong() {
	   cout << "- addSong()... " << flush;
	   // load a playlist with test songs
	   PlayList pList("testSongs.txt");
	   // case of 0
	   Song s1("Badge", "Cream", 1969);
	   pList.addSong(s1);
	   assert( pList.getNumSongs() == 5 );
	   vector<Song> searchResult = pList.searchByTitlePhrase("Badge");
	   cout << " 0 " << flush;
	   // case of 1
	   Song s2("Godzilla", "Blue Oyster Cult", 1977);
	   pList.addSong(s2);
	   assert( pList.getNumSongs() == 6 );
	   searchResult = pList.searchByArtist("Blue Oyster Cult");
	   cout << " 1 " << flush;
	   // case of 2
	   Song s3("Behind Blue Eyes", "The Who", 1971);
	   pList.addSong(s3);
	   assert( pList.getNumSongs() == 7 );
	   searchResult = pList.searchByYear(1971);
	   cout << " 2 " << flush;
	   cout << " Passed!" << endl;
}

void PlayListTester::testRemoveSong() {
	   cout << "- removeSong()... " << flush;
	   // load a playlist with test songs
	   PlayList pList("testSongs.txt");
	   // add newSongs to test the remove function
	   Song s1("Badge", "Cream", 1969);
	   Song s2("Godzilla", "Blue Oyster Cult", 1977);
	   Song s3("Behind Blue Eyes", "The Who", 1971);
	   pList.addSong(s1);
	   pList.addSong(s2);
	   pList.addSong(s3);
	   assert( pList.getNumSongs() == 7 );
	   // case of 0
	   pList.removeSong(s1);
	   assert( pList.getNumSongs() == 6 );
	   cout << " 0 " << flush;
	   // case of 1
	   pList.removeSong(s2);
  	   assert( pList.getNumSongs() == 5 );
	   cout << " 1 " << flush;
	   // case of 2
	   pList.removeSong(s3);
   	   assert( pList.getNumSongs() == 4 );
   	   cout << " 2 " << flush;
	   cout << " Passed!" << endl;
}

void PlayListTester::testSave() const {
	cout << "- Save()... " << flush;
	 // load a playlist with test songs
	PlayList pList("testSongs.txt");
	// case of 0: add a newSong and save
	Song s1("Wayfaring Stranger", "John Scofield", 2016);
	pList.addSong(s1);
	pList.save();
	vector<Song> searchResult = pList.searchByTitlePhrase("Wayfaring Stranger");
	assert( pList.getNumSongs() == 5);
	assert( searchResult[0].getArtist() == "John Scofield" );
	assert( searchResult[0].getYear() == 2016 );
	cout << " 0 " << flush;
	// case of 1: remove the newSong and save
	pList.removeSong(s1);
	pList.save();
	assert( pList.getNumSongs() == 4);
	cout << " 1 " << flush;
	cout << " Passed!" << endl;
}
