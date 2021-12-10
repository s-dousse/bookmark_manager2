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

# 10) Creating bookmarks

1.	- write Feature Test (Capybara) - adding_bookmarks_spec.rb
		-> add form to view (box to fill in with text and a save button)

	- test is still failing because:
	the user submits the form => GET requet to the same url /bookmarks/new !
		-> need a new route where we save the file!

2. 	- create a POST route: '/bookmarks/saved' (not like walkthrough! but redirects to '/' which redirects to '/bookmarks')
		-> <form action="/bookmarks/saved" method="post">

	- test is still failing because:
	we don't have a way to save the data from the form

	- define the POST route:
		->print the params to check how 'url' is saved

	- pseudo code for how to save the 'url' params in our '/bookmarks/saved' route WITHOUT OUR BOOKMARK.RB CLASS (Model)!
		a) store 'url' as a variable
		b) connect to our test database (like if ENV['ENVIRONEMENT'] = 'test' when we run RSpec)*
		c) insert the new piece of data 'url' in our test database
		using sql : INSERT INTO table_name (column_category) VALUES(data_entry)
		note :data_entry needs to be a string here
		((d) redirect back to '/bookmarks')


	* the logic to choose if connection accesses the 'real' database or 'test' database will be implement in the Model bookmark.rb later

3.	- extract the logic form the Controller and add it to the Model
		-> use the ENV['ENVIRONEMENT'] to decide which databases should be used (are we in test mode or not? very similar to the .all method)

# 11) Wrapping Database Data in Program Objects

1.	in psql we need to update our test and development database to accept ```table``` as a value
			-> ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);
			-> and add it to the 01_create_bookmark_table
			(making sure that the database setup exactly matches our own process, and any errors in the setup process can be easily rolled back)

2. write a feature test (added to viewing_bookmarks as it is just a new value)
		!!! we need the url to be a link ??? -> needs updating we had it as content only

3. add a new field to the view

4. pass new param / field to the controller

5. update test in bookmark.rb





