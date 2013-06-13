A cool way of using the LDS Scriptures through a standard RESTful interface.

Note: It would be nice to rename the database even better, I'm just not really sure how I want to do that just yet. Afterall, it might just be easier to live out of the schema, but 'id' is a manditory fix.

Current version of the API can be found at: http://scriptures.desh.es/

-------------------------------------

Here's the SQLite to modify the ids to be 'id'

```
alter table lds_scriptures_books rename to tmp_lds_scriptures_books;
CREATE TABLE lds_scriptures_books(
  id INT
, volume_id INT
, book_title VARCHAR(22)
, book_title_jst VARCHAR(27)
, book_title_long VARCHAR(59)
, book_title_short VARCHAR(8)
, book_subtitle VARCHAR(80)
, lds_org VARCHAR(6)
, num_chapters INT
, num_verses INT
);
INSERT INTO lds_scriptures_books(
  id
, volume_id
, book_title 
, book_title_jst 
, book_title_long 
, book_title_short
, book_subtitle 
, lds_org
, num_chapters
, num_verses)
SELECT   
  book_id
, volume_id
, book_title 
, book_title_jst 
, book_title_long 
, book_title_short
, book_subtitle 
, lds_org
, num_chapters
, num_verses
FROM tmp_lds_scriptures_books;
DROP TABLE tmp_lds_scriptures_books;


alter table lds_scriptures_volumes rename to tmp_lds_scripture_volumes;
CREATE TABLE lds_scriptures_volumes(
  id INT
, volume_title VARCHAR(22)
, volume_title_long VARCHAR(26)
, volume_subtitle VARCHAR(36)
, lds_org VARCHAR(4)
, num_chapters INT
, num_verses INT
);
INSERT INTO lds_scriptures_volumes(
  id
, volume_title 
, volume_title_long 
, volume_subtitle 
, lds_org
, num_chapters 
, num_verses )
SELECT   
  volume_id
, volume_title 
, volume_title_long 
, volume_subtitle 
, lds_org
, num_chapters 
, num_verses 
FROM tmp_lds_scripture_volumes;
DROP TABLE tmp_lds_scripture_volumes;


alter table lds_scriptures_verses rename to tmp_lds_scripture_verses;
CREATE TABLE lds_scriptures_verses(
  id INT
, volume_id INT
, book_id INT
, chapter INT
, verse INT
, pilcrow INT
, verse_scripture TEXT
, verse_title VARCHAR(30)
, verse_title_short VARCHAR(14)
);
INSERT INTO lds_scriptures_verses(
  id
, volume_id
, book_id
, chapter
, verse
, pilcrow
, verse_scripture
, verse_title 
, verse_title_short 
)
SELECT   
  verse_id
, volume_id
, book_id
, chapter
, verse
, pilcrow
, verse_scripture
, verse_title 
, verse_title_short 
FROM tmp_lds_scripture_verses;
DROP TABLE tmp_lds_scripture_verses;
```

---------------------------------------------

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.




