ActiveAdmin.register Customer do
  permit_params :firstname, :lastname, :email, :phone, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.input :firstname
      f.input :lastname
      f.input :email
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  
end
