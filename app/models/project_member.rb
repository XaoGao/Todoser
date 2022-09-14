# == Schema Information
#
# Table name: project_members
#
#  id         :bigint           not null, primary key
#  project_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ProjectMember < ApplicationRecord
  belongs_to :project, counter_cache: true
  belongs_to :user, class_name: 'User'
end
