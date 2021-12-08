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

# Domain Model

![Domain Model](https://github.com/sabrinalord/bookmark_manager/blob/main/screenshot/model_shows_bookmark_list.png)

# How to set-up the database

1. connect to psql
2. Create database: CREATE DATABASE bookmark_manager;
3. Connect to the database : \c bookmark_manager;
4. run query from file 01_create_bookmarks_table.sql

# How to set-up the test database:

1. connect to psql
2. Create database: CREATE DATABASE bookmark_manager_test;
3. Connect to the database: \c bookmark_manager_test;
4. Run query from file 01_create_bookmarks_table.sql
5. Lool at the spec_helper.rb CUSTOM_ENVIRONEMENT (environement variable needs to be set to test before running the tests)

_SINGLETON TRICK_

The idea of the singleton pattern is that you want a class with only one instance.

We used it to in setup_database_test.rb :
we defined a method #truncate to clean up the database before each test when we run rspec

We then added this method to RSpec's #configure method in the spec_helper.rb
we call the method befor(:each) configuration