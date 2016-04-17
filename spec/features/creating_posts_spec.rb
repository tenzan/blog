require 'rails_helper'

RSpec.feature 'Users can create new posts' do
  scenario 'with valid attributes' do
    visit '/'
    click_link 'New Post'

    fill_in 'Title', with: 'Sublime Text 3'
    fill_in 'Body', with: 'A text editor for everyone'

    click_button 'Create post'
    expect(page).to have_content 'Post has been created.'
  end
end
