class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: Blacklist
  
  has_many :subscriptions, dependent: :destroy
  has_many :accounts, dependent: :destroy
  validates :username, presence: true
  validates :email, presence: true
end
