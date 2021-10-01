class Post < ApplicationRecord
  belongs_to :user

  has_many :commentaries
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize: "300x300"
  end

  validates :title, :cover, :resume, presence: true
end
