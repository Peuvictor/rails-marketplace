class CreateShirts < ActiveRecord::Migration[7.1]
  def change
    create_table :shirts do |t|
      t.string :name
      t.string :size
      t.string :color
      t.integer :price
      t.string :country
      t.string :team
      t.integer :year
      t.text :description
      t.text :assessment
      t.integer :rating_assessment
      t.timestamp :creation_date

      t.timestamps
    end
  end
end
