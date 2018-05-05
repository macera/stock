class Product < ApplicationRecord
  belongs_to :supply
  belongs_to :shop

  delegate :name, to: :supply, prefix: :supply, allow_nil: true
  delegate :name, to: :shop, prefix: :shop, allow_nil: true

  scope :unused, -> { where(start_date: nil) }
  scope :using, -> { where.not(start_date: nil).where(end_date: nil) }
  scope :fresh, -> { unused.or(Product.using) }
  scope :used, -> { where.not(end_date: nil) }
end
