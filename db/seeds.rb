# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# db/seeds.rb

# Apaga todos os registros existentes na tabela shirts
Shirt.destroy_all

# Insere novos registros
Shirt.create([
  # Camisas do Flamengo
  {
    name: "Camisa Oficial do Flamengo 1",
    country: "Brasil",
    team: "Flamengo",
    size: "M",
    price: 179,
    year: "2023",
    description: "Camisa oficial do Flamengo, com escudo bordado e tecnologia dry-fit."
  },
  {
    name: "Camisa Oficial do Flamengo 2",
    country: "Brasil",
    team: "Flamengo",
    size: "G",
    price: 189,
    year: "2022",
    description: "Camisa oficial do Flamengo, edição especial com tecnologia avançada."
  },

  # Camisas do Cruzeiro
  {
    name: "Camisa Oficial do Cruzeiro 1",
    country: "Brasil",
    team: "Cruzeiro",
    size: "P",
    price: 169,
    year: "2023",
    description: "Camisa oficial do Cruzeiro, com tecnologia de ventilação e conforto."
  },
  {
    name: "Camisa Oficial do Cruzeiro 2",
    country: "Brasil",
    team: "Cruzeiro",
    size: "G",
    price: 179,
    year: "2022",
    description: "Camisa oficial do Cruzeiro, edição comemorativa com tecido tecnológico."
  },

  # Camisas do Vasco
  {
    name: "Camisa Oficial do Vasco 1",
    country: "Brasil",
    team: "Vasco",
    size: "M",
    price: 159,
    year: "2023",
    description: "Camisa oficial do Vasco, com detalhes em dourado e tecnologia de secagem rápida."
  },
  {
    name: "Camisa Oficial do Vasco 2",
    country: "Brasil",
    team: "Vasco",
    size: "P",
    price: 169,
    year: "2022",
    description: "Camisa oficial do Vasco, com tecido leve e confortável."
  },

  # Camisas do Corinthians
  {
    name: "Camisa Oficial do Corinthians 1",
    country: "Brasil",
    team: "Corinthians",
    size: "G",
    price: 189,
    year: "2023",
    description: "Camisa oficial do Corinthians, com tecnologia de ventilação e conforto."
  },
  {
    name: "Camisa Oficial do Corinthians 2",
    country: "Brasil",
    team: "Corinthians",
    size: "M",
    price: 179,
    year: "2022",
    description: "Camisa oficial do Corinthians, com tecido leve e resistente."
  },

  # Camisas do Barcelona
  {
    name: "Camisa Oficial do Barcelona 1",
    country: "Espanha",
    team: "Barcelona",
    size: "M",
    price: 199,
    year: "2023",
    description: "Camisa oficial do Barcelona, com tecnologia climacool e tecido respirável."
  },
  {
    name: "Camisa Oficial do Barcelona 2",
    country: "Espanha",
    team: "Barcelona",
    size: "G",
    price: 209,
    year: "2022",
    description: "Camisa oficial do Barcelona, edição especial com tecido avançado."
  },

  # Camisas do Real Madrid
  {
    name: "Camisa Oficial do Real Madrid 1",
    country: "Espanha",
    team: "Real Madrid",
    size: "G",
    price: 219,
    year: "2023",
    description: "Camisa oficial do Real Madrid, com tecnologia dry-fit e tecido premium."
  },
  {
    name: "Camisa Oficial do Real Madrid 2",
    country: "Espanha",
    team: "Real Madrid",
    size: "P",
    price: 229,
    year: "2022",
    description: "Camisa oficial do Real Madrid, edição limitada com detalhes em prata."
  },

  # Camisas do Manchester United
  {
    name: "Camisa Oficial do Manchester United 1",
    country: "Inglaterra",
    team: "Manchester United",
    size: "M",
    price: 189.90,
    year: "2023",
    description: "Camisa oficial do Manchester United, com tecnologia de controle de umidade."
  },
  {
    name: "Camisa Oficial do Manchester United 2",
    country: "Inglaterra",
    team: "Manchester United",
    size: "G",
    price: 199.90,
    year: "2022",
    description: "Camisa oficial do Manchester United, edição especial com tecido ventilado."
  },

  # Camisas da Juventus
  {
    name: "Camisa  Juventus 1",
    country: "Itália",
    team: "Juventus",
    size: "P",
    price: 209.,
    year: "2023",
    description: "Camisa oficial da Juventus, edição comemorativa com tecnologia advanced fit."
  },
  {
    name: "Camisa Juventus 2",
    country: "Itália",
    team: "Juventus",
    size: "M",
    price: 219,
    year: "2022",
    description: "Camisa oficial da Juventus, com detalhes em dourado e tecido de alta performance."
  }
])
