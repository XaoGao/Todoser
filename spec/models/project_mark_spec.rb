# == Schema Information
#
# Table name: project_marks
#
#  id         :bigint           not null, primary key
#  mark_id    :bigint           not null
#  project_id :bigint           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ProjectMark, type: :model do

end
