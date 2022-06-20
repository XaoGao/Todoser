# == Schema Information
#
# Table name: favorites
#
#  id                :bigint           not null, primary key
#  user_id           :bigint           not null
#  favoriteable_type :string
#  favoriteable_id   :bigint
#  delete_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Favorite, type: :model do
  
end
