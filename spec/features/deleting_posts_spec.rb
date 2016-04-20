require 'rails_helper'

RSpec.feature 'Users can delete posts' do
  scenario do
    FactoryGirl.create(:post,
                       title: 'Test post',
                       body: 'Content for test post')

    visit '/'
    click_link 'Test post'
    click_link 'Delete'

    expect(page).to have_content 'Post has been deleted.'
    expect(page.current_url).to eq posts_url
    expect(page).not_to have_content 'Test post'
  end
end
