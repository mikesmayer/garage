class Artist < ActiveRecord::Base

  has_attached_file :avatar,
                    :styles => { :medium => "920x327#", :thumb => "180x180#" },
                    url: ":class/:id/:style/:filename",
                    path: ":rails_root/public/:url"

  validates :name, :description, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates_attachment :avatar, content_type: { content_type: %r{image/*} }

  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :audios, dependent: :destroy
end
