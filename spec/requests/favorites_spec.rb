require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  describe "GET /favorites" do
    context "user is sign in" do
      let(:user) { create(:user) }
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        get favorites_path
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        get favorites_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST /favorites/" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project) }
      let!(:project_member) { create(:project_member, user: user, project: project) }
      let(:task) { create(:task, project: project) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        post favorites_path, params: { favoriteable_type: task.class, favoriteable_id: task.id }
        expect(response).to have_http_status(:success)
      end

      it "create a new project" do
        post favorites_path, params: { favoriteable_type: task.class, favoriteable_id: task.id }
        expect(Favorite.first.favoriteable).to eq(task)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        post favorites_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "DELETE /projects/{project_id}" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project) }
      let!(:project_member) { create(:project_member, user: user, project: project) }
      let(:task) { create(:task, project: project) }
      let!(:favorite) { create(:favorite, user: user, favoriteable: task) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        delete favorites_path, params: { favoriteable_type: task.class, favoriteable_id: task.id }
        expect(response).to have_http_status(:success)
      end

      it "create a new project" do
        delete favorites_path, params: { favoriteable_type: task.class, favoriteable_id: task.id }
        expect(Favorite.find_by(user: user, favoriteable: task).delete_at).not_to be_nil
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        delete favorites_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
