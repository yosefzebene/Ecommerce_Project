ActiveAdmin.register Product do
  permit_params :name, :price, :description, :isactive, :discount_id, :image, products_categories_attributes: [:id, :product_id, :category_id, :_destroy]

  index do
    selectable_column
    column :id
    column :name
    column :price
    column :description
    column :isactive
    column :discount
    column :categories do |c|
      c.categories do |category|
        category.name
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :isactive
      row :discount
      row :categories do |c|
        c.categories do |category|
          category.name
        end
      end
      row :image do |preview|
        image_tag preview.image.variant(:thumb)
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.has_many :products_categories, allow_destroy: true do |n_f|
      n_f.input :category
    end
    f.actions 
  end

end
