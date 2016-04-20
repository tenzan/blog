require 'rails_helper'

RSpec.feature 'Users can edit existing posts' do
  before do
    FactoryGirl.create(:post,
                       title: 'Test post',
                       body: 'Content for test post')

    visit '/'
    click_link 'Test post'
    click_link 'Edit'
  end

  scenario 'with valid attributes' do

    fill_in 'Title', with: 'Updated title'
    fill_in 'Body', with: 'Updated body'
    click_button 'Update post'

    expect(page).to have_content 'Post has been updated.  '
    expect(page).to have_content 'Updated title'
    expect(page).to have_content 'Updated body'
  end

  scenario 'when providing with empty title' do

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Updated body'
    click_button 'Update post'

    expect(page).to have_content "Post has not been updated."
  end

  scenario 'when providing with empty body' do

    fill_in 'Title', with: 'Updated Body'
    fill_in 'Body', with: ''
    click_button 'Update post'

    expect(page).to have_content "Post has not been updated."
  end

end
