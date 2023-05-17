class OrderController < ApplicationController

	def show
		# Find the order based on the provided ID
		@order = Order.find(params[:id])
		render 'orders/show'
	end

	def buy
		# Create a new OrderDetail instance based on the provided parameters
		@order_details = OrderDetail.buy(order_details_params)
		respond_to do |format|
			if @order_details.save
				# Retrieve the associated post for the order detail
				post = @order_details.post

				# Calculate the updated stock after the purchase
				stock = post.stock - @order_details.quantity

				# Update the stock of the associated post
				post.update(stock: stock)

				format.html { redirect_to order_path(@order_details.order_id), notice: "Compra realizada con exito" }
				format.json { render :show, status: :created, location: order_details }
			else
				format.html do
					if @order_details.errors[:quantity].any?
					  redirect_to post_url(@order_details.post), status: :unprocessable_entity, alert: @order_details.errors[:quantity][0]
					else
					  redirect_to carts_path, status: :unprocessable_entity, alert: "Error creating order details"
					end
				  end
				  format.json { render json: @order_details.errors, status: :unprocessable_entity }
				end
			  end
			end

	private
		def order_details_params
			# Whitelist the required parameters for the order details
			params.require(:order_details).permit(:quantity, :post_id, :price, :user_id)
		end
end
