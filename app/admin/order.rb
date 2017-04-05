ActiveAdmin.register Order do
before_filter only: :index do
  params[:q] = {order_status_id_eq: 2} if params[:commit].blank?
end

# filter :order_status, collection: proc { OrderStatus.all.map{ |c| [c.id] } }

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# index as: :grid, default: true do |product|
#   link_to "sdsd", admin_order_items_path(product)
# end
# 

# index do
# 	column :id
# 	column
# end

 show do |order|

  panel "Customer details" do
    attributes_table_for order.user, :name, :last_name, :email, :card_type, :created_at, :Address
  end

  panel("Products for this order") do
    table_for(order.order_items) do
     	column "Title" do |item| 
            item.menu.title
          end
      column "Quantity" do |item| 
        item.quantity
      end
      column "Quantity" do |item| 
        item.total_price
      end
    end
  end
end



end
