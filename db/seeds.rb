require "csv"

# Seed country, region, and city
# Region.destroy_all
# Country.destroy_all

# country = Country.create(name: Faker::Address.country)

# 5.times do
#  country.regions.create(name: Faker::Address.state, code: Faker::Address.state_abbr)
# end

# Rails.logger.debug "1 Country, 5 Regions, and 10 cities created."

# Seed products and categories
# ProductsCategory.destroy_all
# Product.destroy_all
# Category.destroy_all

# 5.times do
#     category = Category.find_or_create_by!(name: Faker::Commerce.unique.department(max: 1))

#     2.times do
#         product = Product.new(name: Faker::Commerce.unique.product_name,
#                          price: Faker::Commerce.price(range: 1000..10_000),
#                          description: Faker::Marketing.buzzwords, isactive: true)
#         # downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{product.name}")
#         # product.image.attach(io: downloaded_image, filename: "m-#{product.name}.jpg")
#         product.save

#         ProductsCategory.create(product_id: product.id, category_id: category.id)
#     end
# end

# Rails.logger.debug "5 categories and 10 products created."

# csv_file = Rails.root.join('db/products.csv')
# csv_data = File.read(csv_file)

# products = CSV.parse(csv_data, headers: true)

# products.each do |csvproduct|
#     #Create the product
#     product = Product.create!(
#         name: csvproduct['name'],
#         price: csvproduct['price'],
#         description: csvproduct['description'],
#         isactive: csvproduct['isactive']
#     )

#     product.image.attach(
#         io: File.open("#{Rails.root}/db/product_images/#{csvproduct['image']}"),
#         filename: "m-#{product.name}.jpg"
#     )

#     # Create the categories
#     category_names = csvproduct['category']
#     category_names = category_names.split(",")
#     category_names.each do |c|
#         category = Category.find_or_create_by!(name: c)

#         ProductsCategory.create!(product_id: product.id, category_id: category.id)
#     end
# end
# puts "Products CSV imported"

# AdminUser.create!(
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password') if Rails.env.development?
