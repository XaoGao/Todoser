# == Schema Information
#
# Table name: task_project_marks
#
#  id              :bigint           not null, primary key
#  project_mark_id :bigint           not null
#  task_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe TaskProjectMark, type: :model do

end
