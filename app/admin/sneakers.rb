ActiveAdmin.register Sneaker do
  permit_params :brand_id, :category_id, :designer_id, :main_colour, :colour_way, :gender, :grid_picture, :main_picture, :midsole, :name, :nickname, :release_date, :price_cents, :shoe_story, :upper_material
end
