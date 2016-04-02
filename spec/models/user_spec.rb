require 'rails_helper'

RSpec.describe User, type: :model do

  describe "valid user" do
    it "has a valid user" do
     expect(build(:user)).to be_valid
    end
  end

  describe "validations" do
    before { create(:user) }

    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

end
