require 'rails_helper'
describe Card do
  describe '#create' do
    it "is invalid without a customer_id" do
      card = Card.new(customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      card = Card.new(user_id: "")
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a card_id" do
      card = Card.new(card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("can't be blank")
    end
  end
end
