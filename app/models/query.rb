class Query < ApplicationRecord
  has_many :comments, as: :commentable
end
