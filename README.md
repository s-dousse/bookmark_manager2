# Bookmark Manager

## Specifications

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users are restricted to manage only their own bookmarks

## User Stories

- As a user, so I can quickly visit a website, I would like to see a list of bookmarks
- As a user, because I'm always finding new websites, I would like to add new bookmarks
- As a user, so I can remove sites I'm no longer interested in, I would like to remove bookmarks.
- As a user, so I can keep my bookmarks organised, I would like to tag my bookmarks into categories.
- As a user, so I can quickly find the websites I want, I would like to filter my bookmarks by category
- As a user, so I can stop other people from deleting my bookmarks, I would like to be the only one who can manage my bookmarks.

## Domain Model

# ![Domain Model](https://github.com/sabrinalord/bookmark_manager/blob/main/screenshot/model_shows_bookmark_list.png)

SETUP FOR DATABASE :

CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
