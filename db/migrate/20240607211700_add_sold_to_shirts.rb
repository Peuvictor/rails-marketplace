class AddSoldToShirts < ActiveRecord::Migration[7.1]
  def change
    add_column :shirts, :sold, :boolean
  end
end
