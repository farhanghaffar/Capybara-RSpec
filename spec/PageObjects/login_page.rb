class LoginPage
    include Capybara::DSL
  
    def visit_login_page
      visit '/login'
    end
  
    def login(email, password)
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log In'
    end
  
    def error_message
      find('.error-message').text
    end
end