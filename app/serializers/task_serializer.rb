class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :status
end
