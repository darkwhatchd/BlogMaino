class Post < ApplicationRecord
  belongs_to :user

  has_many :commentaries

  validates :title, :cover, :resume, presence: true
end
