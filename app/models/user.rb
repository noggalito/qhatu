class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:twitter]

  def self.find_or_create_by_omniauth(auth)
    user = User.where(provider: auth[:provider], uid: auth[:uid]).first
    unless user = User.create(
         first_name: auth[:nombre],
         username: auth[:username],
         email:auth[:email],
         uid: auth[:uid],
         provider: auth[:provider],
         password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
