ActiveAdmin.register Order do
  permit_params :customer_id, :PST, :GST, :HST, :subtotal, :status_id,  order_products_attributes: [:id, :order_id, :product_id, :quantity, :_destroy]

  index do
    selectable_column
    column :id
    column :customer
    # This needs to be in the model
    column "Tax" do |p|
      p.total_tax
    end
    column "Subtotal" do |p|
      p.subtotal_in_dollar
    end
    column "Total" do |p|
      p.calculated_total
    end
    column :status
    actions
  end

  show do
    attributes_table do
      row :customer
      row "Products" do |p|
        p.products
      end
      row :PST
      row :GST
      row :HST
      row "Subtotal" do |p|
        p.subtotal_in_dollar
      end
      row "Total" do |p|
        p.calculated_total
      end
      row :status
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do 
      f.input :customer
      f.input :PST
      f.input :GST
      f.input :HST
      if f.object.new_record?
        f.input :status
      end
    end

    f.has_many :order_products, allow_destroy: true do |n_f|
      n_f.input :product
      n_f.input :quantity
    end
    f.actions 
  end
end
