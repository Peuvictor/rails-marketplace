class AddUserToShirts < ActiveRecord::Migration[7.1]
  def change
    add_reference :shirts, :user, null: false, foreign_key: true
  end
end
