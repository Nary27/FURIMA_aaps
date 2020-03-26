require 'rails_helper'

describe Item do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a name that has more than 41 characters" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "is valid with a name that has less than 40 characters " do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end

    it "is invalid without a text" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    it "is invalid without a cost" do
      item = build(:item, cost: nil)
      item.valid?
      expect(item.errors[:cost]).to include("can't be blank")
    end

    it "is invalid without a situation" do
      item = build(:item, situation: nil)
      item.valid?
      expect(item.errors[:situation]).to include("can't be blank")
    end

    it "is invalid without a deliver_area" do
      item = build(:item, deliver_area: nil)
      item.valid?
      expect(item.errors[:deliver_area]).to include("can't be blank")
    end

    it "is invalid without a shipping_term" do
      item = build(:item, shipping_term: nil)
      item.valid?
      expect(item.errors[:shipping_term]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid with a price that has less than 299" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "is valid with a price that has more than 300" do
      item = build(:item, price: 300)
      item.valid?
      expect(item).to be_valid
    end

    it "is valid with a price that has less than 9999999" do
      item = build(:item, price: 9999999)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid with a price that has more than 10000000" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

  end

  describe '#edit' do
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a name that has more than 41 characters" do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "is valid with a name that has less than 40 characters " do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end

    it "is invalid without a text" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    it "is invalid without a cost" do
      item = build(:item, cost: nil)
      item.valid?
      expect(item.errors[:cost]).to include("can't be blank")
    end

    it "is invalid without a situation" do
      item = build(:item, situation: nil)
      item.valid?
      expect(item.errors[:situation]).to include("can't be blank")
    end

    it "is invalid without a deliver_area" do
      item = build(:item, deliver_area: nil)
      item.valid?
      expect(item.errors[:deliver_area]).to include("can't be blank")
    end

    it "is invalid without a shipping_term" do
      item = build(:item, shipping_term: nil)
      item.valid?
      expect(item.errors[:shipping_term]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid with a price that has less than 299" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "is valid with a price that has more than 300" do
      item = build(:item, price: 300)
      item.valid?
      expect(item).to be_valid
    end

    it "is valid with a price that has less than 9999999" do
      item = build(:item, price: 9999999)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid with a price that has more than 10000000" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end
  end
end