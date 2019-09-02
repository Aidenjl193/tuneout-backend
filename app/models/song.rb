class Song < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :album
  has_one_attached :file
  validates :name, presence: true

  def file=(file)
    self.update({name: file.original_filename})
    self.file.attach(file)
  end

  def song_url
    if(self.file.attached?)
      return rails_blob_path(self.file, only_path: true)
    end
  end
end
