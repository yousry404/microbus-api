class Offer < ApplicationRecord
  belongs_to :vendor_product
  mount_uploader :thumbnail, ThumbnailUploader


  has_many :source_transactions, class_name: 'Transaction', as: :source
  has_many :refund_consumers, class_name: 'Consumer', through: :source_transactions, source: :destination, source_type: 'Consumer'
  has_many :destination_transactions, class_name: 'Transaction', as: :destination
<<<<<<< HEAD
  has_many :buying_consumers, class_name: 'Consumer', through: :destination_transactions, source: :source, source_type: 'Consumer'
  has_one :vendor, through: :vendor_product

  validates :name, :price, :duration, :description, :target_count, :thumbnail,  presence: true

=======
  has_many :buying_consumers, class_name: 'Consumer', through: :destination_transactions, source: :source, source_type: 'Consumer' do |consumers|
  	def refund
  		transaction do
	  		self.each do |consumer|
	  		consumer.destination_transactions.create! source: proxy_association.owner, amount: proxy_association.owner.price

	  		consumer.deposit(proxy_association.owner.price)
	  		
	  		end
	  	end
  	end  	
  end

  has_one :vendor, through: :vendor_product
  has_one :product, through: :vendor_product
  has_many :wishlist_consumers, through: :product, source: :consumers

  validates :name, :price, :duration, :description, :target_count, :thumbnail,  presence: true

  # scope :active, -> { where(active: true) }

  def increment(amount)


  	self.balance += amount
  	self.save
  end

  def current_balance
  	destination_transactions.sum(:amount)
  end

  def pay_to_vendor
  	self.vendor.deposit(current_balance)
  end
>>>>>>> 67a7963483a4e942e0044eae7bfe08785d15226f

end
