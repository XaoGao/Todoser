require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  before do
    create_list(:user, 26)
  end

  describe "GET /admin/users" do
    it "http status success" do
      get admin_users_path
      expect(response).to have_http_status(:success)
    end

    it "displays 25 users on the first page" do
      visit admin_users_path
      expect(page).to have_selector("tbody tr", count: 25)
    end

    it "displays 1 user on the second page" do
      visit admin_users_path
      click_link "2"
      expect(page).to have_selector("tbody tr", count: 1)
    end
  end
end
