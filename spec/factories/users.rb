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

FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "User #{n}" }
    sequence(:email) { |n| "user-#{n}@qhatu.org" }
    sequence(:password) { |n| "user-password-#{n}" }
    password_confirmation { password }
  end
end
