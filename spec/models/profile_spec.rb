require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "validations" do
    it "is invalid without a profile first name" do
      profile = Profile.new(first_name: "")
      profile.valid?
      expect(profile.errors).to have_key(:first_name)
    end

    it "is invalid without a profile last name" do
      profile = Profile.new(last_name: "")
      profile.valid?
      expect(profile.errors).to have_key(:last_name)
    end

    it "is invalid without a bio" do
      profile = Profile.new(bio: "")
      profile.valid?
      expect(profile.errors).to have_key(:bio)
    end
  end

  describe "methods" do
    let(:user) {create :user}
    let(:profile) {create :profile, user: user}
      it "#full_name returns first name and last name joined" do
        expect(profile.full_name).to eq("Bunny Rabbit")
      end
  end
end
