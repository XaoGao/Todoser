require 'rails_helper'

RSpec.describe "ProjectMembers", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }

  describe "DELETE project/{project_id}/project_members/{id}" do

    context "user is sign in" do
      let(:project_member) { create(:project_member, user: user, project: project) }
      before do
        sign_in user
      end

      it "returns http redirect" do
        delete project_project_member_path(project, project_member)
        expect(response).to have_http_status(:redirect)
      end

      it "destroy a project_member" do
        project_member
        expect{delete project_project_member_path(project, project_member)}.to change(ProjectMember, :count).by(-1)
      end
    end
  end
end
