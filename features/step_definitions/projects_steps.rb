Given('I am sign in for projects') do
  user = new_session(email: "test@test.com", password: "password")
  @project_1 = FactoryBot.create(:project, author: user)
  @project_2 = FactoryBot.create(:project, author: user)
  FactoryBot.create(:project_member, user: user, project: @project_1)
  FactoryBot.create(:project_member, user: user, project: @project_2)
  visit new_user_session_path
end

When('I visit the projects page') do
  visit projects_path
end

Then('I should see title for all projects') do
  expect(page).to have_content(@project_1.title)
  expect(page).to have_content(@project_2.title)
  expect(current_path).to eq(projects_path)
end
