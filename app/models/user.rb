class User < ActiveRecord::Base
  has_secure_password
  has_many :questionnaires
  has_many :questions, through: :questionnaires
  has_many :results
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, message: "Password must be at least 6 characters" }
  devise :omniauthable

  def from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.url = auth_hash['info']['urls'][user.provider.capitalize]
    user.save!
    user
  end
end
