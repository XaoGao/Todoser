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
