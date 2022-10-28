# == Schema Information
#
# Table name: notifications
#
#  id           :bigint           not null, primary key
#  sender_id    :bigint           not null
#  recipient_id :bigint           not null
#  body         :string           default(""), not null
#  read_at      :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class NotificationSerializer
  include JSONAPI::Serializer
  # include Rails.application.routes.url_helpers

  attribute :text do |object|
    object.body.truncate(25)
  end

  attribute :link do |object|
    "notifications/#{object.id}"
    # url_for(controller: "notifications",
    #         action: "show",
    #         id: object.id,
    #         only_path: true)
  end
end
