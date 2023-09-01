require 'capybara/rspec'
require_relative '../PageObjects/dashboard_page.rb'
require_relative '../PageObjects/login_page.rb'

RSpec.shared_context 'logged_in_user' do
    let(:login_page) { LoginPage.new }
    let(:dashboard_page) { DashboardPage.new }
  
    before do
      # Assuming there's a User model with an 'email' and 'password' field
      user = User.create(email: 'john.doe@example.com', password: 'secure_password')
      login_page.visit_login_page
      login_page.login(user.email, user.password)
    end
end