require "dry-container"
require "dry-auto_inject"

# Create container
class MyContainer
  extend Dry::Container::Mixin
end

# TODO: add another services and repository in container

MyContainer.register "task_move_repository", -> { Tasks::MoveRepository.new }
MyContainer.register "task_favorite_repository", -> { Tasks::TaskFavoriteRepository.new }
MyContainer.register "tasks_repository", -> { Tasks::TasksRepository.new }

MyContainer.register "projects_repository", -> { Projects::ProjectsRepository.new }

MyContainer.register "users_repository", -> { Users::UsersRepository.new }

MyContainer.register "notifications_repository", -> { Notifications::CachedNotificationsRepository.new(Notifications::NotificationsRepository.new) }

MyContainer.register "project_marks_repository", -> { ProjectMarks::ProjectMarksRepository.new }

MyContainer.register "jobs_repository", -> { Jobs::JobsRepository.new }

MyContainer.register "jobs_all_service", -> { Jobs::JobsAllService.new }
MyContainer.register "jobs_toggle_service", -> { Jobs::JobsToggleService.new }
MyContainer.register "jobs_launch_service", -> { Jobs::JobsLaunchService.new }

MyContainer.register "task_move_service", -> { Tasks::MoveService.new }

MyContainer.register "create_project_service", -> { Projects::CreateProjectService.new }

MyContainer.register "create_project_member_service", -> { ProjectMembers::CreateProjectMemberService.new }

MyContainer.register "edit_title_project_mark_service", -> { ProjectMarks::EditTitleProjectMarkService.new }

MyContainer.register "notification_last_service", -> { Notifications::NotificationLastService.new }

MyContainer.register "invitation_create_service", -> { Invitations::InvitationCreateService.new }
MyContainer.register "invitation_confirm_service", -> { Invitations::InvitationConfirmService.new }

AutoInject = Dry::AutoInject(MyContainer)
