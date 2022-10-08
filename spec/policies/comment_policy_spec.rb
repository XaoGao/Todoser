require "rails_helper"

RSpec.describe CommentPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:commentable) { create(:task, project: project) }
  let(:comment) { create(:comment, commentable: commentable) }

  let(:record) { commentable }
  let(:context) { { user: user } }

  describe_rule :create? do
    succeed "when user is member for project" do
      before do
        create(:project_member, user: user, project: project)
      end
    end

    failed "when user is not member for project"
    failed "when record is unknown type" do
      before do
        record = "change type"
      end
    end
  end

  describe_rule :update? do
    let(:record) { comment }

    succeed "when user is member for project" do
      before do
        create(:project_member, user: user, project: project)
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
    let(:record) { comment }

    succeed "when user is member for project" do
      before do
        create(:project_member, user: user, project: project)
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
