/* PlayList.h declares class PlayList.
 * Student Name: Chan Kim (ck45)
 * Date: 02/07/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#ifndef PLAYLIST_H_
#define PLAYLIST_H_

#include "Song.h"
#include <vector>   // STL vector
#include <string>
using namespace std;

class PlayList {
public:
   PlayList(const string& fileName);
   unsigned getNumSongs() const;
   vector<Song> searchByArtist(const string& artist) const;
private:
   vector<Song> mySongs;
};

#endif /*PLAYLIST_H_*/
