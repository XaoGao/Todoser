require "rails_helper"

RSpec.describe Favorites::FavoriteComponent, type: :component do
  let(:user) { create(:user) }
  let(:favoriteable) { create(:task) }
  subject(:favorite_component) { described_class.new(favoriteable: favoriteable) }

  before do
    Current.user = user
  end

  before do
    def favoriteable.favorited
      true
    end
  end

  describe ".type" do
    it { expect(favorite_component.type).to eq("Task") }
  end

  describe ".id" do
    it { expect(favorite_component.id).to eq(favoriteable.id) }
  end

  describe ".classes" do
    it "when is not favorited" do
      def favoriteable.favorited
        false
      end
      expect(favorite_component.classes).to eq("fa-regular fa-star")
    end

    it "when already favorited" do
      create(:favorite, user: user, favoriteable: favoriteable)
      expect(favorite_component.classes).to eq("fa-solid fa-star favorited")
    end
  end
end
