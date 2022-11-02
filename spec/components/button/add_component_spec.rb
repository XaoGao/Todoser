require "rails_helper"

RSpec.describe Button::AddComponent, type: :component do
  subject(:button) { described_class.new(label: test_label, path: test_url) }

  let(:test_url) { "/some/url/path" }
  let(:test_label) { "add" }

  describe ".default_classes" do
    it { expect(button.default_classes).to eq("btn btn-primary") }
  end

  it "renders delete button" do
    render_inline(button)

    expect(page).to have_text(test_label)
    expect(page).to have_link(test_label, href: test_url)
  end
end
