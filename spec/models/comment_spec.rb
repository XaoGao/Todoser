# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text             default(""), not null
#  user_id          :bigint           not null
#  commentable_type :string
#  commentable_id   :bigint
#  delete_at        :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  #
end
