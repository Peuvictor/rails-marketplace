class Shirt < ApplicationRecord
  has_many :orders
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3 }
  validates :size, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :country, presence: true
  validates :team, presence: true
  validates :year, presence: true
  validates :description, presence: true
end
