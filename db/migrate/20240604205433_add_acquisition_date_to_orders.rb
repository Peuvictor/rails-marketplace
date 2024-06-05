class AddAcquisitionDateToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :acquisition_date, :date
  end
end
