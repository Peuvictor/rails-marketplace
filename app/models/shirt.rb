
class Shirt < ApplicationRecord
  include PgSearch::Model
  has_one_attached :photo

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

  pg_search_scope :search_by_attributes,
                  against: { name: 'A', description: 'B', country: 'C', team: 'B', year: 'D', size: 'C', color: 'D' },
                  using: { tsearch: { prefix: true } }

end
