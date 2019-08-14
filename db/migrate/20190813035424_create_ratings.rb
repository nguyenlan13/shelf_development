class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :rate
      t.references :ratable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
