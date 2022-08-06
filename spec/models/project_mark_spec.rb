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
  describe ".present_title" do
    let(:project_mark_with_title) { create(:project_mark, title: "example") }
    let(:project_mark_without_title) { create(:project_mark, title: nil) }

    it "title is present" do
      expect(project_mark_with_title.present_title).to eq("Example")
    end

    it "title is empty" do
      expect(project_mark_without_title.present_title).to eq("-")
    end
  end
end
