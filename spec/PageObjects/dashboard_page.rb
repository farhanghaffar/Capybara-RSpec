class DashboardPage
    include Capybara::DSL
  
    def visit_dashboard
      visit '/dashboard'
    end
  
    def welcome_message
      find('.welcome-message').text
    end
  
    def has_user_avatar?
      has_css?('.user-avatar')
    end
  
    def click_new_post_link
      click_link 'New Post'
    end
  
    def create_post(title, content)
      fill_in 'Title', with: title
      fill_in 'Content', with: content
      click_button 'Create Post'
    end
  
    def post_created_message
      find('.success-message').text
    end
  
    def has_post?(title)
      has_content?(title)
    end
end