class MembersSerializer
  include JSONAPI::Serializer

  attribute :text do |object|
    object.full_name
  end

  attribute :link do |object|
    "users/#{object.id}"
  end
end
