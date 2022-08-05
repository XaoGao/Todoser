Given("I logged in and visit my page") do
  visit root_path
end

When('I click on navbar href') do
  click_on "About us"
end

Then('I see a page message') do
  expect(page).to have_content("Pangu and the creation of the world")
end
