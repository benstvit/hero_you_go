class CreateHeros < ActiveRecord::Migration[6.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
