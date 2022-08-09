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

Given('I can click a navbar href my dashboard') do
  new_session
  visit root_path
end
#
When('I click on navbar href my dashboard') do
  click_on "My dashboard"
end

Then('I see a message') do
  expect(page).to have_content("BRAAIIINS Ipsum")
end
