# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  delete_at   :datetime
#  description :text             default("")
#  short_title :string           default("")
#  status      :integer
#
require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:owner) { create(:user) }
  let(:project) { create(:project, author: owner) }

  describe ".member_to_select" do
    let(:first_user) { create(:user) }
    let(:second_user) { create(:user) }

    it "return user who member for project" do
      create(:project_member, user: first_user, project: project)
      create(:project_member, user: owner, project: project)

      expect(project.members.count).to eq(2)
    end
  end
end
