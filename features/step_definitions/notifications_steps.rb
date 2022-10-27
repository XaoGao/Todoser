Given('I am sign in for notifications') do
  user = new_session(email: "test@test.com", password: "password")
  FactoryBot.create_list(:notification, 3, recipient: user)
end

When('I visit the notifications page') do
  visit notifications_path
end

Then('I should see title for all notifications') do
  expect(page).to have_content(I18n.t("notifications.index.title"))
  expect(current_path).to eq(notifications_path)
end
