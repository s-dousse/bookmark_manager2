feature 'Deleting a new bookmark' do
  scenario 'A user can delete a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://example.org')
    fill_in('title', with: 'Example')
    click_button('Submit')
    visit('bookmarks/update')
    fill_in('title', with: 'Example')
    fill_in('new_title', with: 'Better example')
    fill_in('url', with: 'www.example.com')
    click_button('Submit')
    expect(page).to have_content('www.example.com').once
  end
end