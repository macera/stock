class Supply < ApplicationRecord
  belongs_to :category
  has_many :products
  
  delegate :name, to: :category, prefix: :category, allow_nil: true
end
