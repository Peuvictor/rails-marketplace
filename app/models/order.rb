class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shirt

  enum payment_method: {
    credit_card: 0,
    bank_slip: 1,
    pix: 2
  }

  attribute :payment_method, :integer

  validates :payment_method, presence: true

  private

  def set_default_acquisition_date
    self.acquisition_date ||= Time.now
  end
end
