class OrderItemsController < ApplicationController
  # before_action :authenticate_user!
  def create
  	@order = current_order
    previous_orders = @order.order_items.where(:menu_id => params[:menu_id])

    order_present = (previous_orders.count == 0)
     if !order_present
      t = @order.order_items.where(:menu_id => params[:menu_id]).first.quantity
      @order.order_items.where(:menu_id => params[:menu_id]).first.update(quantity: t+1)
      @order_item = @order.order_items

     else
      @order_item = @order.order_items.new(order_item_params)
     end
    
    @order.save
    current_order = @order
    session[:order_id] = @order.id
    # if(current_user)
    #   current_user.orders = @order
    # end
  end

  def update
  	 @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
  	@order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
  def order_item_params
    params.permit(:quantity, :menu_id)
  end
end
