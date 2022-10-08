require "rails_helper"

RSpec.describe Flash::FlashComponent, type: :component do
  subject(:flash_component) { described_class.new(flash: {}) }

  describe ".flash_class" do
    it "notice type" do
      expect(flash_component.flash_class("notice")).to eq("alert alert-success alert-dismissible")
    end

    it "alert type" do
      expect(flash_component.flash_class("alert")).to eq("alert alert-danger alert-dismissible")
    end
  end

  describe "render" do
    subject(:flash_component) { described_class.new(flash: { notice: flash_message }) }

    let(:flash_message) { "Test message" }

    it "renders flash text" do
      render_inline(flash_component)
      expect(page).to have_text(flash_message)
    end
  end
end
