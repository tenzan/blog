require 'rails_helper'

RSpec.feature 'Users can view posts' do
  scenario 'with post content' do
    post = FactoryGirl.create(:post,
                              title: 'Test post',
                              body: 'Content for test post')

    visit '/'
    click_link 'Test post'
    expect(page.current_url).to eq post_url(post)
  end
end
