class OrdersController < ApplicationController
	
	before_action :authenticate_user!
	def index
		@orders = current_user.orders
	end
	def create
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		#binding.pry
		if @order.save
			#binding.pry
			redirect_to orders_path, notice: "your order has confirmed"
		end 
	end

	private 
	def order_params
		params[:order].permit(:address_id)
	end
end
