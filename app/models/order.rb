class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shirt

  validates :acquisition_date, presence: true
end
