class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :hosts
      t.integer :year
    end
  end
end
