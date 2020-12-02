#needed to gain access to json methods and properties in rails
require "json"

#We delete Sneaker first as to avoid causing any orphan foreign key issues
Customer.delete_all
Province.delete_all
SneakerSize.delete_all
SizeRange.delete_all
Sneaker.delete_all
Brand.delete_all
Category.delete_all
Designer.delete_all
AdminUser.delete_all


#This gives us the full root path of our project along with the path for our json file with sneaker data
filename = Rails.root.join("db/sneakers_dataset.json")
puts "Loading Sneakers from the JSON file: #{filename}"

#grabs our json file to use
json_data = File.read(filename)
#parses our data into a variable so it is readable to Ruby on Rails
sneakers = JSON.parse(json_data)

#test variable to use as counter in loop
x = 0

#Array of hashes with province information
collection_of_provinces = [
  {
    "name": "Alberta",
    "pst": 0,
    "gst": 5,
    "hst": 0
  },
  {
    "name": "British Columbia",
    "pst": 7,
    "gst": 5,
    "hst": 0
  },
  {
    "name": "Manitoba",
    "pst": 7,
    "gst": 5,
    "hst": 0
  },
  {
    "name": "New Brunswick",
    "pst": 0,
    "gst": 0,
    "hst": 15
  },
  {
    "name": "Newfoundland and Labrador",
    "pst": 0,
    "gst": 0,
    "hst": 15
  },
  {
    "name": "Northwest Territories",
    "pst": 0,
    "gst": 5,
    "hst": 0
  },
  {
    "name": "Nova Scotia",
    "pst": 0,
    "gst": 0,
    "hst": 15
  },
  {
    "name": "Nunavut",
    "pst": 0,
    "gst": 5,
    "hst": 0
  },
  {
    "name": "Ontario",
    "pst": 0,
    "gst": 0,
    "hst": 13
  },
  {
    "name": "Prince Edward Island",
    "pst": 0,
    "gst": 0,
    "hst": 15
  },
  {
    "name": "Quebec",
    "pst": 9975,
    "gst": 5,
    "hst": 0
  },
  {
    "name": "Sasketchewan",
    "pst": 6,
    "gst": 5,
    "hst": 0
  },
  {
    "name": "Yukon",
    "pst": 0,
    "gst": 5,
    "hst": 0
  }
]

#populates our provinces table with data from collection_of_provinces
collection_of_provinces.each do |p|
  #
  #puts "#{p}"
  province = Province.create(
    name:                   p[:name],
    provincial_sales_tax:   p[:pst],
    goods_and_services_tax: p[:gst],
    harmonized_sales_tax:   p[:hst]
  )
  #helps show error handling
  #province.errors.each { |attr, msg| puts "#{attr} - #{msg}\n" }

end

sneakers["sneakers"].each do |s|
  #Use by find_or_create_by() when dealing with models with unique validations over .create()
    #Best used when you have data that needs to be unique
  brand    = Brand.find_or_create_by(name: s["brand_name"])
  designer = Designer.find_or_create_by(name: s["designer"])
  category = Category.find_or_create_by(name: s["category"][0])

  if brand&.valid? && designer&.valid? && category&.valid?
    #if the above validations pass we can then create our sneaker record to be persisted
    sneaker = Sneaker.create(
      brand_id:        brand.id,
      designer_id:     designer.id,
      category_id:     category.id,
      main_colour:     s["color"],
      colour_way:      s["details"],
      gender:          s["gender"][0],
      grid_picture:    s["grid_picture_url"],
      main_picture:    s["main_picture_url"],
      midsole:         s["midsole"],
      name:            s["name"],
      nickname:        s["nickname"],
      release_date:    s["release_date"],
      price_cents:     s["retail_price_cents"],
      shoe_story:      s["story_html"],
      upper_material:  s["upper_material"]
    )
    #x = x + 1
    #this will let us know which record had issues being created if something goes wrong
    unless sneaker&.valid?
      puts "Invalid sneaker #{s["name"]}"
      next
    end

    #populate our size_range table and joiner table sneaker_size
    size_ranges = s["size_range"]
    size_ranges.each do |sr|
      #NOTE size ranges is the name of the table storing all of the possible shoe sizes
      size_range = SizeRange.find_or_create_by(size_number: sr)
      #NOTE SneakerSize is the name of the joiner table storing all the shoes matched with their available size
      SneakerSize.create(sneaker: sneaker, size_range: size_range)
    end

  else
    puts "Either invalid brand, designer or category"
    puts "Brand name: #{s["brand_name"]} for the #{s["name"]}"
    puts "Designer name: #{s["designer"]} for the #{s["name"]}"
    puts "Category name: #{s["category"][0]} for the #{s["name"]}"
  end
end

puts "Created #{Brand.count} Brands"
puts "Created #{Designer.count} Designers"
puts "Created #{Category.count} Categories"
puts "Created #{Sneaker.count} Sneakers"
#NOTE size ranges is the name of the table storing all of the possible shoe sizes
puts "Created #{SizeRange.count} Size Ranges of possible shoe sizes"
#joiner table of sneakers and sizeranges(available shoe sizes)
puts "Created #{SneakerSize.count} Sneaker sizes based on what is available"
puts "Created #{Province.count} provinces"
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end