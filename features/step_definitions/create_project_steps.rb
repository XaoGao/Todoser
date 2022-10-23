Given('I am sign and visit create a project') do
  @user = new_session(email: "test@test.com", password: "password")
  visit new_project_path
end

When('I fill all field and submit create project path') do
  fill_in "project_title", with: "some a new project"
  fill_in "project_short_title", with: "a-n-p"
  click_on "submit"
end

Then('I should see a created project') do
  expect(page).to have_content("some a new project")
  expect(current_path).to eq(project_path(Project.first))
end
