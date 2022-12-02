# Seed country, region, and city
Region.destroy_all
Country.destroy_all

country = Country.create(name: Faker::Address.country)

5.times do
  country.regions.create(name: Faker::Address.state, code: Faker::Address.state_abbr)
end

Rails.logger.debug "1 Country, 5 Regions, and 10 cities created."

# Seed products and categories
ProductsCategory.destroy_all
Product.destroy_all
Category.destroy_all

5.times do
  category = Category.create(name:        Faker::Commerce.unique.department(max: 1),
                             description: Faker::Marketing.buzzwords)

  2.times do
    product = Product.new(name: Faker::Commerce.unique.product_name,
                          price: Faker::Commerce.price(range: 1000..10_000),
                          description: Faker::Marketing.buzzwords, isactive: true)
    # downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{product.name}")
    # product.image.attach(io: downloaded_image, filename: "m-#{product.name}.jpg")
    product.save

    ProductsCategory.create(product_id: product.id, category_id: category.id)
  end
end

Rails.logger.debug "5 categories and 10 products created."

# AdminUser.create!(
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password') if Rails.env.development?
