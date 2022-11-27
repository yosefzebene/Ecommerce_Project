ActiveAdmin.register TaxRate do
  permit_params :region_id, :GST, :PST, :HST
  
end
