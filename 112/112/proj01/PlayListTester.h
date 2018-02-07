/* PlayListTester.h tests the PlayList class.
 * Student Name: Chan Kim (ck45)
 * Date: 2/13/2017
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#ifndef PLAYLISTTESTER_
#define PLAYLISTTESTER_

class PlayListTester {
public:
    void runTests();
    void testConstructors();
    void testSearchByArtist();
    void testSearchByYear();
    void testSearchByTitlePhrase();
    void testAddSong();
    void testRemoveSong();
    void testSave() const;
};

#endif /*PLAYLISTTESTER_*/
