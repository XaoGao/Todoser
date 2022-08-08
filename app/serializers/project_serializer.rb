class ProjectSerializer
  include JSONAPI::Serializer

  attributes :title, :status
  attribute :tasks do |object|
    TaskSerializer.new(object.tasks)
  end
end
