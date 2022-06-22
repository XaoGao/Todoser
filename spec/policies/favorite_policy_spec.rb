require "rails_helper"
require "action_policy/rspec/dsl"

RSpec.describe FavoritePolicy, type: :policy do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  let(:record) { create(:task, author: user, project: project) }
  let(:context) { { user: user } }

  describe_rule :create? do
    succeed "when user is member for project" do
      before do
        create(:project_member, user: user, project: project)
        create(:favorite, user: user, favoriteable: record)
      end
    end

    failed "when user is not member for project"
    failed "when record is unknown type" do
      before do
        record = "change type"
      end
    end
  end

  describe_rule :destroy? do
    succeed "when user is member for project" do
      before do
        create(:project_member, user: user, project: project)
        create(:favorite, user: user, favoriteable: record)
      end
    end

    failed "when user is not member for project"
    failed "when record is unknown type" do
      before do
        record = "change type"
      end
    end
  end
end
