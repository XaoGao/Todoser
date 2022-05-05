require "rails_helper"

RSpec.describe Flash::FlashComponent, type: :component do
  subject(:subject) { described_class.new }

  describe ".flash_class" do
    it "notice type" do
      expect(subject.flash_class("notice")).to eq("alert alert-success alert-dismissible")
    end

    it "alert type" do
      expect(subject.flash_class("alert")).to eq("alert alert-danger alert-dismissible")
    end
  end
end
