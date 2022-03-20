class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  has_rich_text :body

  validates :body, presence: true
end
