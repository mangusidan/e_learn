class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook];  
  
  has_one_attached :avatar;
  
  has_many :followed_users,
           foreign_key: :follower_id,
           class_name: 'Relationship',
           dependent: :destroy

  has_many :followees, through: :followed_users, dependent: :destroy

  has_many :following_users,
           foreign_key: :followee_id,
           class_name: 'Relationship',
           dependent: :destroy

  has_many :followers, through: :following_users, dependent: :destroy
  
  has_many :lessons

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).frist_of_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.username
      user.image = auth.info.image
    end
  end
end
