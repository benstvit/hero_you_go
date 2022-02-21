class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.string :location
      t.text :content
      t.string :title
      t.references :users, null: false, foreign_key: true
      t.references :heros, null: false, foreign_key: true

      t.timestamps
    end
  end
end
