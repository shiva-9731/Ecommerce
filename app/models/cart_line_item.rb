class CartLineItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	validates_presence_of :user_id, :product_id, :quantity

	def save_or_update
		line_item = CartLineItem.find_by(user_id: self.user_id, product_id: self.product_id)
		if line_item.nil?
			self.save
		else
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)
		end
	end
end
