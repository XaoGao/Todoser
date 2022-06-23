require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project, author: user) }
  let(:task) { create(:task, author: user) }

  describe "POST comments" do
    let(:comment) { build(:comment, body: "Comment for task", author: user, task: task) }

    context "user is sign in" do
      before(:each) do
        sign_in user
      end

      it "returns http success" do
        post comments_path, params: { comment: comment.attributes }
        expect(response).to have_http_status(:success)
      end

      it "create a new comment" do
        post comments_path, params: { comment: comment.attributes }
        expect(Comment.first.body).to eq(comment.body)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        post post comments_path(comment)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
