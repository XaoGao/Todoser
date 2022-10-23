Given('I am sign in for show project') do
  user = new_session(email: "test@test.com", password: "password")
  @project = FactoryBot.create(:project, author: user)
  FactoryBot.create(:project_member, user: user, project: @project)
  visit new_user_session_path
end

When('I visit the project show page') do
  page.find("#project_#{@project.id}").find('a', text: @project.title).click
end

Then('I should see project title') do
  expect(page).to have_content(@project.title)
  expect(current_path).to eq(project_path(@project))
end
