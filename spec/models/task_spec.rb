# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  describle  :text             default("")
#  status     :integer          default(0), not null
#  author_id  :integer          not null
#  project_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  delete_at  :datetime
#
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "#statuses_for_list" do
    it { expect(Task.statuses_for_list).to eq({ "selected" => 0, "doing" => 1, "done" => 2, "release" => 3 }) }
  end
end
