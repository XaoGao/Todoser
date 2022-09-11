# == Schema Information
#
# Table name: projects
#
#  id                    :bigint           not null, primary key
#  title                 :string           not null
#  author_id             :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  delete_at             :datetime
#  short_title           :string           default("")
#  status                :integer
#  project_members_count :integer          default(0), not null
#
class ProjectSerializer
  include JSONAPI::Serializer

  attributes :title, :status
  attribute :tasks do |object|
    TaskSerializer.new(object.tasks)
  end
end
