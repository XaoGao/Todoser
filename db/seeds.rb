%w[#00d600 #ffde24 #ffb224 #ff5252 #b452ff #24ffff].each do |color|
  Mark.create(color: color)
end

10.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: "t#{i}@t.t",
    password: "password",
    role: User.roles.keys.sample,
    locale: "en",
    delete_at: nil
  )
end

10.times do |i|
  project = Project.create(
    title: Faker::App.name,
    author: User.all.sample,
    short_title: "#{i}-p",
    status: Project.statuses[:active]
  )

  Mark.all.each do |mark|
    ProjectMark.create(project: project, mark: mark)
  end
end

Project.all.each do |project|
  10.times do
    Task.create(
      title: Faker::App.name,
      description: Faker::Lorem.paragraph,
      status: 0,
      author: User.all.sample,
      project: project
    )
  end
end

20.times do |i|
  ProjectMember.create(
    project: Project.all.sample,
    user: User.all.sample
  )
end
