require 'spec_helper'
require_relative '../sharedContext/shared_context'

RSpec.describe 'ten-build', type: :feature do
  include_context 'logged_in_user'

  it 'verify the user dashboard is visible' do
    visit '/dashboard'
    expect(page).to have_content('Welcome, John Doe!')
    expect(page).to have_css('.user-avatar')
  end

  it 'verify users are to create a new post' do
    visit '/dashboard'
    click_link 'New Post'
    fill_in 'Title', with: 'My First Post'
    fill_in 'Content', with: 'This is my first post on MyApp!'
    click_button 'Create Post'
    expect(page).to have_content('Post created successfully!')
    expect(page).to have_content('My First Post')
  end

  it 'verify invalid login shows validation message' do
    visit '/login'
    fill_in 'Email', with: 'invalidemail@example.com'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log In'
    expect(page).to have_content('Invalid email or password. Please try again.')
  end
end