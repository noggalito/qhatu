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

class User < ActiveRecord::Base
  has_many :items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  serialize :urls, JSON
  validates :first_name, presence: true

  def to_s
    username
  end

  def self.find_or_create_by_omniauth(auth)
    User.where(
      uid: auth[:uid],
      provider: auth[:provider]
    ).first_or_initialize.tap do |user|
      user.assign_attributes(
        email: auth.info.email,
        image: auth.info.image,
        first_name: auth.info.name,
        username: auth.info.nickname,
        location: auth.info.location,
        urls: auth.info.urls,
        password: Devise.friendly_token[0,20]
      )
      # because some attributes (like email)
      # may be missing:
      user.save(validate: false)
    end
  end
end
