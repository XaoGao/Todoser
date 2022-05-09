require "rails_helper"

RSpec.describe Flash::FlashComponent, type: :component do
  subject(:flash_component) { described_class.new({}) }

  describe ".flash_class" do
    it "notice type" do
      expect(flash_component.flash_class("notice")).to eq("alert alert-success alert-dismissible")
    end

    it "alert type" do
      expect(flash_component.flash_class("alert")).to eq("alert alert-danger alert-dismissible")
    end
  end

  describe "render" do
    let(:flash_message) { "Test message" }
    subject(:flash_component) { described_class.new({ notice: flash_message }) }

    it "renders base button" do
      render_inline(flash_component)
      expect(rendered_component).to have_text(flash_message)
    end
  end
end
