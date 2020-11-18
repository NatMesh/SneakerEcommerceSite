#needed to gain access to json methods and properties in rails
require "json"

#We delete Sneaker first as to avoid causing any orphan foreign key issues
Sneaker.delete_all
Brand.delete_all
Category.delete_all
Designer.delete_all


#This gives us the full root path of our project along with the path for our json file with sneaker data
filename = Rails.root.join("db/sneakers_dataset.json")
puts "Loading Sneakers from the JSON file: #{filename}"

#grabs our json file to use
json_data = File.read(filename)
#parses our data into a variable so it is readable to Ruby on Rails
sneakers = JSON.parse(json_data)

#test variable to use as counter in loop
x = 0

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
    x = x + 1
    #this will let us know which record had issues being created if something goes wrong
    puts "Invalid sneaker #{s["name"]}" unless sneaker&.valid?
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
puts "Created #{x} sneakers"
puts "Created #{Sneaker.count} Sneakers"