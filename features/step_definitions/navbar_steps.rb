Given("I visit welcome page for about us") do
  visit root_path
end

When("I click on a link about us") do
  click_on I18n.t("layouts.navbar.about_us")
end

Then("I should see a about us title") do
  expect(page).to have_content(I18n.t("layouts.navbar.about_us"))
end

Given("I visit welcome page for contacts") do
  visit root_path
end
#
When("I click on a link contacts") do
  click_on I18n.t("layouts.navbar.contacts")
end

Then("I should see a contacts title") do
  expect(page).to have_content(I18n.t("layouts.navbar.contacts"))
end

Given("I visit welcome page for dashboard") do
  user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  visit new_user_session_path
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  click_on "user_signin_submit"
end
#
When("I click on a link my dashboard") do
  click_on  I18n.t("layouts.navbar.dashboard")
end

Then("I should see a dashboard title") do
  expect(page).to have_content(I18n.t("layouts.navbar.dashboard"))
end

Given("I visit welcome page for favorites") do
  user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  visit new_user_session_path
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  click_on "user_signin_submit"
end
#
When("I click on a link favorites") do
  click_on I18n.t("layouts.navbar.favorites")
end

Then("I should see a favorites title") do
  expect(page).to have_content(I18n.t("layouts.navbar.favorites"))
end
