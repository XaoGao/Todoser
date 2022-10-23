require "dry-container"
require "dry-auto_inject"

# Create container
class MyContainer
  extend Dry::Container::Mixin
end

# TODO: add another services and repository in container
MyContainer.register "create_project_service", -> { Projects::CreateProjectService.new }
MyContainer.register "task_move_service", -> { Tasks::MoveService.new }
MyContainer.register "task_move_repository", -> { Tasks::MoveRepository.new }
MyContainer.register "invitation_create_service", -> { Invitations::InvitationCreateService.new }
MyContainer.register "invitation_confirm_service", -> { Invitations::InvitationConfirmService.new }

AutoInject = Dry::AutoInject(MyContainer)
