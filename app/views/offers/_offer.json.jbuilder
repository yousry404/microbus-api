json.extract! offer, :id, :name, :price, :duration, :description, :target_count, :vendor_product_id, :balance, :created_at, :updated_at
json.product_name offer.vendor_product.product.name
json.thumbnail "http://localhost:3000#{offer.thumbnail}"
json.seller offer.vendor.name
# json.product_id offer.vendor_product.product.id