ActiveAdmin.register Customer do
  permit_params :firstname, :lastname, :email, :phone, :password, :password_confirmation, locations_attributes: [:id, :customer_id, :address, :postalcode, :city, :region_id, :_destroy]

  show do
    attributes_table do
      row :firstname
      row :lastname
      row :email
      row :phone
      row :created_at
      row "Locations" do |p|
        p.locations.each do |location|
          h3 location.address + ", " + location.city + ", " + location.region.name  + ", " + location.region.country.name + " | " + location.postalcode
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :firstname
      f.input :lastname
      f.input :email
      f.input :phone

      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end

    f.has_many :locations, allow_destroy: true do |n_f|
      n_f.input :address
      n_f.input :postalcode
      n_f.input :city
      n_f.input :region
    end
    f.actions
  end
  
end
