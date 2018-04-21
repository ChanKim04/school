/* PlayList.cpp defines the PlayList methods.
 * Student Name: Chan Kim (ck45)
 * Date: 2/13/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#include "PlayList.h"
#include <fstream>      // ifstream
#include <cassert>      // assert()
#include <iostream>
using namespace std;

/* PlayList constructor
 * @param: fileName, a string
 * Precondition: fileName contains the name of a playlist file.
 */
PlayList::PlayList(const string& fileName) {
	// open a stream to the playlist file
	   ifstream fin( fileName.c_str() );
	   assert( fin.is_open() );

	   // read each song and append it to mySongs
	   Song s;
	   while (true) {
	       s.readFrom(fin);
	       if ( !fin ) { break; }
	       string separator;
	       getline(fin, separator);
	       mySongs.push_back(s);
	   }

	   // close the stream
	   fin.close();

}

/* Retrieve length of the playlist
 * Return: the number of songs in the playlist.
 */
unsigned PlayList::getNumSongs() const {
	return mySongs.size();
}

/* Search by artist
 * @param: artist, a string.
 * Return: a vector containing all the Songs in mySongs by artist.
 */
vector<Song> PlayList::searchByArtist(const string& artist) const {
   vector<Song> v;

   for (unsigned i = 0; i < mySongs.size(); i++) {
      if ( mySongs[i].getArtist().find(artist) != string::npos ) {
         v.push_back( mySongs[i] );
      }
   }

   return v;
}
/* Search by year
 * @param: year, an integer.
 * Return: a vector containing all the Songs in mySongs by year.
 */
vector<Song> PlayList::searchByYear(int year) const {
   vector<Song> v;
   for (unsigned i = 0; i < mySongs.size(); i++) {
      if ( mySongs[i].getYear() == year ) {
         v.push_back( mySongs[i] );
      }
   }

   return v;
}
/* Search by title phrase
 * @param: phrase, a string.
 * Return: a vector containing all the Songs in mySongs by title phrase.
 */
vector<Song> PlayList::searchByTitlePhrase(const string& phrase) const {
   vector<Song> v;

   for (unsigned i = 0; i < mySongs.size(); i++) {
      if ( mySongs[i].getTitle().find(phrase) != string::npos ) {
         v.push_back( mySongs[i] );
      }
   }

   return v;
}
/* add a new song
 * @param: newSong, Song.
 * Precondition: newSong contains the component of a Song, title, artist and year.
 */
void PlayList::addSong(const Song& newSong) {
	mySongs.push_back(newSong);
}
/* remove a song
 * @param: aSong, Song.
 * Precondition: aSong contains the component of a Song, title, artist and year.
 */
void PlayList::removeSong(const Song& aSong) {
	vector<Song>::iterator i = mySongs.begin();
	while( i != mySongs.end()){
		if (i -> getTitle() ==aSong.getTitle()) {
			i = mySongs.erase(i);
		}
		else {
				++i;
		}
	}
}
/*save play list
 */
void PlayList::save() const{
	ofstream fout("SongPlayList.txt");
	for (unsigned i = 0; i < mySongs.size(); i++) {
		mySongs[i].writeTo(fout);
		fout << '\n';
	}
	fout.close();
}
