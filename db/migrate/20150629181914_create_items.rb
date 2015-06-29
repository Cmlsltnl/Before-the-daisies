class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :location
      t.boolean :completed
      t.integer :importance
      t.datetime :completed_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
