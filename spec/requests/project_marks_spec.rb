require 'rails_helper'

RSpec.describe "ProjectMarks", type: :request do
  describe "PUT project/marks" do
    let(:project) { create(:project) }

    context "when user is signed in" do
      let(:user) { create(:user) }
      let(:mark) { create(:mark) }
      let!(:project_mark) { create(:project_mark, project: project, mark: mark, title: "") }
      let!(:project_member) { create(:project_member, project: project, user: user) }

      before do
        sign_in user
        put project_marks_path(project), params: { project_id: project.id, mark_id: mark.id, title: "some message" }
      end

      it "return success status" do
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is not signed in" do
      before do
        put project_marks_path(project)
      end

      it "redirect status" do
        expect(response).to have_http_status(:redirect)
      end

      it "redirect to sign in page" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
