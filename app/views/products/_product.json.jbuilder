json.extract! product, :id, :name, :price, :purchased_date, :start_date, :end_date, :quantity, :quantity_type, :less, :memo, :supply_id, :shop_id, :created_at, :updated_at
json.url product_url(product, format: :json)
