require 'rails_helper'

describe Photo do
  describe '#create' do
    
    it "is invalid without a url" do
      image = build(:photo, url: nil)
      image.valid?
      expect(image.errors[:url]).to include("can't be blank")
    end

  end

  describe '#edit' do
    
    it "is invalid without a url" do
      image = build(:photo, url: nil)
      image.valid?
      expect(image.errors[:url]).to include("can't be blank")
    end

  end
end