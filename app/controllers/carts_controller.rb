class CartsController < ApplicationController
	before_action :authenticate_user!
   def show
    @order_items = current_order.order_items
  end

  def checkout
  	@order = current_order
  	@order.update(order_status_id: 2)
  	if(current_user)
      current_user.orders.push(@order)
    end
    if(current_user.name)
      redirect_to :action => 'show'
    end
  end

  def update_user
    current_user.update(:name => params[:name])
    redirect_to :action => 'show'
  end
end
