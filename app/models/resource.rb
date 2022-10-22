class Resource < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :tags
end
