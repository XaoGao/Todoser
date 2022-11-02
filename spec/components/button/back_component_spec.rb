require "rails_helper"

RSpec.describe Button::BackComponent, type: :component do
  subject(:button) { described_class.new(label: test_label, path: test_url) }

  let(:test_url) { "/some/url/path" }
  let(:test_label) { "back" }

  describe ".back_path" do
    subject(:button) { described_class.new(option) }

    let(:option) { { path: "some_path", class: "btn btn-primary" } }

    it "path is set" do
      expect(button.back_path(option)).to eq("some_path")
    end

    it "path is not set" do
      option[:path] = nil
      expect(button.back_path(option)).to eq(:back)
    end
  end

  describe ".default_classes" do
    it { expect(button.default_classes).to eq("btn btn-primary") }
  end

  describe "render" do
    it "renders back button" do
      render_inline(button)

      expect(page).to have_text(test_label)
      expect(page).to have_link(test_label, href: test_url)
    end
  end
end
