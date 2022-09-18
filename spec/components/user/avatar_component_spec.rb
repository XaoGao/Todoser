require "rails_helper"

RSpec.describe User::AvatarComponent, type: :component do
  subject(:avatar_component) { described_class.new(user: user) }

  let(:user) { build(:user, :with_avatar) }

  describe ".default_class" do
    it { expect(avatar_component.default_class).to eq("") }
  end

  describe ".create_classes" do
    it "return only default class" do
      expect(avatar_component.create_classes).to eq("")
    end

    it "return default css class with option" do
      expect(avatar_component.create_classes({ class: "mb-3" })).to eq("mb-3 ")
    end
  end

  describe ".avatar" do
    context "when user have a avatar" do
      it { expect(avatar_component.avatar.filename).to eq(user.avatar.filename) }
    end

    context "when user have not a avatar" do
      let(:user) { build(:user) }

      it { expect(avatar_component.avatar).to eq("default_avatar.png") }
    end
  end

  it "renders avatar component" do
    render_inline(avatar_component)

    expect(page).to have_css("img[alt='#{user.username}']")
    # TODO: how to test src image ?
    # expect(rendered_component).to have_css("img[src='#{user.avatar.filename}']")
  end
end
