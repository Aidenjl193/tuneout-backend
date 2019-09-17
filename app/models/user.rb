class User < ApplicationRecord
  require 'Blacklist'
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: Blacklist
  
  has_many :subscriptions, dependent: :destroy
  has_many :accounts, dependent: :destroy
  validates :username, presence: true
  validates :email, presence: true
end
