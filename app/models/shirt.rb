class Shirt < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders

  validates :name, presence: true, length: { minimum: 3 }
  validates :size, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :country, presence: true
  validates :team, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :rating_assessment, presence: true
end
