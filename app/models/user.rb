class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  serialize :urls, JSON

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
