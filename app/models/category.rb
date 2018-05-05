class Category < ApplicationRecord
  belongs_to :group
  has_many :supplies
  
  delegate :name, to: :group, prefix: :group, allow_nil: true
end
