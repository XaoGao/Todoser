Given("I am on registration page") do
  visit new_user_registration_path
end

When("I fill all fields and submit form") do
  fill_in "user_email_registration",	with: "test@test.com"
  fill_in "user_username_registration",	with: "test_username"
  fill_in "user_first_name_registration",	with: "test_first_name"
  fill_in "user_last_name_registration",	with: "test_last_name"
  fill_in "user_password_registration",	with: "password"
  fill_in "user_password_confirmation_registration",	with: "password"
  click_on "submit_registration"
end

Then("I see a welcome message for new user") do
  expect(page).to have_content(I18n.t("devise.registrations.signed_up"))
end
