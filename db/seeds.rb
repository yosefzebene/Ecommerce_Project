require "csv"

# Seed country, regions and taxes
TaxRate.destroy_all
Region.destroy_all
Country.destroy_all

csv_file = Rails.root.join("db/province_taxes.csv")
csv_data = File.read(csv_file)

provinces = CSV.parse(csv_data, headers: true)

provinces.each do |province|
  country = Country.find_or_create_by!(name: province["country"])

  region = country.regions.create(name: province["province"], code: province["code"])

  TaxRate.create(region_id: region.id, GST: province["gst"], PST: province["pst"],
                 HST: province["hst"])
end

Rails.logger.debug "Provinces and tax rates imported from CSV"

# Seed products and categories
ProductsCategory.destroy_all
Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join("db/products.csv")
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |csvproduct|
  # Create the product
  product = Product.create!(
    name:        csvproduct["name"],
    price:       csvproduct["price"],
    description: csvproduct["description"],
    isactive:    csvproduct["isactive"]
  )

  image = File.open("#{Rails.root}/db/product_images/#{csvproduct['image']}")
  sleep(0.2)

  product.image.attach(
    io:       image,
    filename: "m-#{product.name}.jpg"
  )

  # Create the categories
  category_names = csvproduct["category"]
  category_names = category_names.split(",")
  category_names.each do |c|
    category = Category.find_or_create_by!(name: c)

    ProductsCategory.create!(product_id: product.id, category_id: category.id)
  end
end

Rails.logger.debug "Products CSV imported"

# Seed Status
Status.destroy_all

Status.create(name: "New", description: "Newly created orders without payment confirmation.")
Status.create(name: "Paid", description: "Payment have been confirmed by stripe.")
Status.create(name: "Shipped", description: "Order has been shipped.")

# AdminUser.create!(
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password') if Rails.env.development?
