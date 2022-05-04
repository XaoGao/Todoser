Project.all.each do |project|
  10.times do
    Task.create(
      title: Faker::App.name,
      describle: Faker::Lorem.paragraph,
      status: 0,
      author: User.first,
      project: project
    )
  end
end

10.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "t#{i}@t.com",
    password: "password"
  )
end

