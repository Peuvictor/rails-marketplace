class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shirt

  validates :shirt, :user, :payment_method, presence: true
  validates :acquisition_date, presence: true
  private

  def set_default_acquisition_date
    self.acquisition_date ||= Time.now
  end
end
