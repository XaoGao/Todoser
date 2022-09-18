require "rails_helper"

RSpec.describe Button::BaseComponent, type: :component do
  subject(:button) { described_class.new(label: test_label, path: test_url, class: "btn btn-primary") }

  let(:test_url) { "/some/url/path" }
  let(:test_label) { "player" }

  describe ".default_classes" do
    it { expect(button.default_classes).to eq("") }
  end

  it "renders base button" do
    render_inline(button)

    expect(page).to have_text(test_label)
    expect(page).to have_link(test_label, href: test_url)
  end
end
