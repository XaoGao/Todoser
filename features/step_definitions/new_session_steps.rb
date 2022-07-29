Given("I visit on sign in page") do
  FactoryBot.create(:user, email: "test@test.com", password: "password")
  visit new_user_session_path
end

When("I fill email and password and submit form") do
  fill_in "user_email", with: "test@test.com"
  fill_in "user_password", with: "password"
  click_on "user_signin_submit"
end

Then("I should redirect to projects path and see a new session welcome message") do
  expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
end
