module FeatureHelpers
  def new_session(email: 'test@test.com', password: 'password')
    user = FactoryBot.create(:user, email: email, password: password)
    visit new_user_session_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_on "user_signin_submit"
    #user
  end
end
