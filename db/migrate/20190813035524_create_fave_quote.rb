class CreateFaveQuote < ActiveRecord::Migration[5.2]
  def change
    create_table :fave_quote do |t|
      t.integer :user_id
      t.text :quote
      t.references :quotable, polymorphic: true, index: true
    end
  end
end
