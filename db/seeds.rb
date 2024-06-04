# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Shirt.create!(name: 'Camisa Cruzeiro', size: "GG", color: "Azul", price:  300, country: "Brasil", team: "Cruzeiro", year: 2023, description: "Uniforme III Cruzeiro 2023", rating_assessment: 10)
Shirt.create!(name: 'Camisa Vasco', size: "GG", color: "Azul", price: 400, country: "Brasil", team: "Vasco", year: 2010, description: "Uniforme III Cruzeiro 2023", rating_assessment: 10)
