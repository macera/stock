class Product < ApplicationRecord
  belongs_to :supply
  belongs_to :shop

  delegate :name, to: :supply, prefix: :supply, allow_nil: true
  delegate :name, to: :shop, prefix: :shop, allow_nil: true

  scope :unused, -> { where(start_date: nil) }
  scope :using, -> { where.not(start_date: nil).where(end_date: nil) }
  scope :fresh, -> { unused.or(Product.using) }
  scope :used, -> { where.not(end_date: nil) }
  scope :less, -> { where(less: true) }

  def self.total_last_purchased_amount(time)
    start = (time - 1.month).beginning_of_month
    finish = start.end_of_month
    where(purchased_date: start .. finish).sum(:price)
  end

  def self.total_purchased_amount(time)
    start = time.beginning_of_month
    finish = time.end_of_month
    where(purchased_date: start .. finish).sum(:price)
  end

  def self.total_using_amount
    using.sum(:price)
  end

end
