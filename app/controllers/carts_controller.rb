class CartsController < ApplicationController
	def index
	  # Fetch the carts for the current user, ordered by creation date in descending order
	  @carts = Cart.user(current_user).order('created_at DESC')

	  # Calculate the total for the cart
	  @total = Cart.total(current_user)

	  # Render the 'index' view
	  render 'carts/index'
	end

	def show
	  # Find the cart by ID
	  @cart = Cart.find(params[:id])

	  # Calculate the total for the cart
	  @total = Cart.total(current_user)

	  # Get the products in the cart for the current user
	  @products = Cart.products(current_user)

	  # Render the 'show' view
	  render 'carts/show'
	end

	def add
	  # Create a new cart object with the provided parameters
	  @carts = Cart.new(carts_params)

	  respond_to do |format|
		if @carts.save
		  format.html { redirect_to show_product_cart_path(@carts), notice: "Los productos se agregaron al carrito con exito" }
		  format.json { render :show, status: :created, location:carts }
		else
		  format.html { redirect_to post_url(Post.find(@carts.post_id)), status: :unprocessable_entity, alert: @carts.errors[:quantity][0] }
		  format.json { render json: @carts.errors, status: :unprocessable_entity }
		end
	  end
	end

	def buy
	  # Call a method to handle the purchase of the cart items for the current user
	  Cart.buy(current_user)

	  respond_to do |format|
		format.html { redirect_to carts_path, notice: "Los productos se compraron con exito" }
	  end
	end

	def delete
	  # Find the cart by ID
	  @cart = Cart.find(params[:id])

	  # Call a method to delete the cart
	  Cart.eliminate(@cart.id)

	  # Redirect to the carts index page
	  redirect_to carts_path, status: :see_other
	end

	private

	def carts_params
	  # Specify the allowed parameters for the cart
	  params.require(:carts).permit(:id, :quantity, :post_id, :price, :user_id)
	end
  end
