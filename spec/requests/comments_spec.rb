require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /comments/" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:project) { create(:project, author: user) }
      let(:task) { create(:task, author: user) }
      let(:comment) { build(:comment, author: user, commentable: task) }

      before(:each) do
        sign_in user
      end

      it "returns http success" do
        post comments_path, params: { commentable_type: comment.class, commentable_id: comment.id }
        expect(response).to have_http_status(:success)
      end

      it "create a new comment" do
        post comments_path, params: { commentable_type: comment.class, commentable_id: comment.id }
        expect(Comment.first.body).to eq(comment)
      end
    end

    context "user is not sign in" do
      it "returns redirect to sign in page" do
        post comments_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "PUT /comments/:id" do
    context "user is sign in" do
      let(:user) { create(:user) }
      let(:task) { create(:task) }
      let(:comment) { create(:comment, body: "first text") }

      before(:each) do
        sign_in(user)
      end

      it "success updated comment" do
        put comment_path(comment), params: { comment: { body: "second value", commentable_type: task.class, commentable_id: task.id} }

        updated_comment = Comment.find(comment.id)

        expect(updated_comment.body).to eq("second value")
      end

      it "return success http response" do
        put comment_path(comment), params: { comment: { body: "second value", commentable_type: task.class, commentable_id: task.id} }

        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
