class Post < ApplicationRecord
  belongs_to :user

  has_many :commentaries, dependent: :destroy

  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize: "300x300"
  end

  has_rich_text :body

  validates :title, :cover, presence: true
  validates :resume, length: {minimum:100, maximum:1000}, presence: true
end
