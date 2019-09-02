class Account < ApplicationRecord
  belongs_to :user
  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums
  validates :account_name, presence: true
end
