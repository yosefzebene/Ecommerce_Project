ActiveAdmin.register Product do
  permit_params :name, :price, :description, :isactive, :discount_id, :image, products_categories_attributes: [:id, :product_id, :category_id, :_destroy] #, pictures: []
  actions :index, :show, :new, :edit, :update

  index do
    selectable_column
    column :id
    column :name
    column "Price" do |p|
      p.price_in_dollar
    end
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
      row "Price" do |p|
        p.price_in_dollar
      end
      row :description
      row :isactive
      row :discount
      row :categories do |c|
        c.categories do |category|
          category.name
        end
      end

      # row :pictures do |p|
      #   (0...p.pictures.count).each do |i|
      #     columns image_tag p.pictures[i].variant(:thumb)
      #   end
      # end

      row :image do |p|
        if p.image.attached?
          image_tag p.image.variant(:thumb)
        end
      end

      row :created_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :discount
      f.input :isactive
    end

    f.inputs do
      f.input :image, as: :file
    end

    # f.inputs do
    #   f.input :pictures, as: :file, input_html: {multiple: true}
    # end
    
    f.has_many :products_categories, allow_destroy: true do |n_f|
      n_f.input :category
    end
    f.actions 
  end

end
