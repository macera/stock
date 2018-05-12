class Supply < ApplicationRecord
  belongs_to :category
  has_many :products
  
  delegate :name, to: :category, prefix: :category, allow_nil: true

  scope :fresh, -> {
    Supply.joins(:products).merge(Product.fresh)
  }

  scope :stockouts, -> (category_id){
    query = Supply.left_outer_joins(:products)
    result = query.where.not(id: Supply.joins(:products).where(products: {end_date: nil}).ids)
    .or(query.where('products.less' => true))
    .distinct
    if category_id.present?
      result.where(category_id: category_id)
    else
      result
    end
  }
  #.or(Supply.left_outer_joins(:products).where(products: {supply_id: nil}))

  def last_amount
    products.last.try(:price)
  end

  def average_price
    if products.present?
      products.average(:price).floor
    else
      price
    end
  end
end
