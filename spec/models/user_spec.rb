require 'rails_helper'
describe User do
  describe '#create' do
    it 'is invalid without a email' do
      user = User.new(nickname:"aaa", email: "", password: "00000000", password_confirmation: "00000000",lastname_kanji:"aaa",firstname_kanji:"aaa",lastname_katakana:"アアア",firstname_katakana:"アアア",birth_year:"2000",birth_month:"3",birth_day:"22",tel:"1234567891") 
      address = Address.new(postcode:"123456",prefecture:"愛知県",cities:"名古屋市",blocks:"中区",builds:"aaaa")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  it 'is invalid without a password' do
    user = User.new(nickname:"aaa", email: "kkk@gmail.com", password: "", password_confirmation: "00000000",lastname_kanji:"aaa",firstname_kanji:"aaa",lastname_katakana:"アアア",firstname_katakana:"アアア",birth_year:"2000",birth_month:"3",birth_day:"22",tel:"1234567891") 
    address = Address.new(postcode:"123456",prefecture:"愛知県",cities:"名古屋市",blocks:"中区",builds:"aaaa")
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
    end

  it 'is invalid without a lastname_kanji' do
    user = User.new(nickname:"aaa", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",lastname_kanji:"",firstname_kanji:"aaa",lastname_katakana:"アアア",firstname_katakana:"アアア",birth_year:"2000",birth_month:"3",birth_day:"22",tel:"1234567891") 
    address = Address.new(postcode:"123456",prefecture:"愛知県",cities:"名古屋市",blocks:"中区",builds:"aaaa")
    user.valid?
    # expect(user).to be_valid
    expect(user.errors[:lastname_kanji]).to include("can't be blank")
    end
  
  end