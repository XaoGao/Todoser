Given("I am on registration page") do
  visit new_user_registration_path
end

When("I fill all fields and submit form") do
  fill_in "user_email",	with: "test@test.com"
  fill_in "user_username",	with: "test_username"
  fill_in "user_first_name",	with: "test_first_name"
  fill_in "user_last_name",	with: "test_last_name"
  fill_in "user_password",	with: "password"
  fill_in "user_password_confirmation",	with: "password"
  click_on "user_registration_submit"
end

Then("I see a welcome message for new user") do
  expect(page).to have_content(I18n.t("devise.registrations.signed_up"))
end
