class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :profile_id
      t.string :industry
      t.string :title
      t.string :company
      t.string :companyimg
      t.string :city
      t.string :state
      t.text :summary
      t.date :startdate
      t.date :enddate
      t.string :status

      t.timestamps null: false
    end
  end
end
