class User < ActiveRecord::Base
  has_secure_password
  has_many :questionnaires
  has_many :questions, through: :questionnaires
  has_many :results, through: :questionnaires
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, message: "Password must be at least 6 characters" }
end
