Given('I visit my page') do
  visit root_path
end

When('I click on navbar href about us') do
  click_on "About us"
end

Then('I see a page message') do
  expect(page).to have_content("Pangu and the creation of the world")
end

Given('I visit root page') do
  visit root_path
end
#
When('I click on navbar href contacts') do
  click_on "Contacts"
end

Then('I see a page') do
  expect(page).to have_content("BRAAIIINS Ipsum")
end

Given('I visit on dashboard page') do
  user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  visit new_user_session_path
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  click_on "user_signin_submit"
end
#
When('I click on navbar href my dashboard') do
  click_on "My dashboard"
end

Then('I see a message') do
  expect(page).to have_content("Dashboard")
end

Given('I visit on favorite page') do
  user = FactoryBot.create(:user, email: 'test@test.com', password: 'password')
  visit new_user_session_path
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  click_on "user_signin_submit"
end
#
When('I click on navbar href favorites') do
  click_on "Favorites"
end

Then('I see a favorite message') do
  expect(page).to have_content("Favorites")
end
