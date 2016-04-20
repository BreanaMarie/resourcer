class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :friendship_id
      t.datetime :date
      t.string :status
      t.string :location
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
