# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string           default(""), not null
#  describle   :text             default("")
#  status      :integer          default("selected"), not null
#  author_id   :integer          not null
#  project_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  delete_at   :datetime
#  position    :integer          default(0), not null
#  priority    :integer          default("lowest"), not null
#  executor_id :integer
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  
end
