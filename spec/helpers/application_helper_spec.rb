require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe ".flash_class" do
    it "notice type" do
      expect(flash_class("notice")).to eq("alert alert-success alert-dismissible")
    end

    it "alert type" do
      expect(flash_class("alert")).to eq("alert alert-danger alert-dismissible")
    end
  end
end
