require 'rails_helper'

RSpec.feature 'Users can create new posts' do
  before do
    visit '/'
    click_link 'New Post'
  end

  scenario 'with valid attributes' do

    fill_in 'Title', with: 'Sublime Text 3'
    fill_in 'Body', with: 'A text editor for everyone'

    click_button 'Create post'
    expect(page).to have_content 'Post has been created.'
  end

  scenario 'when title is empty' do

    fill_in 'Body', with: 'A text editor for everyone'

    click_button 'Create post'

    expect(page).to have_content 'Post has not been created.'
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'when title is empty' do

    fill_in 'Title', with: 'Sublime Text 3'

    click_button 'Create post'

    expect(page).to have_content 'Post has not been created.'
    expect(page).to have_content "Body can't be blank"
  end

end
