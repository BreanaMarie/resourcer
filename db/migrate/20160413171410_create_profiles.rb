class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :state
      t.integer :phone
      t.string :image
      t.text :bio

      t.timestamps null: false
    end
  end
end
