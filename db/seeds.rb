10.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "t#{i}@t.com",
    password: "password"
  )
end


Project.all.each do |project|
  10.times do
    Task.create(
      title: Faker::App.name,
      description: Faker::Lorem.paragraph,
      status: 0,
      author: User.first,
      project: project
    )
  end
end

Project.all.each do |project|
  project.tasks.statuses.each do |key, _|
    project.tasks.send(key).each_with_index do |task, index|
      task.update(position: index + 1)
    end
  end
end

