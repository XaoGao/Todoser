Given("I am on the homepage") do
  visit root_path
end

Then("I see a welcome message") do
  expect(page).to have_content(I18n.t("welcome.index.title"))
end
