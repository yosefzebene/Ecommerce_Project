ActiveAdmin.register Product do

  permit_params :name, :price, :description, :image

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :image do |ad|
        image_tag ad.image.variant(:thumb)
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
    f.actions 
  end

end
