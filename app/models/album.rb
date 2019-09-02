require 'json'

class Album < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :account
  has_many :songs, dependent: :destroy
  has_one_attached :cover
  validates :name, presence: true

  def songs=(songs)
    songs.each do |song|
     self.songs.build({file: song}).save
    end
  end

  def cover=(cover)
     self.cover.attach(cover)
  end

  def cover_art
    if(self.cover.attached?)
      return rails_blob_path(self.cover, only_path: true)
    end
  end
end
