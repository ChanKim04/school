/* main.cpp tests the classes in our project.
 * Student Name: Chan Kim (ck45)
 * Date: 2/13/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#include "SongTester.h"
#include "PlayListTester.h"
#include "PlayList.h"
#include <iostream>
using namespace std;

int main() {
    SongTester sTester;
//    sTester.runTests();
    PlayListTester plTester;
//    plTester.runTests();
	PlayList pl("SongPlayList.txt");
	cout <<"Welcome to the PlayList Manager!\n\n"<<endl;
	while (true) {

    	cout << "Please enter:\n"
    			"\t1 - to search the playlist for songs by a given artist\n"
    			"\t2 - to search the playlist for songs from a given year\n"
    			"\t3 - to search the playlist for songs with a given phrase in their title\n"
    			"\t4 - to add a new song to the playlist\n"
    			"\t5 - to remove a song from the playlist\n"
    			"\t// ... other options ...\n"
    			"\t0 - to quit\n"
    			"--->";
		int num;
		cin >> num;
		if (num == 1) {
			string artist;
			cout << "Please enter an Artist's name: " << flush;
			cin >> artist;
			vector<Song> v1 = pl.searchByArtist(artist);
			for (unsigned i = 0; i < v1.size(); i++) {
				cout << v1[i].getTitle() << '\n' << v1[i].getArtist() << '\n' << v1[i].getYear() << '\n' << endl;
			}
		} else if (num == 2) {
			double year;
			cout << "Please enter the year: " << endl;
			cin >> year;
			vector<Song> v1 = pl.searchByYear(year);
			for (unsigned i = 0; i < v1.size(); i++) {
				cout << v1[i].getTitle() << '\n' << v1[i].getArtist() << '\n' << v1[i].getYear() << '\n' << endl;
			}
		} else if (num == 3) {
			string phrase;
			cout << "Please enter a phrase from the title of the Song: "
					<< endl;
			cin >> phrase;
			vector<Song> v1 = pl.searchByTitlePhrase(phrase);
			for (unsigned i = 0; i < v1.size(); i++) {
				cout << v1[i].getTitle() << '\n' << v1[i].getArtist() << '\n' << v1[i].getYear() << '\n' << endl;
			}
		} else if (num == 4) {
			string title;
			string artist;
			double year;
			cin.ignore(256, '\n');
			cout << "Please enter title: " << endl;
			cin >> title;
			cout << "Please enter artist: " << endl;
			cin.ignore(256, '\n');
			cin >> artist;
			cout << "Please enter year: " << endl;
			cin >> year;
			cin.ignore(256, '\n');
			pl.addSong(Song(title, artist, year));
			string save;
				cout << "If you want to save, enter 'Y' or 'y'\n--->";
				cin >> save;
				if ((save == "Y") or (save == "y")) {
					pl.save();
					cout << "saved" << endl;
				}
		} else if (num == 5) {
			string title;
			string artist;
			double year;
			cout << "Please enter title to remove: " << endl;
			cin.ignore(256, '\n');
			cin >> title;
			cout << "Please enter artist to remove: " << endl;
			cin.ignore(256, '\n');
			cin >> artist;
			cout << "Please enter year to remove: " << endl;
			cin.ignore(256, '\n');
			cin >> year;
			pl.removeSong(Song(title, artist, year));
			string save;
				cout << "If you want to save, enter 'Y' or 'y'\n--->";
				cin >> save;
				if ((save == "Y") or (save == "y")) {
					pl.save();
					cout << "saved" << endl;
				}
		} else if (num == 0) {
			cout << "End" << endl;
			break;
		}

	}

}
