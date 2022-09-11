require "dry-container"
require "dry-auto_inject"

# Create container
class MyContainer
  extend Dry::Container::Mixin
end

# TODO: add another services and repository in container
MyContainer.register "create_project_service", -> { Projects::CreateProjectService.new }

AutoInject = Dry::AutoInject(MyContainer)
