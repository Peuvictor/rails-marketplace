
class Shirt < ApplicationRecord
  include PgSearch::Model
  has_many_attached :photos

  has_many :orders, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :size, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :country, presence: true
  validates :team, presence: true
  validates :year, presence: true, length: { minimum: 4, maximum: 4 }
  validates :description, presence: true
  attribute :sold, :boolean, default: false

  pg_search_scope :search_by_attributes,
                  against: { name: 'A', description: 'B', country: 'C', team: 'B', year: 'D', size: 'C', color: 'D' },
                  using: { tsearch: { prefix: true } }

end
