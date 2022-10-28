require "dry-container"
require "dry-auto_inject"

# Create container
class MyContainer
  extend Dry::Container::Mixin
end

# TODO: add another services and repository in container

MyContainer.register "task_move_repository", -> { Tasks::MoveRepository.new }
MyContainer.register "task_favorite_repository", -> { Tasks::TaskFavoriteRepository.new }

MyContainer.register "notifications_repository", -> { Notifications::NotificationsRepository.new }

MyContainer.register "task_move_service", -> { Tasks::MoveService.new }

MyContainer.register "create_project_service", -> { Projects::CreateProjectService.new }

MyContainer.register "notification_last_service", -> { Notifications::NotificationLastService.new }

MyContainer.register "invitation_create_service", -> { Invitations::InvitationCreateService.new }
MyContainer.register "invitation_confirm_service", -> { Invitations::InvitationConfirmService.new }

AutoInject = Dry::AutoInject(MyContainer)
