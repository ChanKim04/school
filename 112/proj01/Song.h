/* Song.h declares a class for storing song information.
 * Student Name: Chan Kim (ck45)
 * Date: 2/13/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#ifndef SONG_H
#define SONG_H

#include <string>
using namespace std;

class Song {
public:
    Song();
    Song(const string& title, const string& artist, unsigned year);

    string getTitle() const;
    string getArtist() const;
    unsigned getYear() const;
    void readFrom(istream& in);
    void writeTo(ostream& out) const;
    bool operator==(const Song& song2) const;

private:
   string   myTitle;
   string   myArtist;
   unsigned myYear;
};

#endif /*SONG_H_*/
