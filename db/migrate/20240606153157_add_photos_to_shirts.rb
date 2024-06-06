class AddPhotosToShirts < ActiveRecord::Migration[7.1]
  def change
    add_column :shirts, :photos, :jsonb
  end
end
