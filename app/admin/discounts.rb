ActiveAdmin.register Discount do
  permit_params :name, :percent, :valid_until, :note, :products

  index do
    selectable_column
    column :id
    column :name
    column :percent
    column :valid_until
    column :note
    column :created_at
    actions
  end
  
  show do
    attributes_table do
      row :name
      row :percent
      row :note
      row :valid_until
      row :created_at
      row "Products" do |d|
        d.products.each do
        end
      end
    end
    active_admin_comments
  end

end
