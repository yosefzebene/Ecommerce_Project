ActiveAdmin.register TaxRate do
  permit_params :region, :region_id, :GST, :PST, :HST

  form do |f|
    f.semantic_errors
    f.inputs do 
      f.input :region, input_html: { disabled: true } 
      f.input :GST
      f.input :PST
      f.input :HST
    end
    f.actions 
  end
end
