class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :friendship_id
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
