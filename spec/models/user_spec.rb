# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  first_name             :string
#  last_name              :string
#  username               :string
#  image                  :string
#  location               :string
#  urls                   :text
#

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

  describe "Relations" do
    it "should have many items" do
      t = User.reflect_on_association(:items)
      expect(t.macro).to eq(:has_many)
    end
  end

end
